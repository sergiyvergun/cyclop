import 'package:flutter/material.dart';
//
// class Labels {
//   static const String mainTitle = 'Colors';
//   static const String opacity = 'Opacity';
//   static const String red = 'Red';
//   static const String green = 'Green';
//   static const String blue = 'Blue';
//   static const String hue = 'Hue';
//   static const String saturation = 'Saturation';
//   static const String light = 'Lightness';
// }

const defaultRadius = 8.0;

const defaultBorderRadius = BorderRadius.all(Radius.circular(defaultRadius));

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xfff0f0f0),
  backgroundColor: const Color(0xffdadada),
  toggleableActiveColor: Colors.cyan,
  inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
        isDense: true,
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(defaultRadius)),
      ),
  dialogTheme: ThemeData.light().dialogTheme.copyWith(
        backgroundColor: const Color(0xfff6f6f6),
        elevation: 0.0,
      ),
  iconTheme: ThemeData.light().iconTheme.copyWith(color: Colors.blue),
  textButtonTheme: TextButtonThemeData(style: _lightTextButtonStyle),
);

final darkTheme = ThemeData.dark().copyWith(
  backgroundColor: Colors.grey.shade700,
  toggleableActiveColor: Colors.cyan,
  textSelectionTheme: ThemeData.light()
      .textSelectionTheme
      .copyWith(selectionColor: Colors.cyan.shade700),
  dialogTheme: ThemeData.light().dialogTheme.copyWith(
        backgroundColor: Colors.grey.shade800,
        elevation: 0.0,
      ),
  inputDecorationTheme:
      lightTheme.inputDecorationTheme.copyWith(fillColor: Colors.grey[800]),
  textButtonTheme: TextButtonThemeData(style: _darkTextButtonStyle),
);

final _lightTextButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(borderRadius: defaultBorderRadius),
  ),
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
  ),
  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
  overlayColor: MaterialStateProperty.all(Colors.white30),
);

final _darkTextButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(borderRadius: defaultBorderRadius),
  ),
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
  ),
  foregroundColor: MaterialStateProperty.all(Colors.white70),
  overlayColor: MaterialStateProperty.all(Colors.black12),
);
