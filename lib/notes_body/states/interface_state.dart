import 'package:assignment_2/notes_body/controller.dart';
import 'package:flutter/material.dart';

abstract class NotesState {
  NotesState({
    required this.controller,
  });
  final NotesBodyController controller;
  Widget build(BuildContext context);
}