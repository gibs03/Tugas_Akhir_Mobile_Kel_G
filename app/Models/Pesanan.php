<?php

namespace App\Models;
use Laravel\Sanctum\HasApiTokens;

use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    use HasApiTokens;
    protected $table = 'pesanans';
    protected $fillable = ['user_id', 'tanggal_pesan', 'status'];

    public function detail()
    {
        return $this->hasMany(PesananDetail::class, 'pesanan_id');
    }
}

