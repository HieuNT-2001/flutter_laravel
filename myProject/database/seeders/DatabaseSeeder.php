<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(10)->create();

        User::factory()->create([
            'name' => 'John Doe',
            'email' => 'john.doe@example.com',
            'phone' => '1234567890',
            'avatar' => null,
            'dateOfBirth' => '1990-01-01',
        ]);

        User::factory()->create([
            'name' => 'Jane Smith',
            'email' => 'jane.smith@example.com',
            'phone' => '0987654321',
            'avatar' => null,
            'dateOfBirth' => '1995-05-05',
        ]);

        User::factory()->create([
            'name' => 'Alice Johnson',
            'email' => 'alice.johnson@example.com',
            'phone' => '5551234567',
            'avatar' => null,
            'dateOfBirth' => '1992-03-03',
        ]);

        User::factory()->create([
            'name' => 'Bob Brown',
            'email' => 'bob.brown@example.com',
            'phone' => '5559876543',
            'avatar' => null,
            'dateOfBirth' => '1988-08-08',
        ]);

        User::factory()->create([
            'name' => 'Charlie Davis',
            'email' => 'charlie.davis@example.com',
            'phone' => '5552468135',
            'avatar' => null,
            'dateOfBirth' => '1993-07-07',
        ]);
    }
}
