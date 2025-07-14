<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    protected $table = 'pesanans';
    protected $fillable = ['user_id', 'tanggal_pesan', 'status'];

    public function detail()
    {
        return $this->hasMany(PesananDetail::class, 'pesanan_id');
    }
}

