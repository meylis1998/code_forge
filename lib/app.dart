import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_constants.dart';
import 'core/dependency_injection/injection_container.dart';
import 'core/navigation/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/contests/presentation/bloc/contest_bloc.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/problems/domain/repositories/problem_repository.dart';
import 'features/problems/presentation/bloc/problem_list_bloc.dart';
import 'features/settings/presentation/bloc/code_template_cubit.dart';
import 'features/settings/presentation/bloc/settings_cubit.dart';
import 'features/submissions/presentation/bloc/submissions_bloc.dart';

class CodeForgeApp extends StatefulWidget {
  const CodeForgeApp({super.key});

  @override
  State<CodeForgeApp> createState() => _CodeForgeAppState();
}

class _CodeForgeAppState extends State<CodeForgeApp> {
  @override
  void initState() {
    super.initState();
    _seedData();
  }

  Future<void> _seedData() async {
    await sl<ProblemRepository>().seedProblemsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>()..add(AuthCheckRequested()),
        ),
        BlocProvider<ProblemListBloc>(
          create: (_) => sl<ProblemListBloc>()..add(ProblemListFetched()),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => sl<DashboardBloc>(),
        ),
        BlocProvider<SubmissionsBloc>(
          create: (_) => sl<SubmissionsBloc>()..add(SubmissionsLoaded()),
        ),
        BlocProvider<ContestBloc>(
          create: (_) => sl<ContestBloc>()..add(ContestsLoaded()),
        ),
        BlocProvider<SettingsCubit>(
          create: (_) => SettingsCubit(),
        ),
        BlocProvider<CodeTemplateCubit>(
          create: (_) => sl<CodeTemplateCubit>()..loadTemplates(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, settingsState) {
          return MaterialApp.router(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _getThemeMode(settingsState.themeMode),
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.dark;
    }
  }
}
