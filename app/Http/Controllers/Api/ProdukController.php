<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Produk;
use Illuminate\Http\Request;

class ProdukController extends Controller
{
    public function index() {
        return Produk::with('kategori')->get();
    }

    public function show($id) {
        return Produk::with('kategori')->findOrFail($id);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_produk' => 'required|string|max:255',
            'harga' => 'required|numeric',
            'stok' => 'required|integer',
            'gambar_produk' => 'nullable|file|image|max:2048',
            'kategori_produk_id' => 'required|exists:kategori_produks,id',
        ]);
        if ($request->hasFile('gambar_produk')) {
            $path = $request->file('gambar_produk')->store('gambar_produk', 'public');
            $validated['gambar_produk'] = $path;
        }
        $produk = Produk::create($validated);
        return response()->json([
            'message' => 'Produk berhasil dibuat',
            'data' => $produk
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'nama_produk' => 'sometimes|required|string|max:255',
            'harga' => 'sometimes|required|numeric',
            'stok' => 'sometimes|required|integer',
            'gambar_produk' => 'nullable|file|image|max:2048',
            'kategori_produk_id' => 'sometimes|required|exists:kategori_produks,id',
        ]);
        $produk = Produk::findOrFail($id);
        if ($request->hasFile('gambar_produk')) {
            $path = $request->file('gambar_produk')->store('gambar_produk', 'public');
            $validated['gambar_produk'] = $path;
        }
        $produk->update($validated);
        return response()->json([
            'message' => 'Produk berhasil diupdate',
            'data' => $produk
        ]);
    }

    public function destroy($id)
    {
        $produk = Produk::findOrFail($id);
        $produk->delete();
        return response()->json([
            'message' => 'Produk berhasil dihapus'
        ]);
    }
}
