part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested({
    required this.session,
    required this.csrfToken,
  });

  final String session;
  final String csrfToken;

  @override
  List<Object?> get props => [session, csrfToken];
}

class AuthLogoutRequested extends AuthEvent {}
