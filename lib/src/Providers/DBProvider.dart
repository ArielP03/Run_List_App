import 'dart:io';
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

  Future<List<ListModel>> getTaskId(query) async {
    final db = await database;
    final res =
        await db!.rawQuery('SELECT * FROM Lists WHERE name LIKE \'%'+query+'%\'');
    List<ListModel> list =
        res.isNotEmpty ? res.map((c) => ListModel.fromJson(c)).toList() : [];
    return list;
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
    // int randow = 0;
    final db = await database;
    try {
      final b =
          await db?.rawQuery('SELECT id FROM Lists ORDER BY id DESC LIMIT 1');

      // final List<Map<String, dynamic>> maps = await db!.query('Lists');
      // final _numberRandow = Random().nextInt(1000000);
      // randow = _numberRandow;
      final q = b?.asMap();
      final a = q!.values.first;
      final e = a.values.first;
      final r = e.toString();
      final t = int.tryParse(r);
      final f = t! + 1;
      return f;
    } catch (error) {
      return 1;
    }
  }
}
