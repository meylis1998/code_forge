import 'package:code_forge/core/domain/usecase.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/auth/domain/entities/auth_state_entity.dart';
import 'package:code_forge/features/auth/domain/repositories/auth_repository.dart';
import 'package:code_forge/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late GetCurrentUserUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = GetCurrentUserUseCase(mockRepository);
  });

  const tUser = AuthUser(username: 'testuser');

  test('should return AuthUser when user is logged in', () async {
    when(
      () => mockRepository.getCurrentUser(),
    ).thenAnswer((_) async => const Right(tUser));

    final result = await useCase(NoParams());

    expect(result, const Right(tUser));
    verify(() => mockRepository.getCurrentUser()).called(1);
  });

  test('should return AuthFailure when no user is logged in', () async {
    const failure = AuthFailure(message: 'No user logged in');
    when(
      () => mockRepository.getCurrentUser(),
    ).thenAnswer((_) async => const Left(failure));

    final result = await useCase(NoParams());

    expect(result, const Left(failure));
  });
}
