import 'dart:math';

import 'package:flutter/material.dart';

class NotesPallette {
  static const background = Color.fromARGB(255, 176, 190, 197);
  static const backgroundTransparent = Color.fromARGB(0, 176, 190, 197);
  static const floatingButton = Color.fromARGB(255, 113, 137, 148);
  static const splashColor = Color.fromARGB(100, 176, 190, 197);
  static const noteShadow = Color.fromARGB(163, 144, 156, 162);

  static Color getNoteColor(String title) {
    return const Color.fromARGB(255, 207, 216, 220);
  }

  static Color getRandomColor() {
    return Color(Random().nextInt(0xffffffff));
  }
}
