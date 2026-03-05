import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/repositories/problem_repository.dart';
import 'package:code_forge/features/problems/domain/usecases/get_problem_detail_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProblemRepository extends Mock implements ProblemRepository {}

void main() {
  late GetProblemDetailUseCase useCase;
  late MockProblemRepository mockRepository;

  setUp(() {
    mockRepository = MockProblemRepository();
    useCase = GetProblemDetailUseCase(mockRepository);
  });

  const tProblem = Problem(
    id: 1,
    frontendId: '1',
    title: 'Two Sum',
    titleSlug: 'two-sum',
    difficulty: 'Easy',
    content: '<p>Given an array...</p>',
    acRate: 52.3,
    isPaidOnly: false,
  );

  test('should return problem detail from repository', () async {
    when(
      () => mockRepository.getProblemDetail('two-sum'),
    ).thenAnswer((_) async => const Right(tProblem));

    final result = await useCase('two-sum');

    expect(result, const Right(tProblem));
    verify(() => mockRepository.getProblemDetail('two-sum')).called(1);
  });

  test('should return failure when repository fails', () async {
    when(() => mockRepository.getProblemDetail('unknown')).thenAnswer(
      (_) async => const Left(
        CacheFailure(message: 'Not found'),
      ),
    );

    final result = await useCase('unknown');

    expect(result, isA<Left>());
  });
}
