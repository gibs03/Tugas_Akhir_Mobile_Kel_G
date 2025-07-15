<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Pesanan;
use App\Models\PesananDetail;
use App\Models\User;
use App\Models\Produk;

class PesananSeeder extends Seeder
{
    public function run(): void
    {
        // Ambil user dan produk untuk relasi
        $user = User::first();
        $produk1 = Produk::first();
        $produk2 = Produk::skip(1)->first();

        // Pesanan 1
        $pesanan1 = Pesanan::create([
            'user_id' => $user->id,
            'tanggal_pesan' => now(),
            'status' => 'pending',
        ]);
        PesananDetail::create([
            'pesanan_id' => $pesanan1->id,
            'produk_id' => $produk1->id,
            'jumlah' => 2,
            'subtotal' => 2 * 20000,
        ]);
        PesananDetail::create([
            'pesanan_id' => $pesanan1->id,
            'produk_id' => $produk2->id,
            'jumlah' => 1,
            'subtotal' => 1 * 25000,
        ]);

        // Pesanan 2
        $pesanan2 = Pesanan::create([
            'user_id' => $user->id,
            'tanggal_pesan' => now()->subDay(),
            'status' => 'selesai',
        ]);
        PesananDetail::create([
            'pesanan_id' => $pesanan2->id,
            'produk_id' => $produk1->id,
            'jumlah' => 1,
            'subtotal' => 20000,
        ]);
    }
} 