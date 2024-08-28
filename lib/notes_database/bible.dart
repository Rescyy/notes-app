import 'package:assignment_2/notes_database/class.dart';
import 'package:assignment_2/notes_database/dataclass.dart';

class BibleNotesDatabase extends NotesDatabase {
  BibleNotesDatabase() : super(_bibleVerses);
}

final List<NoteData> _bibleVerses = [
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
