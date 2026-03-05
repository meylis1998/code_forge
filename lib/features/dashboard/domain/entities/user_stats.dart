import 'package:equatable/equatable.dart';

class UserStats extends Equatable {
  const UserStats({
    required this.username,
    this.easySolved = 0,
    this.mediumSolved = 0,
    this.hardSolved = 0,
    this.totalSolved = 0,
    this.easyTotal = 0,
    this.mediumTotal = 0,
    this.hardTotal = 0,
    this.totalQuestions = 0,
    this.ranking = 0,
    this.reputation = 0,
    this.streak = 0,
    this.totalActiveDays = 0,
    this.submissionCalendar = const {},
    this.activeYears = const [],
    this.beatsPercentage = const {},
    this.languageStats = const [],
    this.skillStats,
    this.contestStats,
  });

  final String username;
  final int easySolved;
  final int mediumSolved;
  final int hardSolved;
  final int totalSolved;
  final int easyTotal;
  final int mediumTotal;
  final int hardTotal;
  final int totalQuestions;
  final int ranking;
  final int reputation;
  final int streak;
  final int totalActiveDays;
  final Map<String, int> submissionCalendar;
  final List<int> activeYears;
  final Map<String, double> beatsPercentage;
  final List<LanguageStat> languageStats;
  final SkillStats? skillStats;
  final ContestStats? contestStats;

  double get solveRate =>
      totalQuestions > 0 ? totalSolved / totalQuestions : 0;

  @override
  List<Object?> get props => [username, totalSolved, ranking, streak];
}

class DailyChallenge extends Equatable {
  const DailyChallenge({
    required this.date,
    required this.questionId,
    required this.frontendId,
    required this.title,
    required this.titleSlug,
    required this.difficulty,
    this.acRate = 0,
    this.link,
    this.userStatus,
    this.isPaidOnly = false,
    this.topicTags = const [],
  });

  final String date;
  final String questionId;
  final String frontendId;
  final String title;
  final String titleSlug;
  final String difficulty;
  final double acRate;
  final String? link;
  final String? userStatus;
  final bool isPaidOnly;
  final List<String> topicTags;

  @override
  List<Object?> get props => [date, titleSlug];
}

class ContestStats extends Equatable {
  const ContestStats({
    this.attendedContestsCount = 0,
    this.rating = 0,
    this.globalRanking = 0,
    this.totalParticipants = 0,
    this.topPercentage = 0,
    this.badgeName,
    this.history = const [],
  });

  final int attendedContestsCount;
  final double rating;
  final int globalRanking;
  final int totalParticipants;
  final double topPercentage;
  final String? badgeName;
  final List<ContestRecord> history;

  @override
  List<Object?> get props => [rating, globalRanking, attendedContestsCount];
}

class ContestRecord extends Equatable {
  const ContestRecord({
    required this.contestTitle,
    required this.contestStartTime,
    this.attended = false,
    this.problemsSolved = 0,
    this.totalProblems = 0,
    this.finishTimeInSeconds = 0,
    this.rating = 0,
    this.ranking = 0,
    this.trendDirection,
  });

  final String contestTitle;
  final int contestStartTime;
  final bool attended;
  final int problemsSolved;
  final int totalProblems;
  final int finishTimeInSeconds;
  final double rating;
  final int ranking;
  final String? trendDirection;

  @override
  List<Object?> get props => [contestTitle, rating, ranking];
}

class LanguageStat extends Equatable {
  const LanguageStat({
    required this.languageName,
    required this.problemsSolved,
  });

  final String languageName;
  final int problemsSolved;

  @override
  List<Object?> get props => [languageName, problemsSolved];
}

class SkillStats extends Equatable {
  const SkillStats({
    this.fundamental = const [],
    this.intermediate = const [],
    this.advanced = const [],
  });

  final List<TagSkill> fundamental;
  final List<TagSkill> intermediate;
  final List<TagSkill> advanced;

  @override
  List<Object?> get props => [fundamental, intermediate, advanced];
}

class TagSkill extends Equatable {
  const TagSkill({
    required this.tagName,
    required this.tagSlug,
    required this.problemsSolved,
  });

  final String tagName;
  final String tagSlug;
  final int problemsSolved;

  @override
  List<Object?> get props => [tagSlug, problemsSolved];
}
