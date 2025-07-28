<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pesanan;
use App\Models\PesananDetail;
use Illuminate\Support\Facades\DB;

class PesananController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'items' => 'required|array|min:1',
            'items.*.produk_id' => 'required|exists:produks,id',
            'items.*.jumlah' => 'required|integer|min:1',
            'items.*.subtotal' => 'required|integer|min:0',
        ]);

        DB::beginTransaction();
        try {
            $pesanan = Pesanan::create([
                'user_id' => $request->user()->id,
                'tanggal_pesan' => now(),
                'status' => 'pending',
            ]);

            foreach ($request->items as $item) {
                $pesanan->detail()->create([
                    'produk_id' => $item['produk_id'],
                    'jumlah' => $item['jumlah'],
                    'subtotal' => $item['subtotal'],
                ]);

                // Kurangi stok produk
                $produk = \App\Models\Produk::find($item['produk_id']);
                if ($produk) {
                    if ($produk->stok < $item['jumlah']) {
                        throw new \Exception('Stok produk tidak mencukupi untuk produk ID: ' . $item['produk_id']);
                    }
                    $produk->stok -= $item['jumlah'];
                    $produk->save();
                }
            }

            DB::commit();

            return response()->json([
                'message' => 'Pesanan berhasil dibuat',
                'data' => $pesanan->load('detail.produk')
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Gagal membuat pesanan',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function index(Request $request)
    {
        return Pesanan::with('detail.produk')->where('user_id', $request->user()->id)->get();
    }

    public function show($id)
    {
        $pesanan = Pesanan::with('detail.produk')->findOrFail($id);
        return response()->json($pesanan);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'status' => 'sometimes|required|string',
            // tambahkan field lain sesuai kebutuhan
        ]);
        $pesanan = Pesanan::findOrFail($id);
        $pesanan->update($validated);
        return response()->json([
            'message' => 'Pesanan berhasil diupdate',
            'data' => $pesanan
        ]);
    }

    public function destroy($id)
    {
        $pesanan = Pesanan::findOrFail($id);
        $pesanan->delete();
        return response()->json([
            'message' => 'Pesanan berhasil dihapus'
        ]);
    }

    // Admin: Melihat semua pesanan
    public function all(Request $request)
    {
        // Pastikan hanya admin yang bisa akses
        if ($request->user()->role_id != 1) {
            return response()->json(['message' => 'Akses ditolak'], 403);
        }

        $pesanan = Pesanan::with('detail.produk', 'user')->get();
        return response()->json($pesanan);
    }


    public function processPesanan(Request $request, $id)
    {
        $pesanan = Pesanan::findOrFail($id);
        $pesanan->status = 'diproses';
        $pesanan->save();
        return response()->json(['message' => 'Pesanan berhasil diproses']);
    }

    public function tolakPesanan(Request $request, $id)
    {
        $pesanan = Pesanan::with('detail')->findOrFail($id);
        foreach ($pesanan->detail as $detail) {
            $produk = \App\Models\Produk::find($detail->produk_id);
            if ($produk) {
                $produk->stok += $detail->jumlah;
                $produk->save();
            }
        }
        $pesanan->status = 'ditolak';
        $pesanan->save();
        return response()->json(['message' => 'Pesanan berhasil ditolak']);
    }

    public function terimaPesanan(Request $request, $id)
    {
        $pesanan = Pesanan::findOrFail($id);
        $pesanan->status = 'selesai';
        $pesanan->save();
        return response()->json(['message' => 'Pesanan berhasil diterima']);
    }
}
