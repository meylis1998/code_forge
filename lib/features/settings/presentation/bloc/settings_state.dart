part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.themeMode = 'dark',
    this.editorFontSize = 14,
    this.editorTabSize = 4,
    this.editorTheme = 'Monokai',
    this.defaultLanguage = 'python3',
    this.autoSave = true,
  });

  final String themeMode;
  final double editorFontSize;
  final int editorTabSize;
  final String editorTheme;
  final String defaultLanguage;
  final bool autoSave;

  SettingsState copyWith({
    String? themeMode,
    double? editorFontSize,
    int? editorTabSize,
    String? editorTheme,
    String? defaultLanguage,
    bool? autoSave,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      editorFontSize: editorFontSize ?? this.editorFontSize,
      editorTabSize: editorTabSize ?? this.editorTabSize,
      editorTheme: editorTheme ?? this.editorTheme,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      autoSave: autoSave ?? this.autoSave,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        editorFontSize,
        editorTabSize,
        editorTheme,
        defaultLanguage,
        autoSave,
      ];
}
