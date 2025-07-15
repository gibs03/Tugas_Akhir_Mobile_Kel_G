<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;

class KategoriProduk extends Model
{
    use HasApiTokens;

    protected $table = 'kategori_produks';
    protected $fillable = ['nama_kategori'];

    public function produk()
    {
        return $this->hasMany(Produk::class, 'kategori_produk_id');
    }
}
