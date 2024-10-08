import 'package:flutter/material.dart';

class NotesListViewModel extends StatelessWidget {
  const NotesListViewModel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.scrollKey,
  });

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          key: scrollKey,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 70),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.onSurface,
                ],
              ),
            ),
            height: 10,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.onSurface,
                ],
              ),
            ),
            height: 10,
          ),
        ),
      ],
    );
  }
}
