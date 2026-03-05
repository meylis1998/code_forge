import 'package:code_forge/core/domain/usecase.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/auth/domain/repositories/auth_repository.dart';
import 'package:code_forge/features/auth/domain/usecases/logout_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LogoutUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LogoutUseCase(mockRepository);
  });

  test('should call repository.logout successfully', () async {
    when(() => mockRepository.logout())
        .thenAnswer((_) async => const Right(null));

    final result = await useCase(NoParams());

    expect(result, const Right(null));
    verify(() => mockRepository.logout()).called(1);
  });

  test('should return failure when logout fails', () async {
    const failure = CacheFailure(message: 'Failed to clear storage');
    when(() => mockRepository.logout())
        .thenAnswer((_) async => const Left(failure));

    final result = await useCase(NoParams());

    expect(result, const Left(failure));
  });
}
