import 'package:bloc_test/bloc_test.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/problems/domain/entities/problem_entity.dart';
import 'package:code_forge/features/problems/domain/entities/problem_filter.dart';
import 'package:code_forge/features/problems/domain/usecases/get_problems_usecase.dart';
import 'package:code_forge/features/problems/presentation/bloc/problem_list_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProblemsUseCase extends Mock implements GetProblemsUseCase {}

class FakeProblemFilter extends Fake implements ProblemFilter {}

void main() {
  late ProblemListBloc bloc;
  late MockGetProblemsUseCase mockGetProblems;

  setUpAll(() {
    registerFallbackValue(FakeProblemFilter());
  });

  setUp(() {
    mockGetProblems = MockGetProblemsUseCase();
    bloc = ProblemListBloc(getProblems: mockGetProblems);
  });

  tearDown(() => bloc.close());

  final tProblems = List.generate(
    10,
    (i) => Problem(
      id: i,
      frontendId: '$i',
      title: 'Problem $i',
      titleSlug: 'problem-$i',
      difficulty: 'Easy',
    ),
  );

  test('initial state is correct', () {
    expect(bloc.state, const ProblemListState());
    expect(bloc.state.status, ProblemListStatus.initial);
  });

  group('ProblemListFetched', () {
    blocTest<ProblemListBloc, ProblemListState>(
      'emits [loading, success] with problems on success',
      build: () {
        when(() => mockGetProblems(any()))
            .thenAnswer((_) async => Right(tProblems));
        return bloc;
      },
      act: (bloc) => bloc.add(ProblemListFetched()),
      expect: () => [
        const ProblemListState(status: ProblemListStatus.loading),
        ProblemListState(
          status: ProblemListStatus.success,
          problems: tProblems,
          hasReachedMax: true,
        ),
      ],
    );

    blocTest<ProblemListBloc, ProblemListState>(
      'emits [loading, failure] on error',
      build: () {
        when(() => mockGetProblems(any())).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'DB error')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(ProblemListFetched()),
      expect: () => [
        const ProblemListState(status: ProblemListStatus.loading),
        const ProblemListState(
          status: ProblemListStatus.failure,
          errorMessage: 'DB error',
        ),
      ],
    );
  });

  group('ProblemListFilterChanged', () {
    blocTest<ProblemListBloc, ProblemListState>(
      'fetches problems with new filter',
      build: () {
        when(() => mockGetProblems(any()))
            .thenAnswer((_) async => Right(tProblems));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const ProblemListFilterChanged(ProblemFilter(difficulty: 'Easy')),
      ),
      expect: () => [
        const ProblemListState(
          status: ProblemListStatus.loading,
          filter: ProblemFilter(difficulty: 'Easy'),
        ),
        ProblemListState(
          status: ProblemListStatus.success,
          problems: tProblems,
          filter: const ProblemFilter(difficulty: 'Easy'),
          hasReachedMax: true,
        ),
      ],
    );
  });

  group('ProblemListLoadMore', () {
    blocTest<ProblemListBloc, ProblemListState>(
      'does nothing when hasReachedMax is true',
      build: () => bloc,
      seed: () => ProblemListState(
        status: ProblemListStatus.success,
        problems: tProblems,
        hasReachedMax: true,
      ),
      act: (bloc) => bloc.add(ProblemListLoadMore()),
      expect: () => <ProblemListState>[],
    );
  });
}
