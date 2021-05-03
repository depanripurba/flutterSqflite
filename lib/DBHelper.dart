import 'package:appsqflite/Mahasiswa.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:path/path.dart';

//kiss me at the stroke
class DBHelper {
  static final DBHelper _instanse = new DBHelper.internal();
  DBHelper.internal();
  factory DBHelper() => _instanse;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await setDB();
      return _db;
    }
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "MahasiswaDB");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE datamhs(id INTEGER PRIMARY KEY, nama TEXT, jurusan TEXT)");
    print('Db has been created');
  }

  Future<int> simpanData(Mahasiswa mahasiswa) async {
    var dbClient = await db;
    int res = await dbClient.insert("datamhs", mahasiswa.toMap());
    print("data berhasil di tambahkan");
    return res;
  }
  Future<List<Mahasiswa>>getMhs()async{
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM datamhs");
    List<Mahasiswa> datamhs = new List();
    for(int i=0;i<list.length;i++){
      var data = new Mahasiswa(list[i]['nama'], list[i]['jurusan']);
      data.mahasiswaID(list[i]['id']);
      datamhs.add(data);

    }
    return datamhs;
  }
}
