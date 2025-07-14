<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\KategoriProduk;

class KategoriController extends Controller
{
    public function index() {
        return KategoriProduk::all();
    }
}

