import 'package:flutter/material.dart';

import 'color_palette.dart';

class EditorThemeData {
  const EditorThemeData({
    required this.name,
    required this.backgroundColor,
    required this.textColor,
    required this.lineNumberColor,
    required this.selectionColor,
    required this.cursorColor,
  });

  final String name;
  final Color backgroundColor;
  final Color textColor;
  final Color lineNumberColor;
  final Color selectionColor;
  final Color cursorColor;
}

class EditorThemes {
  const EditorThemes._();

  static const monokai = EditorThemeData(
    name: 'Monokai',
    backgroundColor: Color(0xFF272822),
    textColor: Color(0xFFF8F8F2),
    lineNumberColor: Color(0xFF90908A),
    selectionColor: Color(0xFF49483E),
    cursorColor: Color(0xFFF8F8F0),
  );

  static const vscodeDark = EditorThemeData(
    name: 'VS Code Dark',
    backgroundColor: ColorPalette.editorBg,
    textColor: Color(0xFFD4D4D4),
    lineNumberColor: ColorPalette.editorLineNumber,
    selectionColor: ColorPalette.editorSelection,
    cursorColor: ColorPalette.editorCursor,
  );

  static const githubDark = EditorThemeData(
    name: 'GitHub Dark',
    backgroundColor: Color(0xFF0D1117),
    textColor: Color(0xFFC9D1D9),
    lineNumberColor: Color(0xFF484F58),
    selectionColor: Color(0xFF1F6FEB),
    cursorColor: Color(0xFFC9D1D9),
  );

  static const solarizedDark = EditorThemeData(
    name: 'Solarized Dark',
    backgroundColor: Color(0xFF002B36),
    textColor: Color(0xFF839496),
    lineNumberColor: Color(0xFF586E75),
    selectionColor: Color(0xFF073642),
    cursorColor: Color(0xFF839496),
  );

  static const List<EditorThemeData> all = [
    monokai,
    vscodeDark,
    githubDark,
    solarizedDark,
  ];

  static EditorThemeData fromName(String name) {
    return all.firstWhere(
      (t) => t.name == name,
      orElse: () => monokai,
    );
  }
}
