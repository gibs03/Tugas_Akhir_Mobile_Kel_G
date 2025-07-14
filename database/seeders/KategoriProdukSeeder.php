<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\KategoriProduk;

class KategoriProdukSeeder extends Seeder
{
    public function run(): void
    {
        KategoriProduk::insert([
            ['nama_kategori' => 'Lampu'],
            ['nama_kategori' => 'Kabel'],
            ['nama_kategori' => 'Stop Kontak'],
        ]);
    }
}
