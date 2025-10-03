import 'package:hoc_flutter/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseHelper {
  // instance: Singleton pattern đảm bảo chi có một instance của UserDatabaseHelper
  // database: Getter trả về instance của Database, tạo mới nếu chưa tồn tại
  // _initDB: Khởi tạo database với đường dẫn cụ thể
  // _createDB: Tạo các bảng khi database được tạo lần đầu
  // close: Đóng kết nối database

  static final UserDatabaseHelper instance = UserDatabaseHelper._init();
  static Database? _database;

  UserDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mydatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/$filePath';
    // await deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        phone TEXT NOT NULL,
        avatar TEXT,
        dateOfBirth TEXT NOT NULL
      )
      ''');

    await _insertSampleData(db);
  }

  Future _insertSampleData(Database db) async {
    final List<Map<String, dynamic>> sampleUsers = [
      {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'phone': '1234567890',
        'avatar': null,
        'dateOfBirth': '1990-01-01',
      },
      {
        'name': 'Jane Smith',
        'email': 'jane.smith@example.com',
        'phone': '0987654321',
        'avatar': null,
        'dateOfBirth': '1995-05-05',
      },
      {
        'name': 'Alice Johnson',
        'email': 'alice.johnson@example.com',
        'phone': '5551234567',
        'avatar': null,
        'dateOfBirth': '1992-03-03',
      },
      {
        'name': 'Bob Brown',
        'email': 'bob.brown@example.com',
        'phone': '5559876543',
        'avatar': null,
        'dateOfBirth': '1988-08-08',
      },
      {
        'name': 'Charlie Davis',
        'email': 'charlie.davis@example.com',
        'phone': '5552468135',
        'avatar': null,
        'dateOfBirth': '1993-07-07',
      },
    ];

    for (var user in sampleUsers) {
      await db.insert('users', user);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  // Create - Thêm user mới
  Future<int> insertUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  // Read - Lấy tất cả user
  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('users');
    return result.map((map) => User.fromMap(map)).toList();
  }

  // Read - Lấy user theo ID
  Future<User?> getUserById(int id) async {
    final db = await instance.database;
    final result = await db.query('users', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Update - cập nhật user
  Future<int> updateUser(User user) async {
    final db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete - Xóa user
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Đếm số lượng user
  Future<int> getUserCount() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM users');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
