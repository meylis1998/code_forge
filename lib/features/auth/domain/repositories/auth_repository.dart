import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_state_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUser>> login({
    required String session,
    required String csrfToken,
  });

  Future<Either<Failure, AuthUser>> getCurrentUser();

  Future<Either<Failure, void>> logout();

  Future<bool> isAuthenticated();
}
