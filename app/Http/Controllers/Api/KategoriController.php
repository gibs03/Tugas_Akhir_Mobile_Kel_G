<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\KategoriProduk;
use Illuminate\Http\Request;

class KategoriController extends Controller
{
    public function index() {
        return KategoriProduk::all();
    }

    public function store(Request $request)
    {
        // Validasi data
        $validated = $request->validate([
            'nama_kategori' => 'required|string|max:255',
            // tambahkan field lain sesuai kebutuhan
        ]);

        // Simpan data ke database
        $kategori = KategoriProduk::create($validated);

        // Kembalikan response
        return response()->json([
            'message' => 'Kategori berhasil dibuat',
            'data' => $kategori
        ], 201);
    }
}

