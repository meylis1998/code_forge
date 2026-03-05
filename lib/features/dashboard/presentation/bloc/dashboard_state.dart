part of 'dashboard_bloc.dart';

enum DashboardStatus { initial, loading, loaded, error, unauthenticated }

class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.initial,
    this.stats,
    this.dailyChallenge,
    this.contestStats,
    this.languageStats = const [],
    this.skillStats,
    this.errorMessage,
  });

  final DashboardStatus status;
  final UserStats? stats;
  final DailyChallenge? dailyChallenge;
  final ContestStats? contestStats;
  final List<LanguageStat> languageStats;
  final SkillStats? skillStats;
  final String? errorMessage;

  DashboardState copyWith({
    DashboardStatus? status,
    UserStats? stats,
    DailyChallenge? dailyChallenge,
    ContestStats? contestStats,
    List<LanguageStat>? languageStats,
    SkillStats? skillStats,
    String? errorMessage,
  }) {
    return DashboardState(
      status: status ?? this.status,
      stats: stats ?? this.stats,
      dailyChallenge: dailyChallenge ?? this.dailyChallenge,
      contestStats: contestStats ?? this.contestStats,
      languageStats: languageStats ?? this.languageStats,
      skillStats: skillStats ?? this.skillStats,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        stats,
        dailyChallenge,
        contestStats,
        languageStats,
        skillStats,
        errorMessage,
      ];
}
