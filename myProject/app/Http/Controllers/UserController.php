<?php

namespace App\Http\Controllers;

use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{
    private UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    // GET /users
    public function index(): JsonResponse
    {
        return response()->json($this->userService->getAll());
    }

    // GET /users/{id}
    public function show($id): JsonResponse
    {
        $user = $this->userService->getById($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        return response()->json($user);
    }

    // POST /users
    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required|string',
            'avatar' => 'nullable|string',
            'dateOfBirth' => 'required|date',
        ]);

        $user = $this->userService->create($data);

        return response()->json($user, 201);
    }

    // PUT /users/{id}
    public function update(Request $request, $id): JsonResponse
    {
        $data = $request->validate([
            'name' => 'sometimes|string',
            'email' => 'sometimes|email|unique:users,email,' . $id,
            'phone' => 'sometimes|string',
            'avatar' => 'nullable|string',
            'dateOfBirth' => 'sometimes|date',
        ]);

        $user = $this->userService->update($id, $data);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        return response()->json($user);
    }

    // DELETE /users/{id}
    public function destroy($id): JsonResponse
    {
        $deleted = $this->userService->delete($id);
        if (!$deleted) {
            return response()->json(['message' => 'User not found'], 404);
        }
        return response()->json(['message' => 'User deleted successfully']);
    }
}
