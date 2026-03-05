class LeetCodeLanguage {
  const LeetCodeLanguage({
    required this.name,
    required this.slug,
    required this.highlightMode,
  });

  final String name;
  final String slug;
  final String highlightMode;
}

class LeetCodeLanguages {
  const LeetCodeLanguages._();

  static const List<LeetCodeLanguage> all = [
    LeetCodeLanguage(
      name: 'Python 3',
      slug: 'python3',
      highlightMode: 'python',
    ),
    LeetCodeLanguage(
      name: 'Python',
      slug: 'python',
      highlightMode: 'python',
    ),
    LeetCodeLanguage(
      name: 'Java',
      slug: 'java',
      highlightMode: 'java',
    ),
    LeetCodeLanguage(
      name: 'C++',
      slug: 'cpp',
      highlightMode: 'cpp',
    ),
    LeetCodeLanguage(
      name: 'C',
      slug: 'c',
      highlightMode: 'c',
    ),
    LeetCodeLanguage(
      name: 'JavaScript',
      slug: 'javascript',
      highlightMode: 'javascript',
    ),
    LeetCodeLanguage(
      name: 'TypeScript',
      slug: 'typescript',
      highlightMode: 'typescript',
    ),
    LeetCodeLanguage(
      name: 'Go',
      slug: 'golang',
      highlightMode: 'go',
    ),
    LeetCodeLanguage(
      name: 'Rust',
      slug: 'rust',
      highlightMode: 'rust',
    ),
    LeetCodeLanguage(
      name: 'Swift',
      slug: 'swift',
      highlightMode: 'swift',
    ),
    LeetCodeLanguage(
      name: 'Kotlin',
      slug: 'kotlin',
      highlightMode: 'kotlin',
    ),
    LeetCodeLanguage(
      name: 'C#',
      slug: 'csharp',
      highlightMode: 'cs',
    ),
    LeetCodeLanguage(
      name: 'Ruby',
      slug: 'ruby',
      highlightMode: 'ruby',
    ),
    LeetCodeLanguage(
      name: 'Scala',
      slug: 'scala',
      highlightMode: 'scala',
    ),
    LeetCodeLanguage(
      name: 'Dart',
      slug: 'dart',
      highlightMode: 'dart',
    ),
    LeetCodeLanguage(
      name: 'PHP',
      slug: 'php',
      highlightMode: 'php',
    ),
    LeetCodeLanguage(
      name: 'SQL',
      slug: 'mysql',
      highlightMode: 'sql',
    ),
  ];

  static LeetCodeLanguage? fromSlug(String slug) {
    try {
      return all.firstWhere((lang) => lang.slug == slug);
    } catch (_) {
      return null;
    }
  }

  static List<String> get slugs => all.map((l) => l.slug).toList();
}
