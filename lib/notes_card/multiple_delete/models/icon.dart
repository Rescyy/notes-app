import 'package:assignment_2/notes_card/base/models/icon.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class MultipleDeleteNotesIconModel extends NotesIconModel {
  const MultipleDeleteNotesIconModel({
    super.key,
    required super.onTap,
    required bool isSelected,
  }) : super(
          iconData: isSelected ? Icons.delete : Icons.delete_outline,
          iconColor: isSelected ? Colors.red : NotesPallette.cardIcon,
        );
}