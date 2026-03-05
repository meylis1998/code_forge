part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardLoaded extends DashboardEvent {
  const DashboardLoaded(this.username);

  final String username;

  @override
  List<Object?> get props => [username];
}

class DashboardRefreshed extends DashboardEvent {}
