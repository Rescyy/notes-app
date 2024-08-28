import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NotesIconModel extends StatelessWidget {
  const NotesIconModel({
    super.key,
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