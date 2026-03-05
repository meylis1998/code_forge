part of 'submissions_bloc.dart';

abstract class SubmissionsEvent extends Equatable {
  const SubmissionsEvent();

  @override
  List<Object?> get props => [];
}

class SubmissionsLoaded extends SubmissionsEvent {}

class SubmissionsLoadMore extends SubmissionsEvent {}

class SubmissionsFilterChanged extends SubmissionsEvent {
  const SubmissionsFilterChanged({this.lang, this.status});

  final String? lang;
  final String? status;

  @override
  List<Object?> get props => [lang, status];
}
