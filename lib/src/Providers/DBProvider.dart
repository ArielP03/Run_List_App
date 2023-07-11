import 'dart:io';
import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_list/src/Models/list_models.dart';
export 'package:app_list/src/Models/list_models.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database ??= await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ListTask.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE Lists (id INTIGER PRIMARY KEY,name TEXT,tarea TEXT,date TEXT)');
      },
    );
  }

  addNewTask(ListModel newtask) async {
    final db = await database;
    final res = await db!.insert('Lists', newtask.toMap({}));
    return res;
  }

  Future<ListModel?> getTaskId(id) async {
    final db = await database;
    final res = await db!.query('Lists', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ListModel.fromJson(res.first) : null;
  }

  Future<List<ListModel?>> getAllTask() async {
    final db = await database;
    final res = await db!.query('Lists');

    List<ListModel> list =
        res.isNotEmpty ? res.map((c) => ListModel.fromJson(c)).toList() : [];
    return list;
  }

  Future<int?> updateTask(ListModel newTask) async {
    final db = await database;
    final res = await db!.update('Lists', newTask.toMap({}),
        where: 'id = ?', whereArgs: [newTask.id]);
    return res;
  }

  deleteTask(id) async {
    final db = await database;
    final res = await db!.delete('Lists', where: 'id=?', whereArgs: [id]);
    return res;
  }

  deleteAll(id) async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM Scans');
    return res;
  }

  a_1() async {
    int randow = 0;
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('Lists');
    final _numberRandow = Random().nextInt(1000000);
    randow = _numberRandow;
    final a = maps.length + randow;
    return a;
  }
}
