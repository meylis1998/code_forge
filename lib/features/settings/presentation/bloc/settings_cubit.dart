import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void setThemeMode(String mode) => emit(state.copyWith(themeMode: mode));

  void setEditorFontSize(double size) =>
      emit(state.copyWith(editorFontSize: size));

  void setEditorTabSize(int size) => emit(state.copyWith(editorTabSize: size));

  void setEditorTheme(String theme) => emit(state.copyWith(editorTheme: theme));

  void setDefaultLanguage(String language) =>
      emit(state.copyWith(defaultLanguage: language));

  void setAutoSave({required bool enabled}) =>
      emit(state.copyWith(autoSave: enabled));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState(
      themeMode: json['themeMode'] as String? ?? 'dark',
      editorFontSize: (json['editorFontSize'] as num?)?.toDouble() ?? 14,
      editorTabSize: json['editorTabSize'] as int? ?? 4,
      editorTheme: json['editorTheme'] as String? ?? 'Monokai',
      defaultLanguage: json['defaultLanguage'] as String? ?? 'python3',
      autoSave: json['autoSave'] as bool? ?? true,
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      'themeMode': state.themeMode,
      'editorFontSize': state.editorFontSize,
      'editorTabSize': state.editorTabSize,
      'editorTheme': state.editorTheme,
      'defaultLanguage': state.defaultLanguage,
      'autoSave': state.autoSave,
    };
  }
}
