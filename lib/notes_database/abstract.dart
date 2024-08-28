import 'package:assignment_2/notes_database/dataclass.dart';

abstract class NotesDatabaseAbstract {
  const NotesDatabaseAbstract();

  List<NoteData> get notes;

  void addNote(NoteData note);

  void removeNote(int index);

  void removeNotes(Iterable<int> indeces);

  void editNote(NoteData note, int index);

  void reworderNotes(int oldIndex, int newIndex) => throw UnimplementedError();
}
