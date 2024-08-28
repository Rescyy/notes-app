import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class _NotesContent extends TextSpan {
  const _NotesContent(String content)
      : super(
          text: content,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        );
}

class _NotesTitle extends TextSpan {
  const _NotesTitle(String title)
      : super(
          text: title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
}

class NotesCardModel extends StatelessWidget {
  const NotesCardModel(
      {super.key, required this.noteData, required this.icons});

  final NoteData noteData;
  final List<Widget> icons;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _NotesTitle titleSpan = _NotesTitle(noteData.title);
        _NotesContent contentSpan = _NotesContent(noteData.content);
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
        const double delimiterHeight = 6;
        final double height = math
            .max(
                titleHeight + contentHeight + 2 * tilePadding + delimiterHeight,
                90)
            .toDouble();
        final cardColor = NotesPallette.getNoteColor(noteData.title);
        // log('Title: $titleHeight Content: $contentHeight Total: $height');

        return Stack(
          children: [
            Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cardColor,
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
              children: icons,
            ),
          ],
        );
      },
    );
  }
}