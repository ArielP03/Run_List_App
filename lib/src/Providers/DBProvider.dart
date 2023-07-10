// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_list/src/Models/list_models.dart';

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
        await db.execute('CREATE TABLE Lists ('
            'id INTIGER PRIMARY KEY,'
            'name TEXT,'
            'tarea TEXT,'
            'date TEXT');
      },
    );
  }

  newTask(ListModel newtask) async {
    final db = await database;
    final res = await db?.insert('Lists', newtask.toJson());
    return res;
  }

  Future<ListModel?> getTaskId(id) async {
    final db = await database;
    final res = await db?.query('Lists', where: 'id = ?', whereArgs: [id]);
    return res!.isNotEmpty ? ListModel.fromJson(res.first) : null;
  }

  Future<List<ListModel?>> getAllTask() async {
    final db = await database;
    final res = await db?.query('Lists');

    List<ListModel> list =
        res!.isNotEmpty ? res.map((c) => ListModel.fromJson(c)).toList() : [];
    return list;
  }

  Future <int?> updateTask(ListModel newTask) async {
    final db = await database;
    final res = await db?.update('Lists', newTask.toJson(),where: 'id = ?', whereArgs: [newTask.id]);
    return res;
  }
}
