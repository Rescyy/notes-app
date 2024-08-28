import 'package:assignment_2/notes_body/controller.dart';
import 'package:assignment_2/notes_body/states/default_state.dart';
import 'package:flutter/material.dart';

abstract class NotesState {
  NotesState({
    required this.controller,
  });
  final NotesBodyController controller;
  Widget build(BuildContext context);

  factory NotesState.init({
    required NotesBodyController controller,
  }) =>
      NotesDefaultState(controller: controller);
}
