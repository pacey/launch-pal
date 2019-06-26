import 'package:launch_pal/src/models/launch_reminder.dart';
import 'package:sqflite/sqflite.dart';

import 'database_manager.dart';

class LaunchReminderRepository {
  Future<LaunchReminder> create(LaunchReminder launchReminder) async {
    var database = await DatabaseManager.instance.database;
    await database.insert("launch_reminder", launchReminder.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return launchReminder;
  }

  Future<void> delete(LaunchReminder launchReminder) async {
    var database = await DatabaseManager.instance.database;
    await database.delete("launch_reminder",
        where: "launch_id = ?", whereArgs: [launchReminder.launchId]);
  }

  Future<LaunchReminder> findForLaunch(int launchId) async {
    var database = await DatabaseManager.instance.database;
    var maps = await database.query("launch_reminder",
        where: "launch_id = ?", whereArgs: [launchId]);
    if (maps.isEmpty) {
      return null;
    } else {
      return LaunchReminder.fromJson(maps[0]);
    }
  }
}
