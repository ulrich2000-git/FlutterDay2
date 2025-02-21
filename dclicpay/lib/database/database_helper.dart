import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/transaction.dart' as custom_transaction;

class DatabaseHelper {
  static const String _dbName = 'transactions.db';
  static const int _dbVersion = 1;

  static const String table = 'transactions';

  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnAmount = 'amount';
  static const String columnDate = 'date';
  static const String columnAvatar = 'avatar';

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT,
        $columnAmount REAL,
        $columnDate TEXT,
        $columnAvatar TEXT
      )
    ''');
  }

  Future<int> insert(custom_transaction.Transaction transaction) async {
    Database db = await database;
   return await db.insert(table, transaction.toMap());
  }

  Future<List<custom_transaction.Transaction>> getTransactions() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(table);
    print("Transactions récupérées depuis la BD : $result");
    return result.map((map) => custom_transaction.Transaction.fromMap(map)).toList();
  }

  Future<int> update(custom_transaction.Transaction transaction) async {
    Database db = await database;
    return await db.update(table, transaction.toMap(),
        where: '$columnId = ?', whereArgs: [transaction.id]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}