import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/submission_dao.dart';

part 'submissions_event.dart';
part 'submissions_state.dart';

class SubmissionsBloc extends Bloc<SubmissionsEvent, SubmissionsState> {
  SubmissionsBloc({
    required SubmissionDao submissionDao,
  })  : _submissionDao = submissionDao,
        super(const SubmissionsState()) {
    on<SubmissionsLoaded>(_onLoaded);
    on<SubmissionsLoadMore>(_onLoadMore);
    on<SubmissionsFilterChanged>(_onFilterChanged);
  }

  final SubmissionDao _submissionDao;

  Future<void> _onLoaded(
    SubmissionsLoaded event,
    Emitter<SubmissionsState> emit,
  ) async {
    emit(state.copyWith(status: SubmissionsStatus.loading));

    try {
      final submissions = await _submissionDao.getSubmissions(
        limit: 20,
        lang: state.langFilter,
        statusDisplay: state.statusFilter,
      );

      emit(
        state.copyWith(
          status: SubmissionsStatus.loaded,
          submissions: submissions,
          hasReachedMax: submissions.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMore(
    SubmissionsLoadMore event,
    Emitter<SubmissionsState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      final submissions = await _submissionDao.getSubmissions(
        limit: 20,
        offset: state.submissions.length,
        lang: state.langFilter,
        statusDisplay: state.statusFilter,
      );

      emit(
        state.copyWith(
          submissions: [...state.submissions, ...submissions],
          hasReachedMax: submissions.length < 20,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onFilterChanged(
    SubmissionsFilterChanged event,
    Emitter<SubmissionsState> emit,
  ) async {
    emit(state.copyWith(
      langFilter: event.lang,
      statusFilter: event.status,
      status: SubmissionsStatus.loading,
    ));

    try {
      final submissions = await _submissionDao.getSubmissions(
        limit: 20,
        lang: event.lang,
        statusDisplay: event.status,
      );

      emit(
        state.copyWith(
          status: SubmissionsStatus.loaded,
          submissions: submissions,
          hasReachedMax: submissions.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
