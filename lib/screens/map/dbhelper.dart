import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:abler_project/screens/map/park.dart';

// Shelter
// shelter
// shelters

const String tableName = 'parks';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final database = openDatabase(join(await getDatabasesPath(), 'parks.db'),
        onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $tableName(parking_code TEXT PRIMARY KEY, parking_name TEXT, lat TEXT, lng TEXT)",
      );
    }, version: 1);
    return database;
  }

  // 정보 등록
  Future<void> insertPark(Park park) async {
    final db = await _initDatabase();

    await db.insert(
      tableName,
      park.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 단건조회
  Future<Park> getPark(int parkingCode) async {
    final db = await database;

    List<Map<String, dynamic>> maps = await db.query(tableName,
        columns: ["parking_code", "parking_name", "lat", "lng"],
        where: "parking_code = ?",
        whereArgs: [parkingCode]);

    return Park.fromJson(maps.first);
  }

  // 다건조회
  Future<List<Park>> parks() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('parks');

    return List.generate(maps.length, (i) {
      return Park(
        parking_code: maps[i]['parking_code'],
        parking_name: maps[i]['parking_name'],
        lat: double.parse(maps[i]['lat']),
        lng: double.parse(maps[i]['lng']),
      );
    });
  }

  // 정보 업데이트
  Future<void> updatePark(Park park) async {
    final db = await database;

    await db.update(
      tableName,
      park.toJson(),
      where: "parking_code =?",
      whereArgs: [park.parking_code],
    );
  }

  // 정보 삭제
  Future<void> deletePark(int parkingCode) async {
    final db = await database;

    await db.delete(
      tableName,
      where: "parking_code = ?",
      whereArgs: [parkingCode],
    );
  }

  // 정보 전체삭제
  Future<void> truncateParks() async {
    final db = await database;

    await db.rawDelete('DELETE FROM $tableName');
  }
}
