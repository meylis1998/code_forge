import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  String get message;
}

class ServerFailure extends Failure {
  const ServerFailure({required this.message});

  @override
  final String message;

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required this.message});

  @override
  final String message;

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required this.message});

  @override
  final String message;

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  const AuthFailure({required this.message});

  @override
  final String message;

  @override
  List<Object?> get props => [message];
}

class RateLimitFailure extends Failure {
  const RateLimitFailure({required this.message, this.retryAfter});

  @override
  final String message;
  final Duration? retryAfter;

  @override
  List<Object?> get props => [message, retryAfter];
}
