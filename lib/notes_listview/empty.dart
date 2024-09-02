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
