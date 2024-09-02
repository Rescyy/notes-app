import 'package:flutter/material.dart';

class NotesBodyModel extends StatelessWidget {
  const NotesBodyModel({
    super.key,
    required this.child,
    this.floatingActionButton,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerOpened,
  });

  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget child;
  final Drawer? drawer;
  final void Function()? onDrawerOpened;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Notes'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                if (onDrawerOpened != null) {
                  onDrawerOpened!();
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: floatingActionButton,
      persistentFooterButtons: persistentFooterButtons,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
      drawer: drawer,
    );
  }
}
