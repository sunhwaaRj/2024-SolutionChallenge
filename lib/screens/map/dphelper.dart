// 앱 내부에 sqlite 이용하여 데이터베이스 저장
// 데이터베이스 초기화, 선언 후 경로 지정
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:abler_project/screens/map/park.dart';

// 주차장 위치 정보를 저장할 테이블명
const String tableName = 'parks';

class DBHelper {
  static final DBHelper _instamce = DBHelper._internal();
  // 싱글턴 패턴으로 인스턴스 사용
  factory DBHelper() {
    return _instamce;
  }

  // DBHelper 클래스의 내부생성자
  DBHelper._internal();

  // SQLite에 정의된 Database 클래스를 통해 database를 변수로 선언한다
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

/* */
  Future<Database> _initDatabase() async {
    final database = openDatabase(
        // 데이터베이스 경로를 지정
        join(await getDatabasesPath(), 'parks.db'),
        onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $tableName(parking_code TEXT PRIMARY KEY, parking_name TEXT, lat REAL, lng REAL)",
      );
    }, version: 1);
    return database;
  }

  // 정보 입력하기 insert
  // 정보 테이블에 등록, park 클래스를 인자로 받아 등록
  Future<void> insertPark(Park park) async {
    final db = await database;

    await db.insert(
      tableName,
      park.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 정보 단건조회
  // 코드를 인자로 받아 테이블에서 코드에 해당하는 정보 가져오기
  Future<Park> getPark(int parkingCode) async {
    final db = await database;

    List<Map<String, dynamic>> maps = await db.query(tableName,
        columns: ["parking_code", "parking_name", "lat", "lng"], // 조회할 칼럼명
        where: "parking_code = ?", // 조회 조건
        whereArgs: [parkingCode]); // 변수정의

    return Park.fromJson(maps.first);
  }

  // 정보 다건조회
  // 테이블 내 '전체' 주차장 정보 조회해 리턴
  Future<List<Park>> parks() async {
    final db = await database;

    // 모든 parks 얻기 위해 테이블에 질의
    final List<Map<String, dynamic>> maps = await db.query('parks');

    // List<map<String, dynamic>>을 List<Park>로 변환
    return List.generate(maps.length, (i) {
      return Park(
        parking_name: maps[i]['parking_name'],
        parking_code: maps[i]['parking_code'],
        lat: maps[i]['lat'],
        lng: maps[i]['lng'],
      );
    });
  }

  // 정보 수정
  Future<void> updatePark(Park park) async {
    final db = await database;

    await db.update(
      tableName,
      park.toJson(),
      where: "parking_code = ?", // id 일치하는지 확인
      whereArgs: [park.parking_code],
    );
  }

  // 정보 삭제
  Future<void> deletePark(int parkingCode) async {
    final db = await database;

    await db.delete(
      tableName,
      where: "parking_code = ?", // 특정 Park 제거
      whereArgs: [parkingCode],
    );
  }

  // 정보 전체 삭제, truncate
  Future<void> truncateParks() async {
    final db = await database;

    await db.rawDelete('DELETE FROM $tableName');
  }
}
