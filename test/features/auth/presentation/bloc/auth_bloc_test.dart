import 'package:bloc_test/bloc_test.dart';
import 'package:code_forge/core/domain/usecase.dart';
import 'package:code_forge/core/errors/failures.dart';
import 'package:code_forge/features/auth/domain/entities/auth_state_entity.dart';
import 'package:code_forge/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:code_forge/features/auth/domain/usecases/login_usecase.dart';
import 'package:code_forge/features/auth/domain/usecases/logout_usecase.dart';
import 'package:code_forge/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockGetCurrentUserUseCase extends Mock implements GetCurrentUserUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class FakeLoginParams extends Fake implements LoginParams {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late AuthBloc bloc;
  late MockLoginUseCase mockLogin;
  late MockGetCurrentUserUseCase mockGetCurrentUser;
  late MockLogoutUseCase mockLogout;

  setUpAll(() {
    registerFallbackValue(FakeLoginParams());
    registerFallbackValue(FakeNoParams());
  });

  setUp(() {
    mockLogin = MockLoginUseCase();
    mockGetCurrentUser = MockGetCurrentUserUseCase();
    mockLogout = MockLogoutUseCase();
    bloc = AuthBloc(
      loginUseCase: mockLogin,
      getCurrentUserUseCase: mockGetCurrentUser,
      logoutUseCase: mockLogout,
    );
  });

  tearDown(() => bloc.close());

  const tUser = AuthUser(username: 'testuser', realName: 'Test User');

  test('initial state is AuthInitial', () {
    expect(bloc.state, AuthInitial());
  });

  group('AuthCheckRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthAuthenticated] when user exists',
      build: () {
        when(
          () => mockGetCurrentUser(any()),
        ).thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => [
        AuthLoading(),
        const AuthAuthenticated(user: tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthUnauthenticated] when no user',
      build: () {
        when(() => mockGetCurrentUser(any())).thenAnswer(
          (_) async => const Left(AuthFailure(message: 'No user')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => [
        AuthLoading(),
        AuthUnauthenticated(),
      ],
    );
  });

  group('AuthLoginRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthAuthenticated] on successful login',
      build: () {
        when(
          () => mockLogin(any()),
        ).thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthLoginRequested(session: 'sess', csrfToken: 'csrf'),
      ),
      expect: () => [
        AuthLoading(),
        const AuthAuthenticated(user: tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] on failed login',
      build: () {
        when(() => mockLogin(any())).thenAnswer(
          (_) async => const Left(AuthFailure(message: 'Invalid')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthLoginRequested(session: 'sess', csrfToken: 'csrf'),
      ),
      expect: () => [
        AuthLoading(),
        const AuthError(message: 'Invalid'),
      ],
    );
  });

  group('AuthLogoutRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthUnauthenticated] on logout',
      build: () {
        when(
          () => mockLogout(any()),
        ).thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(AuthLogoutRequested()),
      expect: () => [
        AuthUnauthenticated(),
      ],
    );
  });
}
