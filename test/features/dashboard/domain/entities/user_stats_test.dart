import 'package:code_forge/features/dashboard/domain/entities/user_stats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserStats', () {
    test('solveRate returns correct ratio', () {
      const stats = UserStats(
        username: 'user',
        totalSolved: 90,
        totalQuestions: 3000,
      );
      expect(stats.solveRate, closeTo(0.03, 0.01));
    });

    test('solveRate returns 0 when totalQuestions is 0', () {
      const stats = UserStats(username: 'user');
      expect(stats.solveRate, 0);
    });

    test('supports equality based on props', () {
      const stats1 = UserStats(username: 'user', totalSolved: 10, streak: 5);
      const stats2 = UserStats(username: 'user', totalSolved: 10, streak: 5);
      expect(stats1, equals(stats2));
    });

    test('different stats are not equal', () {
      const stats1 = UserStats(username: 'user1');
      const stats2 = UserStats(username: 'user2');
      expect(stats1, isNot(equals(stats2)));
    });
  });

  group('DailyChallenge', () {
    test('supports equality based on date and titleSlug', () {
      const c1 = DailyChallenge(
        date: '2024-01-01',
        questionId: '1',
        frontendId: '1',
        title: 'Two Sum',
        titleSlug: 'two-sum',
        difficulty: 'Easy',
      );
      const c2 = DailyChallenge(
        date: '2024-01-01',
        questionId: '1',
        frontendId: '1',
        title: 'Two Sum',
        titleSlug: 'two-sum',
        difficulty: 'Easy',
      );
      expect(c1, equals(c2));
    });

    test('has default values', () {
      const c = DailyChallenge(
        date: '2024-01-01',
        questionId: '1',
        frontendId: '1',
        title: 'Two Sum',
        titleSlug: 'two-sum',
        difficulty: 'Easy',
      );
      expect(c.acRate, 0);
      expect(c.isPaidOnly, false);
      expect(c.topicTags, isEmpty);
      expect(c.userStatus, isNull);
    });
  });

  group('ContestStats', () {
    test('has correct default values', () {
      const stats = ContestStats();
      expect(stats.attendedContestsCount, 0);
      expect(stats.rating, 0);
      expect(stats.globalRanking, 0);
      expect(stats.topPercentage, 0);
      expect(stats.history, isEmpty);
    });

    test('supports equality', () {
      const s1 = ContestStats(rating: 1500, globalRanking: 1000);
      const s2 = ContestStats(rating: 1500, globalRanking: 1000);
      expect(s1, equals(s2));
    });
  });

  group('ContestRecord', () {
    test('supports equality based on props', () {
      const r1 = ContestRecord(
        contestTitle: 'Weekly 400',
        contestStartTime: 1700000000,
        rating: 1500,
        ranking: 100,
      );
      const r2 = ContestRecord(
        contestTitle: 'Weekly 400',
        contestStartTime: 1700000000,
        rating: 1500,
        ranking: 100,
      );
      expect(r1, equals(r2));
    });
  });

  group('LanguageStat', () {
    test('supports equality', () {
      const l1 = LanguageStat(languageName: 'Python', problemsSolved: 50);
      const l2 = LanguageStat(languageName: 'Python', problemsSolved: 50);
      expect(l1, equals(l2));
    });

    test('different stats are not equal', () {
      const l1 = LanguageStat(languageName: 'Python', problemsSolved: 50);
      const l2 = LanguageStat(languageName: 'Java', problemsSolved: 50);
      expect(l1, isNot(equals(l2)));
    });
  });

  group('SkillStats', () {
    test('has empty default lists', () {
      const skills = SkillStats();
      expect(skills.fundamental, isEmpty);
      expect(skills.intermediate, isEmpty);
      expect(skills.advanced, isEmpty);
    });

    test('supports equality', () {
      const s1 = SkillStats(
        fundamental: [
          TagSkill(tagName: 'Array', tagSlug: 'array', problemsSolved: 10),
        ],
      );
      const s2 = SkillStats(
        fundamental: [
          TagSkill(tagName: 'Array', tagSlug: 'array', problemsSolved: 10),
        ],
      );
      expect(s1, equals(s2));
    });
  });

  group('TagSkill', () {
    test('supports equality based on tagSlug and problemsSolved', () {
      const t1 =
          TagSkill(tagName: 'Array', tagSlug: 'array', problemsSolved: 10);
      const t2 =
          TagSkill(tagName: 'Array', tagSlug: 'array', problemsSolved: 10);
      expect(t1, equals(t2));
    });
  });
}
