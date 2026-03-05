import 'package:code_forge/core/utils/html_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HtmlParser', () {
    group('stripHtml', () {
      test('removes simple HTML tags', () {
        expect(HtmlParser.stripHtml('<p>Hello</p>'), 'Hello');
      });

      test('removes nested tags', () {
        expect(
          HtmlParser.stripHtml('<div><p><b>Bold</b> text</p></div>'),
          'Bold text',
        );
      });

      test('returns same string when no tags', () {
        expect(HtmlParser.stripHtml('plain text'), 'plain text');
      });

      test('handles self-closing tags', () {
        expect(HtmlParser.stripHtml('line1<br/>line2'), 'line1line2');
      });

      test('decodes HTML entities', () {
        expect(
          HtmlParser.stripHtml('a &lt; b &amp; c &gt; d'),
          'a < b & c > d',
        );
      });

      test('decodes nbsp', () {
        expect(
          HtmlParser.stripHtml('hello&nbsp;world'),
          'hello world',
        );
      });

      test('decodes quotes', () {
        expect(
          HtmlParser.stripHtml('&quot;hello&quot; &#39;world&#39;'),
          '"hello" \'world\'',
        );
      });
    });

    group('extractExamples', () {
      test('extracts input from example block', () {
        const html =
            '<p>Description</p><strong>Input:</strong> nums = [2,7]<br/>';
        final examples = HtmlParser.extractExamples(html);
        expect(examples, ['nums = [2,7]']);
      });

      test('extracts multiple examples', () {
        const html = '''
<strong>Input:</strong> nums = [2,7], target = 9<br/>
<strong>Output:</strong> [0,1]
<strong>Input:</strong> nums = [3,2,4], target = 6<br/>
<strong>Output:</strong> [1,2]
''';
        final examples = HtmlParser.extractExamples(html);
        expect(examples.length, 2);
      });

      test('returns empty list when no examples', () {
        expect(HtmlParser.extractExamples('<p>No examples</p>'), isEmpty);
      });
    });
  });
}
