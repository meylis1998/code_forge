# CodeForge

A native macOS desktop app for LeetCode practice, built with Flutter.

Browse ~3,000 problems offline, write solutions in a syntax-highlighted editor, run code against test cases, view official solutions, track your progress with stats and heatmaps, and follow contest schedules — all from your desktop.

## Features

- **Offline Problem Browsing** — ~3,000 LeetCode problems stored locally in SQLite. Search with 400ms debounce, filter by difficulty (Easy/Medium/Hard), status (Solved/Attempted), and topic tags. No internet required for browsing.
- **Favorites** — Bookmark problems with a toggle and filter your list to show only favorites.
- **Code Editor** — Syntax-highlighted editor (JetBrains Mono) supporting 17 languages. Switch languages mid-problem, auto-save drafts, and configure font size, tab size, and editor theme.
- **Code Templates** — Define per-language boilerplate code that pre-fills the editor when switching languages.
- **Run & Submit** — Execute code against example or custom test cases and submit solutions directly to LeetCode. Results display runtime, memory usage, percentile rankings, and detailed error information (compile errors, runtime errors, wrong answer diffs).
- **Problem Notes** — Write and auto-save per-problem notes with timestamps, persisted in SQLite.
- **Solution Viewer** — Browse official LeetCode solutions directly inside the app.
- **Dashboard** — Visualize solving stats with a difficulty breakdown pie chart, submission activity heatmap (52-week), streak counter, daily challenge card, language statistics, skill breakdown (Fundamental/Intermediate/Advanced), and contest statistics.
- **Submission History** — Browse all past submissions with status (color-coded), language, runtime, memory, and date.
- **Contest Calendar** — Track upcoming and past contests with a real-time countdown timer, duration, and virtual/premium indicators.
- **Settings** — Configure editor preferences (default language, font size, tab size, editor theme), manage your LeetCode connection, and toggle auto-save.
- **Dark & Light Themes** — Full Material Design 3 theme support with 4 editor color schemes: Monokai, VS Code Dark, GitHub Dark, and Solarized Dark.

## Supported Languages

Python 3, Python, Java, C++, C, JavaScript, TypeScript, Go, Rust, Swift, Kotlin, C#, Ruby, Scala, Dart, PHP, MySQL (17 total)

## Requirements

- macOS 13.0+
- Flutter 3.11+ / Dart 3.11+

## Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/code_forge.git
cd code_forge

# Install dependencies
flutter pub get

