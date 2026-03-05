import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/entities/problem_filter.dart';
import 'package:code_forge/features/problems/domain/repositories/problem_repository.dart';
import 'package:code_forge/features/problems/domain/usecases/get_problems_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProblemRepository extends Mock implements ProblemRepository {}

void main() {
  late GetProblemsUseCase useCase;
  late MockProblemRepository mockRepository;

  setUp(() {
    mockRepository = MockProblemRepository();
    useCase = GetProblemsUseCase(mockRepository);
  });

  const tFilter = ProblemFilter();
  final tProblems = [
    const Problem(
      id: 1,
      frontendId: '1',
      title: 'Two Sum',
      titleSlug: 'two-sum',
      difficulty: 'Easy',
    ),
    const Problem(
      id: 2,
      frontendId: '2',
      title: 'Add Two Numbers',
      titleSlug: 'add-two-numbers',
      difficulty: 'Medium',
    ),
  ];

  test('should return list of problems from repository', () async {
    when(
      () => mockRepository.getProblems(tFilter),
    ).thenAnswer((_) async => Right(tProblems));

    final result = await useCase(tFilter);

    expect(result, Right(tProblems));
    verify(() => mockRepository.getProblems(tFilter)).called(1);
  });

  test('should return failure when repository fails', () async {
    const failure = ServerFailure(message: 'DB error');
    when(
      () => mockRepository.getProblems(tFilter),
    ).thenAnswer((_) async => const Left(failure));

    final result = await useCase(tFilter);

    expect(result, const Left(failure));
  });
}
