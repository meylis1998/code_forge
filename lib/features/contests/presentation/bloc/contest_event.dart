part of 'contest_bloc.dart';

abstract class ContestEvent extends Equatable {
  const ContestEvent();

  @override
  List<Object?> get props => [];
}

class ContestsLoaded extends ContestEvent {}

class ContestsRefreshed extends ContestEvent {}
