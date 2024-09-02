import 'package:assignment_2/notes_database/dataclass.dart';

abstract class NotesDatabaseAbstract {
  const NotesDatabaseAbstract();

  Future<Map<int, NoteData>> get futureNotes;

  Map<int, NoteData>? get notes;

  Future<void> init();

  Future<void> addNote(NoteData note);

  Future<void> removeNote(int id);

  Future<void> removeNotes(Iterable<int> ids);

  Future<void> editNote(NoteData note, int id);

  Future<void> reworderNotes(int oldIndex, int newIndex) => throw UnimplementedError();
}
