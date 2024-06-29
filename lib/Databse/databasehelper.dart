import 'package:flutter/material.dart';
import 'package:sky/Databse/usermodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'nayan.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        Username TEXT,
        EmailId TEXT,
        MobileNo Integer,
        password TEXT
      )
    ''');
  }
 Future<int> insert(Map<String, dynamic> userdata) async {
  Database db = await instance.database;
  int userId =await db.insert('user', userdata);
  return userId;
}
Future<UserModel?> getUser(String email, String password) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(
      'user',
      where: 'EmailId = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserModel.fromJson(results.first);
    }
    return null;
  }

}




