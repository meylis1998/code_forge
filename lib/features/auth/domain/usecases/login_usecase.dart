import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_state_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase<AuthUser, LoginParams> {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(LoginParams params) {
    return _repository.login(
      session: params.session,
      csrfToken: params.csrfToken,
    );
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.session,
    required this.csrfToken,
  });

  final String session;
  final String csrfToken;

  @override
  List<Object?> get props => [session, csrfToken];
}
