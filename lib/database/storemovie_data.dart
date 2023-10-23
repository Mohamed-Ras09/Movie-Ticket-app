

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticketapp/models/bookMovie.dart';
import 'package:ticketapp/models/model.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'flutter_sqflite_database.db');

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE breeds(title TEXT PRIMARY KEY, poster TEXT,  date TEXT , price TEXT)',
    );
  }

  Future<void> insertBreed(MovieBookModel breed) async {
    final db = await _databaseService.database;

    await db.insert(
      'breeds',
      breed.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MovieBookModel>> breeds() async {
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query('breeds');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(
        maps.length, (index) => MovieBookModel .fromJson(maps[index]));
  }

  Future<MovieBookModel> breed(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('breeds', where: 'id = ?', whereArgs: [id]);
    return MovieBookModel .fromJson(maps[0]);
  }

  Future<void> deleteBreed(String id) async {
    final db = await _databaseService.database;
    await db.delete('breeds', where: 'id = ?', whereArgs: [id]);
  }
  
}