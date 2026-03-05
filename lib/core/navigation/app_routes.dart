import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/contests/presentation/pages/contests_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/editor/presentation/pages/solve_page.dart';
import '../../features/problems/presentation/pages/problems_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/submissions/presentation/pages/submissions_page.dart';
import '../../shared/widgets/main_shell.dart';

class AppRoutes {
  const AppRoutes._();

  // Route paths
  static const String problems = '/problems';
  static const String problemDetail = '/problems/:slug';
  static const String dashboard = '/dashboard';
  static const String submissions = '/submissions';
  static const String contests = '/contests';
  static const String settings = '/settings';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: problems,
    debugLogDiagnostics: true,
    routes: [
      // Main shell with sidebar navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: problems,
                name: 'problems',
                builder: (context, state) => const ProblemsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: dashboard,
                name: 'dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: submissions,
                name: 'submissions',
                builder: (context, state) => const SubmissionsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: contests,
                name: 'contests',
                builder: (context, state) => const ContestsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: settings,
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
      // Full-screen routes (outside shell)
      GoRoute(
        path: problemDetail,
        name: 'problemDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return SolvePage(titleSlug: slug);
        },
      ),
    ],
  );
}
