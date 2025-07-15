<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
class PesananDetail extends Model
{
    use HasApiTokens;
    protected $table = 'pesanan_details';
    protected $fillable = ['pesanan_id', 'produk_id', 'jumlah', 'subtotal'];

    public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id');
    }
}

