import 'package:flutter/material.dart';

class NotesPallette {
  // static const background = Color.fromARGB(255, 176, 190, 197);
  static const background = Color.fromARGB(255, 207, 216, 220);
  // static const backgroundTransparent = Color.fromARGB(0, 176, 190, 197);
  static const backgroundTransparent = Color.fromARGB(0, 207, 216, 220);
  // static const floatingButton = Color.fromARGB(255, 113, 137, 148);
  static const floatingButton = Color.fromARGB(255, 144, 164, 174);
  static const splashColor = Color.fromARGB(100, 176, 190, 197);
  static const noteShadow = Color.fromARGB(163, 144, 156, 162);
  static const note = Color.fromARGB(255, 207, 216, 220);
  static const dialogBackground = Color.fromARGB(255, 176, 190, 197);
  static const dialogButton = Color.fromARGB(255, 112, 128, 134);
  static const buttonTextDark = Color.fromARGB(255, 38, 50, 56);
  static const buttonTextLight = Color.fromARGB(255, 176, 190, 197);
  static const textDark = Colors.black;
  static const cardIcon = Color.fromARGB(255, 120, 144, 156);

  static Color getNoteColor(String title) {
    return HSVColor.fromColor(
      Color(title.hashCode)
        .withOpacity(1))
        .withSaturation(0.2)
        .withValue(0.85)
        .toColor();
  }
}
