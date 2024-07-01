import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'item_page.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('items.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');
  }

  Future<Item> create(Item item) async {
    final db = await instance.database;
    final id = await db.insert('items', item.toMap());
    return Item(id: id, name: item.name, description: item.description);
  }

  Future<Item> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'items',
      columns: ['id', 'name', 'description'],
      where: 'id = ?',
      whereArgs: [id],
    );  

    if (maps.isNotEmpty) {
      return Item.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Item>> readAll() async {
    final db = await instance.database;
    final result = await db.query('items');
    return result.map((json) => Item.fromMap(json)).toList();
  }

  Future<int> update(Item item) async {
    final db = await instance.database;
    return db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
