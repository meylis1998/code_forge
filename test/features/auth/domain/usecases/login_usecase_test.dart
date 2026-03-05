import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/auth/domain/entities/auth_state_entity.dart';
import 'package:code_forge/features/auth/domain/repositories/auth_repository.dart';
import 'package:code_forge/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  const tUser = AuthUser(username: 'testuser', realName: 'Test User');
  const tParams = LoginParams(session: 'session123', csrfToken: 'csrf123');

  test('should return AuthUser on successful login', () async {
    when(
      () => mockRepository.login(
        session: any(named: 'session'),
        csrfToken: any(named: 'csrfToken'),
      ),
    ).thenAnswer((_) async => const Right(tUser));

    final result = await useCase(tParams);

    expect(result, const Right(tUser));
    verify(
      () => mockRepository.login(
        session: 'session123',
        csrfToken: 'csrf123',
      ),
    ).called(1);
  });

  test('should return AuthFailure when login fails', () async {
    const failure = AuthFailure(message: 'Invalid credentials');
    when(
      () => mockRepository.login(
        session: any(named: 'session'),
        csrfToken: any(named: 'csrfToken'),
      ),
    ).thenAnswer((_) async => const Left(failure));

    final result = await useCase(tParams);

    expect(result, const Left(failure));
  });
}
