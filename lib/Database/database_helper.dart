import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2, // increased version for new table
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // Create main users table
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        mobile TEXT,
        city TEXT,
        gender TEXT,
        hobbies TEXT,
        dob TEXT,
        password TEXT,
        isFavourite INTEGER Default 0
      )
    ''');

    // Create authentication table
    await db.execute('''
      CREATE TABLE auth_users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE auth_users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE NOT NULL,
          password TEXT NOT NULL
        )
      ''');
    }
  }

  // Main user table methods (unchanged)
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('users');
    return result.map((user) {
      return {
        'id': user['id'] ?? 0,
        'name': user['name'] ?? '',
        'email': user['email'] ?? '',
        'mobile': user['mobile'] ?? '',
        'city': user['city'] ?? '',
        'gender': user['gender'] ?? '',
        'hobbies': user['hobbies'] ?? '',
        'dob': user['dob'] ?? '',
        'password': user['password'] ?? '',
        'isFavourite': user['isFavourite'] ?? 0,
      };
    }).toList();
  }

  Future<int> updateUser(Map<String, dynamic> user, int id) async {
    final db = await database;
    return await db.update('users', user, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> toggleFavorite(int userId, bool isFavorite) async {
    final db = await database;
    await db.update('users', {'isFavourite': isFavorite ? 1 : 0},
        where: 'id = ?', whereArgs: [userId]);
  }

  Future<List<Map<String, dynamic>>> getFavoriteUsers() async {
    final db = await database;
    return await db.query('users', where: 'isFavourite = ?', whereArgs: [1]);
  }

  // NEW: auth_users table methods

  Future<int> insertAuthUser(String email, String password) async {
    final db = await database;
    return await db.insert('auth_users', {
      'email': email,
      'password': password, // Consider hashing in a real app
    });
  }

  Future<Map<String, dynamic>?> getAuthUser(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'auth_users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<bool> checkAuthCredentials(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'auth_users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  Future<int> updateAuthPassword(String email, String newPassword) async {
    final db = await database;
    return await db.update('auth_users', {'password': newPassword},
        where: 'email = ?', whereArgs: [email]);
  }

  Future<int> deleteAuthUser(String email) async {
    final db = await database;
    return await db.delete('auth_users', where: 'email = ?', whereArgs: [email]);
  }
}