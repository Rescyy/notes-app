class NoteData {
  final String title;
  final String content;

  const NoteData({
    required this.title,
    required this.content,
  });
}

abstract class NotesDatabaseAbstract {
  const NotesDatabaseAbstract();

  List<NoteData> get notes;

  void addNote(NoteData note);

  void removeNote(int index);

  void editNote(NoteData note, int index);

  void reworderNotes(int oldIndex, int newIndex) => throw UnimplementedError();
}

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
}

class BibleNotesDatabase extends NotesDatabase {
  BibleNotesDatabase() : super(bibleVerses);
}

final List<NoteData> bibleVerses = [
  const NoteData(
    title: "Jeremiah 29:11",
    content:
        "For I know the plans I have for you, declares the Lord, plans for welfare and not for evil, to give you a future and a hope.",
  ),
  const NoteData(
    title: "Deuteronomy 31:6",
    content:
        "Be strong and courageous. Do not fear or be in dread of them, for it is the Lord your God who goes with you. He will not leave you or forsake you.",
  ),
  const NoteData(
    title: "Proverbs 3:5-6",
    content:
        "Trust in the Lord with all your heart, and do not lean on your own understanding. In all your ways acknowledge him, and he will make straight your paths.",
  ),
  const NoteData(
    title: "Lamentations 3:22-23",
    content:
        "The steadfast love of the Lord never ceases; his mercies never come to an end; they are new every morning; great is your faithfulness.",
  ),
  const NoteData(
    title: "Psalm 34:8",
    content:
        "Oh, taste and see that the Lord is good! Blessed is the man who takes refuge in him!",
  ),
  const NoteData(
    title: "Isaiah 41:10",
    content:
        "Fear not, for I am with you; be not dismayed, for I am your God; I will strengthen you, I will help you, I will uphold you with my righteous right hand.",
  ),
  const NoteData(
    title: "2 Corinthians 4:16-18",
    content:
        "So we do not lose heart. Though our outer self is wasting away, our inner self is being renewed day by day. For this light momentary affliction is preparing for us an eternal weight of glory beyond all comparison, as we look not to the things that are seen but to the things that are unseen. For the things that are seen are transient, but the things that are unseen are eternal.",
  ),
];

final List<NoteData> miauVerses = [
  const NoteData(
    title: "miau",
    content:
        "miau miau miau|sunt kiss miau miaufac cachi in cutie miau miausi dorm pe pernamiau:3",
  ),
  const NoteData(
    title: "miau2",
    content: "miau miau miaumă ling la curmiausi fac pur pur purmiau",
  ),
  const NoteData(
    title: "diary of a kisa miau 3",
    content:
        "miau miauam borat in coridor miausi m-am urcat pe masamiauam dat o farfurie jos miaumiau ;3",
  ),
  const NoteData(
    title: "diary of a kisa miau 4",
    content:
        "vecini m-a muscat miau 3:<l-am mușcat înapoi miau >:3si după m-am cacat la el la ușă miauvictory royal",
  ),
  const NoteData(
    title: "diary of a kisa miau 5",
    content: "5 nights at freddys",
  )
];
