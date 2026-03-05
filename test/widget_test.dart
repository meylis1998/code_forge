import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/entities/problem_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ProblemFilter copyWith works correctly', () {
    const filter = ProblemFilter(difficulty: 'Easy', page: 0, pageSize: 50);
    final updated = filter.copyWith(
      difficulty: () => 'Medium',
      page: 1,
    );

    expect(updated.difficulty, 'Medium');
    expect(updated.page, 1);
    expect(updated.pageSize, 50);
  });

  test('Problem entity equality', () {
    const p1 = Problem(
      id: 1,
      frontendId: '1',
      title: 'Two Sum',
      titleSlug: 'two-sum',
      difficulty: 'Easy',
    );
    const p2 = Problem(
      id: 1,
      frontendId: '1',
      title: 'Two Sum',
      titleSlug: 'two-sum',
      difficulty: 'Easy',
    );
    expect(p1, p2);
  });
}
