<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Pesanan;
use App\Models\PesananDetail;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade\Pdf;

class LaporanController extends Controller
{
    /**
     * Get summary data for dashboard
     */
    public function getSummary(Request $request)
    {
        try {
            $startDate = $request->get('start_date', Carbon::now()->subDays(30)->format('Y-m-d'));
            $endDate = $request->get('end_date', Carbon::now()->format('Y-m-d'));
            $status = $request->get('status');

            $query = Pesanan::whereBetween('tanggal_pesan', [$startDate, $endDate]);

            if ($status && $status !== 'semua') {
                $query->where('status', $status);
            }

            $totalPesanan = $query->count();

            // Calculate total revenue (only from completed orders)
            $totalPendapatan = Pesanan::whereBetween('tanggal_pesan', [$startDate, $endDate])
                ->whereIn('status', ['completed', 'selesai'])
                ->with('detail')
                ->get()
                ->sum(function ($pesanan) {
                    return $pesanan->detail->sum('subtotal');
                });

            return response()->json([
                'total_pesanan' => $totalPesanan,
                'total_pendapatan' => $totalPendapatan,
                'periode' => [
                    'start_date' => $startDate,
                    'end_date' => $endDate,
                ],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal memuat data summary: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get pesanan list for report
     */
    public function getPesananLaporan(Request $request)
    {
        try {
            $startDate = $request->get('start_date', Carbon::now()->subDays(30)->format('Y-m-d'));
            $endDate = $request->get('end_date', Carbon::now()->format('Y-m-d'));
            $status = $request->get('status');

            $query = Pesanan::with(['detail.produk', 'user'])
                ->whereBetween('tanggal_pesan', [$startDate, $endDate])
                ->orderBy('tanggal_pesan', 'desc');

            if ($status && $status !== 'semua') {
                $query->where('status', $status);
            }

            $pesananList = $query->get();

            return response()->json($pesananList);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal memuat data pesanan: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get chart data for visualization
     */
    public function getChartData(Request $request)
    {
        try {
            $startDate = $request->get('start_date', Carbon::now()->subDays(30)->format('Y-m-d'));
            $endDate = $request->get('end_date', Carbon::now()->format('Y-m-d'));

            $chartData = DB::table('pesanan')
                ->select(
                    DB::raw('DATE(tanggal_pesan) as tanggal'),
                    DB::raw('COUNT(*) as jumlah'),
                    DB::raw('SUM(
                        (SELECT SUM(subtotal) FROM pesanan_detail WHERE pesanan_detail.pesanan_id = pesanan.id)
                    ) as total')
                )
                ->whereBetween('tanggal_pesan', [$startDate, $endDate])
                ->whereIn('status', ['completed', 'selesai'])
                ->groupBy(DB::raw('DATE(tanggal_pesan)'))
                ->orderBy('tanggal')
                ->get()
                ->map(function ($item) {
                    return [
                        'tanggal' => $item->tanggal,
                        'jumlah' => (int) $item->jumlah,
                        'total' => (float) ($item->total ?? 0),
                    ];
                });

            return response()->json($chartData);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal memuat data chart: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Export laporan to PDF
     */
    public function exportLaporan(Request $request)
    {
        try {
            $startDate = $request->get('start_date', Carbon::now()->subDays(30)->format('Y-m-d'));
            $endDate = $request->get('end_date', Carbon::now()->format('Y-m-d'));
            $status = $request->get('status');
            $format = $request->get('format', 'pdf');

            $query = Pesanan::with(['detail.produk', 'user'])
                ->whereBetween('tanggal_pesan', [$startDate, $endDate])
                ->orderBy('tanggal_pesan', 'desc');

            if ($status && $status !== 'semua') {
                $query->where('status', $status);
            }

            $pesananList = $query->get();

            // Calculate summary
            $totalPesanan = $pesananList->count();
            $totalPendapatan = $pesananList
                ->where('status', 'completed')
                ->sum(function ($pesanan) {
                    return $pesanan->detail->sum('subtotal');
                });

            $data = [
                'pesanan_list' => $pesananList,
                'total_pesanan' => $totalPesanan,
                'total_pendapatan' => $totalPendapatan,
                'start_date' => $startDate,
                'end_date' => $endDate,
                'status_filter' => $status,
                'generated_at' => Carbon::now()->format('d/m/Y H:i:s'),
            ];

            if ($format === 'pdf') {
                $pdf = Pdf::loadView('laporan.pesanan-pdf', $data);

                $filename = 'laporan-pesanan-' . $startDate . '-to-' . $endDate . '.pdf';

                return $pdf->download($filename);
            }

            // For API response, just return success
            return response()->json([
                'message' => 'Laporan berhasil digenerate',
                'data' => $data
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Gagal mengekspor laporan: ' . $e->getMessage()
            ], 500);
        }
    }
}
