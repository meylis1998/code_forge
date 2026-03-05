import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/exceptions.dart';
import '../../data/datasources/dashboard_remote_data_source.dart';
import '../../domain/entities/user_stats.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required DashboardRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource,
       super(const DashboardState()) {
    on<DashboardLoaded>(_onLoaded);
    on<DashboardRefreshed>(_onRefreshed);
  }

  final DashboardRemoteDataSource _remoteDataSource;

  Future<void> _onLoaded(
    DashboardLoaded event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      // Fetch core stats and daily challenge (required)
      final stats = await _remoteDataSource.getUserStats(event.username);
      final daily = await _remoteDataSource.getDailyChallenge();

      // Fetch supplementary data (non-blocking failures)
      ContestStats? contestStats;
      var languageStats = <LanguageStat>[];
      SkillStats? skillStats;

      try {
        contestStats = await _remoteDataSource.getContestStats(event.username);
      } catch (_) {}

      try {
        languageStats = await _remoteDataSource.getLanguageStats(
          event.username,
        );
      } catch (_) {}

      try {
        skillStats = await _remoteDataSource.getSkillStats(event.username);
      } catch (_) {}

      emit(
        state.copyWith(
          status: DashboardStatus.loaded,
          stats: stats,
          dailyChallenge: daily,
          contestStats: contestStats,
          languageStats: languageStats,
          skillStats: skillStats,
        ),
      );
    } on AuthException {
      emit(
        state.copyWith(
          status: DashboardStatus.unauthenticated,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DashboardStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onRefreshed(
    DashboardRefreshed event,
    Emitter<DashboardState> emit,
  ) async {
    if (state.stats == null) return;
    await _onLoaded(
      DashboardLoaded(state.stats!.username),
      emit,
    );
  }
}
