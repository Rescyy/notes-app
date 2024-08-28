import 'package:flutter/material.dart';

class NotesBodyModel extends StatelessWidget {
  const NotesBodyModel({
    super.key,
    required this.child,
    this.floatingActionButton,
    this.persistentFooterButtons,
  });

  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Notes'),
      ),
      floatingActionButton: floatingActionButton,
      persistentFooterButtons: persistentFooterButtons,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}