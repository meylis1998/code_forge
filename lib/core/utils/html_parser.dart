class HtmlParser {
  const HtmlParser._();

  /// Strip HTML tags and return plain text
  static String stripHtml(String html) {
    return html
        .replaceAll(RegExp('<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .trim();
  }

  /// Extract example test cases from problem content HTML
  static List<String> extractExamples(String html) {
    final examples = <String>[];
    final inputRegex = RegExp(
      r'<strong>Input:</strong>\s*(.*?)(?=<br|</p)',
      dotAll: true,
    );

    for (final match in inputRegex.allMatches(html)) {
      final input = stripHtml(match.group(1) ?? '').trim();
      if (input.isNotEmpty) {
        examples.add(input);
      }
    }

    return examples;
  }
}
