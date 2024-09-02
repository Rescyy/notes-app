import 'package:flutter/material.dart';

class NotesDrawerModel extends StatelessWidget {
  const NotesDrawerModel({
    super.key,
    required this.onThemeToggle,
    required this.themeSwitchValue,
  });

  final void Function(bool) onThemeToggle;
  final bool themeSwitchValue;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    // color: Theme.of(context).colorScheme.secondary,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Theme Mode",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 20,
                          ),
                        ),
                        Switch(
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveThumbColor:
                              Theme.of(context).colorScheme.primary,
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.secondary,
                          onChanged: onThemeToggle,
                          value: themeSwitchValue,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
