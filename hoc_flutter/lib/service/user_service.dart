import 'dart:convert';
import 'package:hoc_flutter/model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/users';

  /// Create
  Future<User?> createUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: user.toJson(),
    );

    if (response.statusCode == 201) {
      return User.fromJson(response.body);
    }
    return null;
  }

  /// Read all
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => User.fromMap(e)).toList();
    }
    return [];
  }

  /// Read one
  Future<User?> getUserById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    return null;
  }

  /// Update
  Future<User?> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: user.toJson(),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    return null;
  }

  /// Delete
  Future<bool> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    return response.statusCode == 200;
  }
}
