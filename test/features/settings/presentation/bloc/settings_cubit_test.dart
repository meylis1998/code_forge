import 'package:code_forge/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});
    when(() => storage.close()).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('SettingsState', () {
    test('has correct defaults', () {
      const state = SettingsState();
      expect(state.themeMode, 'dark');
      expect(state.editorFontSize, 14);
      expect(state.editorTabSize, 4);
      expect(state.editorTheme, 'Monokai');
      expect(state.defaultLanguage, 'python3');
      expect(state.autoSave, true);
    });

    test('copyWith returns new instance with updated values', () {
      const state = SettingsState();
      final updated = state.copyWith(
        themeMode: 'light',
        editorFontSize: 18,
        editorTabSize: 2,
        editorTheme: 'VS Code Dark',
        defaultLanguage: 'cpp',
        autoSave: false,
      );

      expect(updated.themeMode, 'light');
      expect(updated.editorFontSize, 18);
      expect(updated.editorTabSize, 2);
      expect(updated.editorTheme, 'VS Code Dark');
      expect(updated.defaultLanguage, 'cpp');
      expect(updated.autoSave, false);
    });

    test('copyWith preserves values when not provided', () {
      const state = SettingsState(
        themeMode: 'light',
        editorFontSize: 18,
      );
      final updated = state.copyWith(editorTabSize: 2);

      expect(updated.themeMode, 'light');
      expect(updated.editorFontSize, 18);
      expect(updated.editorTabSize, 2);
    });

    test('supports equality', () {
      const state1 = SettingsState();
      const state2 = SettingsState();
      expect(state1, state2);
    });

    test('different states are not equal', () {
      const state1 = SettingsState();
      const state2 = SettingsState(themeMode: 'light');
      expect(state1, isNot(state2));
    });
  });

  group('SettingsCubit serialization', () {
    late SettingsCubit cubit;

    setUp(() {
      cubit = SettingsCubit();
    });

    tearDown(() => cubit.close());

    test('toJson returns correct map', () {
      final json = cubit.toJson(const SettingsState());
      expect(json, {
        'themeMode': 'dark',
        'editorFontSize': 14.0,
        'editorTabSize': 4,
        'editorTheme': 'Monokai',
        'defaultLanguage': 'python3',
        'autoSave': true,
      });
    });

    test('fromJson returns correct state', () {
      final state = cubit.fromJson({
        'themeMode': 'light',
        'editorFontSize': 18.0,
        'editorTabSize': 2,
        'editorTheme': 'VS Code Dark',
        'defaultLanguage': 'cpp',
        'autoSave': false,
      });

      expect(state?.themeMode, 'light');
      expect(state?.editorFontSize, 18);
      expect(state?.editorTabSize, 2);
      expect(state?.editorTheme, 'VS Code Dark');
      expect(state?.defaultLanguage, 'cpp');
      expect(state?.autoSave, false);
    });

    test('fromJson handles missing values with defaults', () {
      final state = cubit.fromJson({});

      expect(state?.themeMode, 'dark');
      expect(state?.editorFontSize, 14);
      expect(state?.editorTabSize, 4);
      expect(state?.editorTheme, 'Monokai');
      expect(state?.defaultLanguage, 'python3');
      expect(state?.autoSave, true);
    });
  });

  group('SettingsCubit methods', () {
    late SettingsCubit cubit;

    setUp(() {
      cubit = SettingsCubit();
    });

    tearDown(() => cubit.close());

    test('setThemeMode emits updated state', () {
      cubit.setThemeMode('light');
      expect(cubit.state.themeMode, 'light');
    });

    test('setEditorFontSize emits updated state', () {
      cubit.setEditorFontSize(20);
      expect(cubit.state.editorFontSize, 20);
    });

    test('setEditorTabSize emits updated state', () {
      cubit.setEditorTabSize(2);
      expect(cubit.state.editorTabSize, 2);
    });

    test('setEditorTheme emits updated state', () {
      cubit.setEditorTheme('GitHub Dark');
      expect(cubit.state.editorTheme, 'GitHub Dark');
    });

    test('setDefaultLanguage emits updated state', () {
      cubit.setDefaultLanguage('java');
      expect(cubit.state.defaultLanguage, 'java');
    });

    test('setAutoSave emits updated state', () {
      cubit.setAutoSave(enabled: false);
      expect(cubit.state.autoSave, false);
    });
  });
}
