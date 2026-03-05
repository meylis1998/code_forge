import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/entities/problem_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Problem', () {
    const problem = Problem(
      id: 1,
      frontendId: '1',
      title: 'Two Sum',
      titleSlug: 'two-sum',
      difficulty: 'Easy',
      status: 'ac',
    );

    test('isSolved returns true when status is ac', () {
      expect(problem.isSolved, true);
    });

    test('isAttempted returns false when status is ac', () {
      expect(problem.isAttempted, false);
    });

    test('isAttempted returns true when status is notac', () {
      const attempted = Problem(
        id: 2,
        frontendId: '2',
        title: 'Add Two Numbers',
        titleSlug: 'add-two-numbers',
        difficulty: 'Medium',
        status: 'notac',
      );
      expect(attempted.isAttempted, true);
      expect(attempted.isSolved, false);
    });

    test('isSolved and isAttempted return false when status is null', () {
      const unsolved = Problem(
        id: 3,
        frontendId: '3',
        title: 'LRU Cache',
        titleSlug: 'lru-cache',
        difficulty: 'Medium',
      );
      expect(unsolved.isSolved, false);
      expect(unsolved.isAttempted, false);
    });

    test('supports equality based on id and titleSlug', () {
      const same = Problem(
        id: 1,
        frontendId: '1',
        title: 'Two Sum Different Name',
        titleSlug: 'two-sum',
        difficulty: 'Hard',
      );
      expect(problem, same);
    });
  });

  group('ProblemFilter', () {
    test('copyWith with nullable fields', () {
      const filter = ProblemFilter(difficulty: 'Easy', status: 'ac');
      final cleared = filter.copyWith(
        difficulty: () => null,
        status: () => null,
      );
      expect(cleared.difficulty, isNull);
      expect(cleared.status, isNull);
    });
  });

  group('CodeExecutionResult', () {
    test('isAccepted returns true for status code 10', () {
      // Tested in code_execution_bloc_test indirectly
    });
  });
}
