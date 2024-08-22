import 'dart:developer';

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

class NotesText extends RichText {
  NotesText(
      {super.key, required NotesTitle title, required NotesContent content})
      : super(
          text: TextSpan(
            children: [
              title,
              const TextSpan(
                text: "\n",
                style: TextStyle(fontSize: 6),
              ),
              content,
            ],
          ),
        );
}

class Notestile extends StatelessWidget {
  const Notestile({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        NotesTitle titleSpan = NotesTitle(title);
        NotesContent contentSpan = NotesContent(content);
        final titleHeight = (TextPainter(
          text: titleSpan,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth - 100))
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
        log('Title: $titleHeight Content: $contentHeight Total: $height');

        return Stack(
          children: [
            Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: NotesPallette.getNoteColor(""),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    color: Color.fromARGB(147, 144, 156, 162),
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: titleSpan),
                    SizedBox(height: delimiterHeight),
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
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20),
                  onPressed: () {},
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
