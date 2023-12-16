import 'package:dxout/database/common/task.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database dxoutDatabase) async {
    await dxoutDatabase.execute("""CREATE TABLE task (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT NOT NULL,
      deathDate TEXT NOT NULL,
      notes TEXT,
      isComplete TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("database_name.db", version: 1,
        onCreate: (sql.Database dxoutDatabase, int version) async {
      await createTables(dxoutDatabase);
    });
  }

  static Future<int> createTask(Task task) async {
    final db = await SQLHelper.db();
    final id = await db.insert("task", task.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Task>?> getAllTasks() async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result =
        await db.query('task', orderBy: 'deathDate DESC');
    if (result.isEmpty) return List.empty();
    return result.map((e) => Task.fromJson(e)).toList();
  }

  static Future<Task> getSingleTask(int id) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result =
        await db.query('task', where: "id = ?", whereArgs: [id], limit: 1);
    return Task.fromJson(result[0]);
  }

  static Future<void> deleteTask(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('task', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      //print(e);
    }
  }

  static Future<int> updateStatus(Task task) async {
    final db = await SQLHelper.db();
    final taskData = {
      'id': task.id,
      'name': task.name,
      'deathDate': task.deathDate,
      'notes': task.notes,
      'isComplete': task.isComplete,
      'createdAt': DateTime.now().toString()
    };
    final result = await db
        .update('task', taskData, where: "id = ?", whereArgs: [task.id]);
    return result;
  }

  static Future<String> getPendingTask() async {
    final db = await SQLHelper.db();
    final result = await db
        .rawQuery("Select count(*) from task where isComplete != 'true'");
    return result[0]['count(*)'].toString();
  }
}
