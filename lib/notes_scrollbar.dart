import 'package:assignment_2/notes_card.dart';
import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NotesEmpty extends StatelessWidget {
  const NotesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Wow such empty :(',
        style: TextStyle(
          fontSize: 20,
          color: NotesPallette.textDark,
        ),
      ),
    );
  }
}

class NotesScrollbar extends StatelessWidget {
  const NotesScrollbar({
    super.key,
    required this.notes,
    required this.onNoteEditted,
    required this.onNoteDeleted,
    required this.onToggleMultipleDelete,
    required this.scrollKey,
  });

  final List<NoteData> notes;
  final void Function(NoteData, int) onNoteEditted;
  final void Function(int) onNoteDeleted;
  final void Function(int) onToggleMultipleDelete;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? const NotesEmpty()
        : _NotesScrollbarModel(
            scrollKey: scrollKey,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NotesCard(
                noteData: notes[index],
                onNoteEditted: (note) {
                  onNoteEditted(note, index);
                },
                onNoteDeleted: () {
                  onNoteDeleted(index);
                },
                onDeleteLongPress: () {
                  onToggleMultipleDelete(index);
                },
              );
            },
          );
  }
}

class NotesScrollbarMultipleDelete extends StatelessWidget {
  const NotesScrollbarMultipleDelete({
    super.key,
    required this.notes,
    required this.onDeleteSelect,
    required this.selectedNotes,
    required this.scrollKey,
  });

  final List<NoteData> notes;
  final void Function(bool, int) onDeleteSelect;
  final Set<int> selectedNotes;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return _NotesScrollbarModel(
      scrollKey: scrollKey,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NotesCardMultipleDelete(
          noteData: notes[index],
          onTap: (selected) {
            onDeleteSelect(selected, index);
          },
          isSelected: selectedNotes.contains(index),
        );
      },
    );
  }
}

class _NotesScrollbarModel extends StatelessWidget {
  const _NotesScrollbarModel({
    required this.itemCount,
    required this.itemBuilder,
    required this.scrollKey,
  });

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thickness: 8,
      radius: const Radius.circular(5),
      thumbVisibility: true,
      trackColor: NotesPallette.cardIcon,
      thumbColor: NotesPallette.cardIcon,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
            child: ListView.separated(
              key: scrollKey,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    NotesPallette.background,
                    NotesPallette.backgroundTransparent
                  ],
                ),
              ),
              height: 10,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    NotesPallette.background,
                    NotesPallette.backgroundTransparent
                  ],
                ),
              ),
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
