import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/exceptions.dart';
import '../../data/datasources/contest_remote_data_source.dart';
import '../../domain/entities/contest.dart';

part 'contest_event.dart';
part 'contest_state.dart';

class ContestBloc extends Bloc<ContestEvent, ContestState> {
  ContestBloc({required ContestRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource,
      super(const ContestState()) {
    on<ContestsLoaded>(_onLoaded);
    on<ContestsRefreshed>(_onRefreshed);
  }

  final ContestRemoteDataSource _remoteDataSource;

  Future<void> _onLoaded(
    ContestsLoaded event,
    Emitter<ContestState> emit,
  ) async {
    emit(state.copyWith(status: ContestStatus.loading));

    try {
      final contests = await _remoteDataSource.getContests();
      // Sort by start time descending (newest first)
      contests.sort((a, b) => b.startTime.compareTo(a.startTime));

      emit(
        state.copyWith(
          status: ContestStatus.loaded,
          contests: contests,
        ),
      );
    } on AuthException {
      emit(
        state.copyWith(
          status: ContestStatus.error,
          errorMessage: 'Authentication required to view contests',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ContestStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onRefreshed(
    ContestsRefreshed event,
    Emitter<ContestState> emit,
  ) async {
    add(ContestsLoaded());
  }
}
