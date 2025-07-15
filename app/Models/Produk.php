<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens; // Tambahkan ini jika belum ada
class Produk extends Model
{
    use HasApiTokens; // Pastikan trait ini digunakan
    protected $table = 'produks'; // <-- Perbaikan penting di sini
    protected $fillable = ['nama_produk', 'harga', 'stok', 'gambar_produk', 'kategori_produk_id'];

    public function kategori()
    {
        return $this->belongsTo(KategoriProduk::class, 'kategori_produk_id');
    }
}
