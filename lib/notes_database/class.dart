import 'package:assignment_2/notes_database/abstract.dart';
import 'package:assignment_2/notes_database/dataclass.dart';

class NotesDatabase extends NotesDatabaseAbstract {
  NotesDatabase([List<NoteData>? notes]) : _notes = notes ?? [];

  final List<NoteData> _notes;

  @override
  List<NoteData> get notes => _notes;

  @override
  void addNote(NoteData note) {
    _notes.add(note);
  }

  @override
  void removeNote(int index) {
    _notes.removeAt(index);
  }

  @override
  void editNote(NoteData note, int index) {
    _notes[index] = note;
  }

  @override
  void removeNotes(Iterable<int> indeces) {
    final sortedIndex = indeces.toList()..sort((a, b) => b.compareTo(a));
    for (final sortedIndex in sortedIndex) {
      _notes.removeAt(sortedIndex);
    }
  }
}
