import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_edit_dialog.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class NotesContent extends TextSpan {
  const NotesContent(String content)
      : super(
          text: content,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        );
}

class NotesTitle extends TextSpan {
  const NotesTitle(String title)
      : super(
          text: title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
}

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    required this.title,
    required this.content,
    required this.onNoteEditted,
    required this.onNoteDeleted,
  });

  final String title;
  final String content;
  final void Function(NoteData) onNoteEditted;
  final void Function() onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        NotesTitle titleSpan = NotesTitle(title);
        NotesContent contentSpan = NotesContent(content);
        final titleMaxWidth = constraints.maxWidth - 111;
        final titleHeight = (TextPainter(
          text: titleSpan,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: titleMaxWidth))
            .height;
        final contentHeight = (TextPainter(
          text: contentSpan,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth - 24))
            .height;
        const double tilePadding = 12;
        const double delimiterHeight = 4;
        final double height = math
            .max(
                titleHeight + contentHeight + 2 * tilePadding + delimiterHeight,
                90)
            .toDouble();
        // log('Title: $titleHeight Content: $contentHeight Total: $height');

        return Stack(
          children: [
            Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: NotesPallette.getNoteColor(title),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    color: NotesPallette.noteShadow,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: titleMaxWidth,
                      child: RichText(text: titleSpan),
                    ),
                    const SizedBox(height: delimiterHeight),
                    RichText(text: contentSpan),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  color: NotesPallette.cardIcon,
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return NotesEditDialog(
                          title: title,
                          content: content,
                          titleText: 'Edit Note',
                          onNoteAccepted: (note) {
                            onNoteEditted(note);
                          },
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20),
                  color: NotesPallette.cardIcon,
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Note'),
                            content: const Text(
                                'Are you sure you want to delete this note?'),
                            actions: [
                              TextButton(
                                style: const ButtonStyle(
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.red),
                                ),
                                onPressed: () {
                                  onNoteDeleted();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
