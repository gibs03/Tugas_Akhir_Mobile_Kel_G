<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Produk;

class ProdukSeeder extends Seeder
{
    public function run(): void
    {
        Produk::insert([
            [
                'nama_produk' => 'Lampu LED 5W',
                'harga' => 20000,
                'stok' => 100,
                'gambar_produk' => null,
                'kategori_produk_id' => 1
            ],
            [
                'nama_produk' => 'Kabel Roll 10m',
                'harga' => 75000,
                'stok' => 50,
                'gambar_produk' => null,
                'kategori_produk_id' => 2
            ],
            [
                'nama_produk' => 'Stop Kontak 3 Lubang',
                'harga' => 30000,
                'stok' => 60,
                'gambar_produk' => null,
                'kategori_produk_id' => 3
            ]
        ]);
    }
}
