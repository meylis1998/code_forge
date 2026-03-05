import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_state_entity.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase extends UseCase<AuthUser, NoParams> {
  GetCurrentUserUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(NoParams params) {
    return _repository.getCurrentUser();
  }
}
