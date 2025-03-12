import 'dart:developer';
import 'package:flutter_application_1/modal/cart_modal.dart';
import 'package:sqflite/sqflite.dart';

String tableName = "cart_items";
String cartId = "cart_id";
String cartName = "name";
String cartDesc = "description";
String cartAmt = "price";
String cartQnt = "qty";
String cartImage = "image";

class DatabaseHelper {
  DatabaseHelper._();
  static DatabaseHelper dbh = DatabaseHelper._();

  Database? database;

  Future<void> initDatabase() async {
    String path = await getDatabasesPath();
    String fpath = "${path}cart_items.db";

    database = await openDatabase(
      fpath,
      version: 1,
      onCreate: (db, version) {
        String q = '''CREATE TABLE $tableName (
        $cartId INTEGER PRIMARY KEY AUTOINCREMENT,
        $cartName TEXT NOT NULL,
        $cartDesc TEXT NOT NULL,
        $cartAmt TEXT NOT NULL,
        $cartQnt INTEGER NOT NULL,
        $cartImage BLOB NOT NULL
        )''';
        db.execute(q).then(
          (value) {
            log("Created");
          },
        ).onError(
          (error, stackTrace) {
            log("ERROR $error");
          },
        );
      },
    );
  }

  Future<int?> addCart(CartModal modal) async {
    await initDatabase();
    String q =
        "INSERT INTO $tableName ($cartName, $cartDesc, $cartAmt, $cartQnt, $cartImage) VALUES (?, ?, ?, ?, ?)";
    List l = [
      modal.name,
      modal.description,
      modal.price,
      modal.qty,
      modal.image
    ];
    return await database?.rawInsert(q, l);
  }

  Future<List<CartModal>> fetchCart() async {
    await initDatabase();
    String q = "SELECT * FROM $tableName ";
    var res = await database?.rawQuery(q) ?? [];
    return res.map((e) => CartModal.toModal(e)).toList();
  }
}
