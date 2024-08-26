import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_dialog/factory.dart';
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

class _NotesIconModel extends StatelessWidget {
  const _NotesIconModel({
    this.onTap,
    this.onLongPress,
    this.iconColor = NotesPallette.cardIcon,
    required this.iconData,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox.square(
        dimension: 30,
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            splashFactory: InkSplash.splashFactory,
            splashColor: NotesPallette.cardIcon,
            onTap: onTap,
            onLongPress: onLongPress,
            child: Icon(
              iconData,
              size: 20,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _NotesCardModel extends StatelessWidget {
  const _NotesCardModel({required this.noteData, required this.icons});

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

class _DefaultNotesCardModel extends _NotesCardModel {
  _DefaultNotesCardModel({
    required super.noteData,
    required VoidCallback onNoteEditted,
    required VoidCallback onNoteDeleted,
    required VoidCallback onDeleteLongPress,
  }) : super(
          icons: [
            _NotesIconModel(
              onTap: onNoteEditted,
              iconData: Icons.edit,
            ),
            _NotesIconModel(
              onTap: onNoteDeleted,
              onLongPress: onDeleteLongPress,
              iconData: Icons.delete_outline,
            ),
          ],
        );
}

class _MultipleDeleteNotesIcon extends StatefulWidget {
  const _MultipleDeleteNotesIcon(
      {required this.onTap, required this.isSelected});

  final void Function(bool) onTap;
  final bool isSelected;

  @override
  State<_MultipleDeleteNotesIcon> createState() =>
      _MultipleDeleteNotesIconState();
}

class _MultipleDeleteNotesIconState extends State<_MultipleDeleteNotesIcon> {
  @override
  Widget build(BuildContext context) {
    return _NotesIconModel(
      onTap: () {
        widget.onTap(!widget.isSelected);
      },
      iconData: widget.isSelected ? Icons.delete : Icons.delete_outline,
      iconColor: widget.isSelected ? Colors.red : NotesPallette.cardIcon,
    );
  }
}

class NotesCardMultipleDelete extends StatelessWidget {
  const NotesCardMultipleDelete({
    super.key,
    required this.noteData,
    required this.onTap,
    required this.isSelected,
  });

  final NoteData noteData;
  final void Function(bool) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return _NotesCardModel(
      icons: [
        _MultipleDeleteNotesIcon(
          onTap: onTap,
          isSelected: isSelected,
        ),
      ],
      noteData: noteData,
    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    required this.noteData,
    required this.onNoteEditted,
    required this.onNoteDeleted,
    required this.onDeleteLongPress,
  });

  final NoteData noteData;
  final void Function(NoteData) onNoteEditted;
  final void Function() onNoteDeleted;
  final void Function() onDeleteLongPress;

  @override
  Widget build(BuildContext context) {
    final dialogFactory = PlatformSpecificNotesDialogFactory(context);
    return _DefaultNotesCardModel(
      noteData: noteData,
      onNoteEditted: () {
        dialogFactory.showDialogMethod(
          context: context,
          builder: (context) {
            return dialogFactory.createEditDialog(
              onNoteAccepted: onNoteEditted,
              noteData: noteData,
            );
          },
        );
      },
      onNoteDeleted: () {
        dialogFactory.showDialogMethod(
          context: context,
          builder: (context) {
            return dialogFactory.createDeleteDialog(
              onDelete: onNoteDeleted,
            );
          },
        );
      },
      onDeleteLongPress: onDeleteLongPress,
    );
  }
}
