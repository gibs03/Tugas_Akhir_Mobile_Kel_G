<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produk;

class ProdukController extends Controller
{
    public function index() {
        return Produk::with('kategori')->get();
    }

    public function show($id) {
        return Produk::with('kategori')->findOrFail($id);
    }
}