# Generate Drift database code
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run -d macos
```

## Connecting Your LeetCode Account

CodeForge uses cookie-based authentication. To connect:

1. Open LeetCode in your browser and log in
2. Open browser DevTools → Application → Cookies → `leetcode.com`
3. Copy the values of `LEETCODE_SESSION` and `csrftoken`
4. In CodeForge, go to **Settings → Account → Connect** and paste both values

Your credentials are stored securely in the macOS Keychain via `flutter_secure_storage`. Features that require authentication (Dashboard stats, Run/Submit, Submission History, Contests) become available after connecting.

## Architecture

Clean Architecture with BLoC pattern across 7 features:

```
lib/
├── core/                 # Shared infrastructure
│   ├── constants/        # App constants, API URLs, language mappings
│   ├── database/         # Drift/SQLite — 8 tables, DAOs, migrations (schema v3)
│   ├── network/          # Dio HTTP client, GraphQL queries, cookie & retry interceptors
│   ├── theme/            # Material3 light/dark themes, color palette, 4 editor themes
│   ├── navigation/       # GoRouter with StatefulShellRoute (sidebar shell)
│   ├── storage/          # Keychain wrapper (flutter_secure_storage)
│   ├── dependency_injection/ # GetIt service locator
│   └── platform/         # macOS window management
├── features/
│   ├── auth/             # Cookie auth → Keychain → API validation
│   ├── problems/         # Browse, search, filter, favorites (SQLite + remote sync)
│   ├── editor/           # Code editor, run/submit, notes, solutions, templates
│   ├── dashboard/        # Stats, charts, heatmap, daily challenge, contest stats
│   ├── submissions/      # Submission history (SQLite)
│   ├── contests/         # Contest calendar with countdown timer
│   └── settings/         # Editor preferences (HydratedCubit), code templates
└── shared/               # Reusable widgets: sidebar shell, split view, loading/error states
```

Each feature follows `data → domain → presentation` layers with BLoC/Cubit for state management.

### Database Schema

8 SQLite tables managed by Drift ORM:

| Table | Purpose |
|-------|---------|
| `problems` | Cached LeetCode problems (~3,000 rows) |
| `topic_tags` | Tag/category reference |
| `problem_topic_tags` | Many-to-many join table |
| `code_snippets` | Language-specific starter code per problem |
| `submissions` | User submission history |
| `user_progress` | Local progress tracking (streak, totals) |
| `notes` | Per-problem notes |
| `code_templates` | Custom boilerplate per language |

### State Management

| Feature | State | Persistence |
|---------|-------|-------------|
| Auth | `AuthBloc` | Keychain |
| Problems | `ProblemListBloc` | SQLite |
| Code Editor | `CodeEditorBloc` | In-memory drafts |
| Code Execution | `CodeExecutionBloc` | SQLite |
| Dashboard | `DashboardBloc` | GraphQL cache |
| Submissions | `SubmissionsBloc` | SQLite |
| Contests | `ContestBloc` | GraphQL cache |
| Settings | `SettingsCubit` (HydratedCubit) | Local JSON |
| Notes | `NoteCubit` | SQLite |
| Solutions | `SolutionCubit` | GraphQL cache |
| Code Templates | `CodeTemplateCubit` | SQLite |

### API Integration

The `LeetCodeApiClient` (Dio-based) communicates via:

- **GraphQL** (`POST /graphql`) — problem list/detail/snippets, user stats, daily challenge, contests
- **REST** — run code (`POST /problems/:slug/interpret_solution/`), submit (`POST /problems/:slug/submit/`), poll results (`GET /submissions/detail/:id/check/`)

Results are polled with exponential backoff (1s → 10s, max 30 attempts). Auth is handled via `LEETCODE_SESSION` + `csrftoken` cookies injected automatically by `CookieInterceptor`.

## Key Dependencies

| Category | Package |
|----------|---------|
| State Management | `flutter_bloc`, `hydrated_bloc`, `bloc_concurrency` |
| Database | `drift`, `drift_flutter`, `sqlite3_flutter_libs` |
| Network | `dio`, `connectivity_plus`, `pretty_dio_logger` |
| Navigation | `go_router` |
| Code Editor | `flutter_code_editor`, `flutter_highlight` |
| HTML Rendering | `flutter_widget_from_html` |
| Charts | `fl_chart` |
| Dependency Injection | `get_it` |
| Secure Storage | `flutter_secure_storage` |
| Utilities | `dartz`, `rxdart`, `intl`, `url_launcher`, `logger` |
| UI | `google_fonts`, `shimmer` |
| macOS | `window_manager` |

## Running Tests

```bash
flutter test
```

The test suite has 170+ test cases across unit tests (entities, use cases, repositories), BLoC tests, and widget tests. Tests are organized to mirror the `lib/` structure under `test/`.

## Building

```bash
flutter build macos --release
```

The built app will be at `build/macos/Build/Products/Release/code_forge.app`.

## CI/CD

GitHub Actions runs on every push:

- **Analyze** — `flutter analyze` + `dart format` check
- **Test** — `flutter test` with coverage
- **Build** — `flutter build macos --release` (on `main` branch only)

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Run `flutter analyze` and `flutter test`
5. Commit and push
6. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## License

MIT — see [LICENSE](LICENSE) for details.

## Disclaimer

CodeForge is an unofficial, community-built tool. It is not affiliated with or endorsed by LeetCode. Use responsibly and in accordance with LeetCode's terms of service.
