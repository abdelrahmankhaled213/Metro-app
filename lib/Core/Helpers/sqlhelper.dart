import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
abstract class DataBaseHelper {
  static Database? _db;
  static Future<Database?> get db async{
    if(_db==null){
      _db=await initalizeDb();
      return _db;
    }
    else{
      return _db;
    }
  }
  static initalizeDb()async{
    final opendb=await openDatabase(
        join(await getDatabasesPath(),'ourmetro.db'),version: 1 ,
      onCreate: (db, version) async => await db.execute('''
    CREATE TABLE 'Metro'(
    "id" INTEGER PRIMARY KEY NOT NULL ,
    "to" TEXT NOT NULL,
     "from" TEXT NOT NULL,
      "trip" TEXT NOT NULL
    );
    '''),

    );
return opendb;
  }
  static Future<List<Map<String, dynamic>>>getData(String sql)async{
    Database? mydb=await db;
    List<Map<String,dynamic>>? response=await mydb!.rawQuery(sql);

    return response;
  }
  static Future<int>insertData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawInsert(sql);
    return response;
  }
  static Future<int>updateData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawUpdate(sql);
    return response;
  }
  static Future<int>deleteData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawDelete(sql);
    return response;
  }
}