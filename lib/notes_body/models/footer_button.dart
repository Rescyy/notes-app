import 'package:flutter/material.dart';

class NotesFooterButtonModel extends StatelessWidget {
  const NotesFooterButtonModel({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          // color: NotesPallette.buttonTextDark,
        ),
      ),
    );
  }
}
