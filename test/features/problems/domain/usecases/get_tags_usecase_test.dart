import 'package:code_forge/core/domain/usecase.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/repositories/problem_repository.dart';
import 'package:code_forge/features/problems/domain/usecases/get_tags_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProblemRepository extends Mock implements ProblemRepository {}

void main() {
  late GetTagsUseCase useCase;
  late MockProblemRepository mockRepository;

  setUp(() {
    mockRepository = MockProblemRepository();
    useCase = GetTagsUseCase(mockRepository);
  });

  const tTags = [
    TopicTag(id: '1', name: 'Array', slug: 'array'),
    TopicTag(id: '2', name: 'Hash Table', slug: 'hash-table'),
  ];

  test('should return tags from repository', () async {
    when(() => mockRepository.getAllTags())
        .thenAnswer((_) async => const Right(tTags));

    final result = await useCase(NoParams());

    expect(result, const Right(tTags));
    verify(() => mockRepository.getAllTags()).called(1);
  });

  test('should return failure when repository fails', () async {
    when(() => mockRepository.getAllTags())
        .thenAnswer((_) async => const Left(
              CacheFailure(message: 'DB error'),
            ));

    final result = await useCase(NoParams());

    expect(result, isA<Left>());
  });
}
