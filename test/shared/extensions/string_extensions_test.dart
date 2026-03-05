import 'package:code_forge/shared/extensions/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtensions', () {
    test('capitalize uppercases first letter', () {
      expect('hello'.capitalize, 'Hello');
    });

    test('capitalize returns empty string for empty input', () {
      expect(''.capitalize, '');
    });

    test('capitalize preserves already capitalized', () {
      expect('Hello'.capitalize, 'Hello');
    });

    test('titleCase capitalizes each word', () {
      expect('hello world'.titleCase, 'Hello World');
    });

    test('truncate returns original when shorter than maxLength', () {
      expect('hello'.truncate(10), 'hello');
    });

    test('truncate truncates and adds ellipsis', () {
      expect('hello world'.truncate(5), 'hello...');
    });

    test('truncate handles exact length', () {
      expect('hello'.truncate(5), 'hello');
    });
  });

  group('NullableStringExtensions', () {
    test('isNullOrEmpty returns true for null', () {
      const String? value = null;
      expect(value.isNullOrEmpty, true);
    });

    test('isNullOrEmpty returns true for empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations -- need String? type to test nullable extension
      const String? val = '';
      expect(val.isNullOrEmpty, true);
    });

    test('isNullOrEmpty returns false for non-empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations -- need String? type to test nullable extension
      const String? val = 'hello';
      expect(val.isNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns true for non-empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations -- need String? type to test nullable extension
      const String? val = 'hello';
      expect(val.isNotNullOrEmpty, true);
    });

    test('isNotNullOrEmpty returns false for null', () {
      const String? value = null;
      expect(value.isNotNullOrEmpty, false);
    });
  });
}
