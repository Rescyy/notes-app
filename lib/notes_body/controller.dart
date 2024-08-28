import 'package:assignment_2/notes_body/class.dart';
import 'package:assignment_2/notes_body/states/default_state.dart';
import 'package:assignment_2/notes_body/states/interface_state.dart';
import 'package:assignment_2/notes_database/abstract.dart';
import 'package:assignment_2/notes_database/bible.dart';
import 'package:flutter/material.dart';

class NotesBodyController extends State<NotesBody> {
  late NotesState _state = NotesDefaultState(controller: this);
  final scrollController = ScrollController();

  final Key scrollKey = const PageStorageKey('notes');
  final NotesDatabaseAbstract database = BibleNotesDatabase();

  void changeState(NotesState state) {
    super.setState(() {
      _state = state;
    });
  }

  @override
  void setState(void Function() fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return _state.build(context);
  }
}