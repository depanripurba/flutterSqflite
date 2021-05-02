import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:path/path.dart';
//kiss me at the stroke
class DBHelper{
  static final DBHelper _instanse = new DBHelper.internal();
  DBHelper.internal();
  factory DBHelper()=> _instanse;
  static Database _db;

  Future<Database> get db async{
    if(_db!=null) return _db;
    _db = await setDB();
    return _db;

  }
setDB()async{
  io.Directory directory = await getApplicationDocumentsDirectory();
  String path = join(directory.path,"MahasiswaDB");
  var dB = await openDatabase(path,version:1, onCreate: _onCreate);
  return dB;

}
void _onCreate(Database db, int version)async{
  await db.execute("CREATE TABLE datamhs(id INTEGER PRIMARY KEY, nama TEXT, jurusan TEXT");
  print('Db has been created');
}
}