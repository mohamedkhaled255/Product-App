import 'package:lab8/contacts/helper/constants.dart';
import 'package:lab8/model/user_contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "UserContact.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
  CREATE TABLE $tableContacts (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnName TEXT NOT NULL,
    $columnEmail TEXT NOT NULL,
    $columnPhone TEXT NOT NULL
  )
''');

        //await db.execute("CREATE TABLE $tableContacts[$columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnName TEXT NOT NULL,$columnEmail TEXT NOT NULL] ");
      },
    );
  }

  Future insertContact(UserContactModel contact) async {
    var dbClient = await database;
    await dbClient!.insert(
      tableContacts,
      contact.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  UpdateContact(UserContactModel contact) async {
    var dbClient = await database;
    await dbClient!.update(
      tableContacts,
      contact.toJson(),
      where: "$columnId =?",
      whereArgs: [contact.id],
    );
  }

  Future<UserContactModel> getContact(int id) async {
    var dbClient = await database;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      tableContacts,
     // where: "columnId =?",
     where: "$columnId =?",

      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserContactModel.fromJson(maps.first);
    } else {
      throw Exception("Contact NOT Found");
    }
  }

  Future<List<UserContactModel>> getAllContact() async {
    var dbClient = await database;
    List<Map<String, dynamic>> maps = await dbClient!.query(tableContacts);
    List<UserContactModel> contacts = maps.isNotEmpty
        ? maps.map((map) => UserContactModel.fromJson(map)).toList()
        : [];
    return contacts;
  }

  Future<void> deleteContact(int id) async {
    var dbClient = await database;
    await dbClient!.delete(
      tableContacts,
      where: "$columnId =?",
      whereArgs: [id],
    );
  }
}
