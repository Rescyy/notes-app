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

  static const themeDarkText = Color.fromARGB(255, 209, 209, 209);
  static const themeDarkBackground = Color.fromARGB(255, 60, 60, 60);
  static const themeDarkPage = Color.fromARGB(255, 33, 33, 33);
  static const themeDarkPageTransparent = Color.fromARGB(0, 33, 33, 33);
  static const themeDarkShadow = Color.fromARGB(155, 66, 66, 66);
  static const themeDarkFloatingButton = Color.fromARGB(255, 125, 125, 125);

  static Color getNoteColorLight(String title) {
    return HSVColor.fromColor(Color(title.hashCode).withOpacity(1))
        .withSaturation(0.2)
        .withValue(0.85)
        .toColor();
  }

  static Color getNoteColorDark(String title) {
    return HSVColor.fromColor(Color(title.hashCode).withOpacity(1))
        .withSaturation(0.25)
        .withValue(0.65)
        .toColor();
  }

  // TODO: Rework themedata, give better names etc. describe where each color is used

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
          noteColorGenerator: getNoteColorLight,
        ),
      ]);

  static ThemeData get darkTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: themeDarkPage,
          foregroundColor: themeDarkText,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: themeDarkFloatingButton,
          splashColor: splashColor,
          foregroundColor: buttonTextDark,
        ),
        colorScheme: const ColorScheme(
          primary: note,
          secondary: floatingButton,
          surface: themeDarkPage,
          error: Colors.red,
          onPrimary: textDark,
          onSecondary: buttonTextDark,
          onSurface: themeDarkPageTransparent,
          onError: Colors.orange,
          brightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        shadowColor: themeDarkShadow,
      ).copyWith(extensions: const <NotesPalletteExtension>[
        NotesPalletteExtension(
            noteColorGenerator: getNoteColorDark,
            ),
      ]);

  static NotesPalletteExtension of(BuildContext context) =>
      Theme.of(context).extension<NotesPalletteExtension>()!;
}

class NotesPalletteExtension extends ThemeExtension<NotesPalletteExtension> {
  final Color Function(String) noteColorGenerator;
  final Color cupertinoDialogActionNegative = CupertinoColors.systemRed;
  final Color cupertinoDialogActionPositive = CupertinoColors.systemBlue;

  Color getNoteColor(String text) => noteColorGenerator(text);

  static Color _defaultNoteColor(String _) => NotesPallette.themeDarkBackground;

  const NotesPalletteExtension({
    this.noteColorGenerator = _defaultNoteColor,
  });

  @override
  ThemeExtension<NotesPalletteExtension> copyWith(
      {Color? boxShadow, Color Function(String)? noteColorGenerator}) {
    return NotesPalletteExtension(
      noteColorGenerator: noteColorGenerator ?? this.noteColorGenerator,
    );
  }

  @override
  ThemeExtension<NotesPalletteExtension> lerp(
      covariant NotesPalletteExtension? other, double t) {
    if (other == null) return this;
    return NotesPalletteExtension(
      noteColorGenerator: (text) {
        return Color.lerp(
            noteColorGenerator(text), other.noteColorGenerator(text), t)!;
      },
    );
  }
}
