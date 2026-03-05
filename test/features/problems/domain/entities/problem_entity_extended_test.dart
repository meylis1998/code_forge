import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SimilarQuestion', () {
    test('supports equality based on titleSlug', () {
      const q1 = SimilarQuestion(
        title: 'Three Sum',
        titleSlug: 'three-sum',
        difficulty: 'Medium',
      );
      const q2 = SimilarQuestion(
        title: 'Three Sum',
        titleSlug: 'three-sum',
        difficulty: 'Medium',
      );
      expect(q1, equals(q2));
    });

    test('has default isPaidOnly as false', () {
      const q = SimilarQuestion(
        title: 'Test',
        titleSlug: 'test',
        difficulty: 'Easy',
      );
      expect(q.isPaidOnly, false);
    });
  });

  group('ProblemMetaData', () {
    test('supports equality', () {
      const m1 = ProblemMetaData(
        name: 'twoSum',
        params: [
          ParamInfo(name: 'nums', type: 'integer[]'),
          ParamInfo(name: 'target', type: 'integer'),
        ],
        returnType: 'integer[]',
      );
      const m2 = ProblemMetaData(
        name: 'twoSum',
        params: [
          ParamInfo(name: 'nums', type: 'integer[]'),
          ParamInfo(name: 'target', type: 'integer'),
        ],
        returnType: 'integer[]',
      );
      expect(m1, equals(m2));
    });

    test('has empty params by default', () {
      const m = ProblemMetaData();
      expect(m.params, isEmpty);
      expect(m.name, isNull);
      expect(m.returnType, isNull);
    });
  });

  group('ParamInfo', () {
    test('supports equality', () {
      const p1 = ParamInfo(name: 'nums', type: 'integer[]');
      const p2 = ParamInfo(name: 'nums', type: 'integer[]');
      expect(p1, equals(p2));
    });

    test('different params are not equal', () {
      const p1 = ParamInfo(name: 'nums', type: 'integer[]');
      const p2 = ParamInfo(name: 'target', type: 'integer');
      expect(p1, isNot(equals(p2)));
    });
  });

  group('ProblemStats', () {
    test('supports equality', () {
      const s1 = ProblemStats(
        totalAccepted: '1M',
        totalSubmission: '2M',
        totalAcceptedRaw: 1000000,
        totalSubmissionRaw: 2000000,
        acRate: '50%',
      );
      const s2 = ProblemStats(
        totalAccepted: '1M',
        totalSubmission: '2M',
        totalAcceptedRaw: 1000000,
        totalSubmissionRaw: 2000000,
        acRate: '50%',
      );
      expect(s1, equals(s2));
    });

    test('has sensible defaults', () {
      const s = ProblemStats();
      expect(s.totalAccepted, '');
      expect(s.totalSubmission, '');
      expect(s.totalAcceptedRaw, 0);
      expect(s.totalSubmissionRaw, 0);
      expect(s.acRate, '');
    });
  });

  group('TopicTag', () {
    test('supports equality', () {
      const t1 = TopicTag(id: '1', name: 'Array', slug: 'array');
      const t2 = TopicTag(id: '1', name: 'Array', slug: 'array');
      expect(t1, equals(t2));
    });
  });

  group('CodeSnippet', () {
    test('supports equality', () {
      const s1 = CodeSnippet(
        lang: 'Python3',
        langSlug: 'python3',
        code: 'class Solution:',
      );
      const s2 = CodeSnippet(
        lang: 'Python3',
        langSlug: 'python3',
        code: 'class Solution:',
      );
      expect(s1, equals(s2));
    });
  });

  group('Problem', () {
    test('hasSolution defaults to false', () {
      const p = Problem(
        id: 1,
        frontendId: '1',
        title: 'Two Sum',
        titleSlug: 'two-sum',
        difficulty: 'Easy',
      );
      expect(p.hasSolution, false);
      expect(p.hasVideoSolution, false);
      expect(p.similarQuestions, isEmpty);
      expect(p.metaData, isNull);
      expect(p.stats, isNull);
    });
  });
}
