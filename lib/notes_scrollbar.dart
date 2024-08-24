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

class NotesScrollbar extends StatefulWidget {
  const NotesScrollbar(
      {super.key,
      required this.notes,
      required this.onNoteEditted,
      required this.onNoteDeleted});

  final List<NoteData> notes;
  final void Function(NoteData, int) onNoteEditted;
  final void Function(int) onNoteDeleted;

  @override
  State<NotesScrollbar> createState() => _NotesScrollbarState();
}

class _NotesScrollbarState extends State<NotesScrollbar> {
  @override
  Widget build(BuildContext context) {
    return widget.notes.isEmpty
        ? const NotesEmpty()
        : _NotesScrollbarModel(
            itemCount: widget.notes.length,
            itemBuilder: (context, index) {
              return NotesCard(
                title: widget.notes[index].title,
                content: widget.notes[index].content,
                onNoteEditted: (note) {
                  widget.onNoteEditted(note, index);
                },
                onNoteDeleted: () {
                  widget.onNoteDeleted(index);
                },
              );
            },
          );
  }
}

class _NotesScrollbarModel extends StatelessWidget {
  const _NotesScrollbarModel(
      {required this.itemCount, required this.itemBuilder});

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

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
              // primary: true,
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
