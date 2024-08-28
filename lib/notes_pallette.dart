import 'package:flutter/cupertino.dart';
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
  static const cursor = Color.fromARGB(255, 62, 62, 62);

  static Color getNoteColorLight(String title) {
    return HSVColor.fromColor(Color(title.hashCode).withOpacity(1))
        .withSaturation(0.2)
        .withValue(0.85)
        .toColor();
  }

  static Color getNoteColorDark(String title) {
    return HSVColor.fromColor(Color(title.hashCode).withOpacity(1))
        .withSaturation(0.4)
        .withValue(0.85)
        .toColor();
  }

  static ThemeData get lightTheme => ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: floatingButton,
          splashColor: splashColor,
          foregroundColor: buttonTextDark,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: buttonTextDark,
          elevation: 0,
        ),
        dividerTheme: const DividerThemeData(),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(buttonTextDark),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: cursor,
        ),
        iconTheme: const IconThemeData(
          color: cardIcon,
        ),
        dialogBackgroundColor: dialogBackground,
        inputDecorationTheme: const InputDecorationTheme(fillColor: note),
        dialogTheme: const DialogTheme(
          backgroundColor: dialogBackground,
          titleTextStyle: TextStyle(color: buttonTextDark),
          contentTextStyle: TextStyle(color: buttonTextDark),
        ),
        colorScheme: const ColorScheme(
          primary: note,
          secondary: floatingButton,
          surface: background,
          error: Colors.red,
          onPrimary: textDark,
          onSecondary: buttonTextDark,
          onSurface: backgroundTransparent,
          onError: Colors.orange,
          brightness: Brightness.light,
        ),
        shadowColor: noteShadow,
      ).copyWith(extensions: const <NotesPalletteExtension>[
        NotesPalletteExtension(
          boxShadow: noteShadow,
          noteColorGenerator: getNoteColorLight,
        ),
      ]);

  static ThemeData get darkTheme => ThemeData(

  );

  static NotesPalletteExtension of(BuildContext context) =>
      Theme.of(context).extension<NotesPalletteExtension>()!;
}

class NotesPalletteExtension extends ThemeExtension<NotesPalletteExtension> {
  final Color boxShadow;
  final Color Function(String) noteColorGenerator;
  final Color cupertinoDialogActionNegative = CupertinoColors.systemRed;
  final Color cupertinoDialogActionPositive = CupertinoColors.systemBlue;

  Color getNoteColor(String text) => noteColorGenerator(text);

  const NotesPalletteExtension({
    required this.boxShadow,
    required this.noteColorGenerator,
  });

  @override
  ThemeExtension<NotesPalletteExtension> copyWith({Color? boxShadow, Color Function(String)? noteColorGenerator}) {
    return NotesPalletteExtension(
      boxShadow: boxShadow ?? this.boxShadow,
      noteColorGenerator: noteColorGenerator ?? this.noteColorGenerator,
    );
  }

  @override
  ThemeExtension<NotesPalletteExtension> lerp(
      covariant NotesPalletteExtension? other, double t) {
    if (other == null) return this;
    return NotesPalletteExtension(
      boxShadow: Color.lerp(boxShadow, other.boxShadow, t)!,
      noteColorGenerator: (text) {
        return Color.lerp(
            noteColorGenerator(text), other.noteColorGenerator(text), t)!;
      },
    );
  }
}
