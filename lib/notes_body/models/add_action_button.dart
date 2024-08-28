import 'package:flutter/material.dart';

class NoteAddActionButtonModel extends FloatingActionButton {
  const NoteAddActionButtonModel({
    super.key,
    required super.onPressed,
  }) : super(
          child: const Icon(Icons.add),
        );
}