<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    protected $table = 'produks'; // <-- Perbaikan penting di sini
    protected $fillable = ['nama_produk', 'harga', 'stok', 'gambar_produk', 'kategori_produk_id'];

    public function kategori()
    {
        return $this->belongsTo(KategoriProduk::class, 'kategori_produk_id');
    }
}
