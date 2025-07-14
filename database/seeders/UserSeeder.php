<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder; // ✅ Tambahkan baris ini!
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'user@example.com'],
            [
                'name' => 'User Dummy',
                'password' => Hash::make('password')
            ]
        );
    }
}
