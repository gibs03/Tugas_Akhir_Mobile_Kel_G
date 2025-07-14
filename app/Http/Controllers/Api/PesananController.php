<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pesanan;
use App\Models\PesananDetail;

class PesananController extends Controller
{
    public function store(Request $request) {
        $request->validate([
            'items' => 'required|array'
        ]);

        $pesanan = Pesanan::create([
            'user_id' => $request->user()->id,
            'tanggal_pesan' => now(),
            'status' => 'pending',
        ]);

        foreach ($request->items as $item) {
            PesananDetail::create([
                'pesanan_id' => $pesanan->id,
                'produk_id' => $item['produk_id'],
                'jumlah' => $item['jumlah'],
                'subtotal' => $item['subtotal'],
            ]);
        }

        return response()->json(['message' => 'Pesanan berhasil dibuat']);
    }

    public function index(Request $request) {
        return Pesanan::with('detail.produk')->where('user_id', $request->user()->id)->get();
    }
}

