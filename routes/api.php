<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\KategoriController;
use App\Http\Controllers\Api\ProdukController;
use App\Http\Controllers\Api\PesananController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
//tes dev
Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('kategori', KategoriController::class);
    Route::apiResource('/produk', [ProdukController::class, 'index']);
    Route::apiResource('/produk/{id}', [ProdukController::class, 'show']);
    Route::apiResource('/pesanan', [PesananController::class, 'store']);
    Route::apiResource('/pesanan', [PesananController::class, 'index']);
    Route::apiResource('/logout', [AuthController::class, 'logout']);
});
