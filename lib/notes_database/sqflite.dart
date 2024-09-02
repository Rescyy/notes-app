import 'dart:developer';

import 'package:assignment_2/notes_database/abstract.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase extends NotesDatabaseAbstract {
  final String path = "notes.db";
  late final Database db;
  bool isInitialized = false;
  Map<int, NoteData>? _notes;
  static const _tableName = 'notes';

  @override
  Future<void> addNote(NoteData note) async {
    await init();
    int id = await db.insert(_tableName, note.toMap());
    log("$id");
  }

  @override
  Future<void> editNote(NoteData note, int id) async {
    await init();
    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<Map<int, NoteData>> get futureNotes async {
    await init();
    final notes = await db.query(_tableName).then((value) => Map.fromEntries(
        value.map((e) => MapEntry(e["id"] as int, NoteData.fromMap(e)))));
    _notes = notes;
    return notes;
  }

  @override
  Map<int, NoteData>? get notes => _notes;

  @override
  Future<void> removeNote(int id) async {
    await init();
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  String _questionTuple(int size) {
    return "(${('?' * (size)).split('').join(', ')})";
  }

  @override
  Future<void> removeNotes(Iterable<int> ids) async {
    await init();
    await db.delete(
      _tableName,
      where: 'id IN ${_questionTuple(ids.length)}',
      whereArgs: ids.toList(growable: false),
    );
  }

  @override
  Future init() async {
    if (isInitialized) {
      return;
    }
    final databasePath = await getDatabasesPath();
    final path = databasePath + this.path;
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)',
        );
      },
    );
    isInitialized = true;
  }
}
