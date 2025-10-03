<?php

use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

// Đây là route API cho User
Route::get('users', [UserController::class, 'index']); // List all users
Route::get('users/{id}', [UserController::class, 'show']); // Get single user
Route::post('users', [UserController::class, 'store']); // Create user
Route::put('users/{id}', [UserController::class, 'update']); // Update user
Route::delete('users/{id}', [UserController::class, 'destroy']); // Delete user
