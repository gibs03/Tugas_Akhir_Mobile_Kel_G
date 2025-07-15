<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\KategoriController;
use App\Http\Controllers\Api\ProdukController;
use App\Http\Controllers\Api\PesananController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Rute yang membutuhkan autentikasi token Sanctum
Route::middleware('auth:sanctum')->group(function () {
    // Semua fungsi CRUD untuk kategori
    Route::apiResource('kategori', KategoriController::class);

    // Semua fungsi CRUD untuk produk
    Route::apiResource('produk', ProdukController::class);

    // Semua fungsi CRUD untuk pesanan
    Route::apiResource('pesanan', PesananController::class);

    // Logout bukan resource, gunakan POST biasa
    Route::post('/logout', [AuthController::class, 'logout']);
});
