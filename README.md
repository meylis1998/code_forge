# CodeForge

A native macOS desktop app for LeetCode practice, built with Flutter.

Browse problems offline, write solutions in a syntax-highlighted editor, run code against test cases, and track your progress — all from your desktop.

## Features

- **Offline Problem Browsing** — ~3000 LeetCode problems stored locally in SQLite. Search, filter by difficulty/status/tags, no internet required.
- **Code Editor** — Syntax-highlighted editor with JetBrains Mono, language switching, auto-save drafts, and configurable font/tab/theme settings.
- **Run & Submit** — Execute code against test cases and submit solutions directly to LeetCode. Results display runtime, memory, and percentile rankings.
- **Dashboard** — View your solving stats, difficulty breakdown pie chart, submission heatmap, streak counter, and daily challenge.
- **Submission History** — Browse past submissions with status, runtime, memory, and date.
- **Settings** — Configure editor preferences (language, font size, tab size, theme), manage your LeetCode connection, toggle auto-save.
- **Dark & Light Themes** — Full theme support with 4 editor color schemes (Monokai, VS Code Dark, GitHub Dark, Solarized Dark).

## Requirements

- macOS 13.0+
- Flutter 3.11+ (Dart 3.11+)

## Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/code_forge.git
cd code_forge

# Install dependencies
flutter pub get

# Generate drift database code
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run -d macos
```

## Connecting Your LeetCode Account

CodeForge uses cookie-based authentication. To connect:

1. Open LeetCode in your browser and log in
2. Open browser DevTools → Application → Cookies → `leetcode.com`
3. Copy the values of `LEETCODE_SESSION` and `csrftoken`
4. In CodeForge, go to Settings → Account → Connect, and paste both values

Your credentials are stored securely using macOS Keychain via `flutter_secure_storage`.

## Architecture

Clean Architecture with BLoC pattern:

```
lib/
├── core/           # Shared infrastructure
│   ├── database/   # Drift/SQLite tables, DAOs, migrations
│   ├── network/    # Dio HTTP client, GraphQL queries, interceptors
│   ├── theme/      # Light/dark themes, color palette, editor themes
│   └── navigation/ # GoRouter with sidebar shell
├── features/
│   ├── auth/       # Cookie auth → secure storage → API validation
│   ├── problems/   # Browse, search, filter (local SQLite + remote sync)
│   ├── editor/     # Code editor, run/submit, language switching
│   ├── dashboard/  # Stats, charts, heatmap, daily challenge
│   ├── submissions/# Submission history
│   └── settings/   # Editor preferences (HydratedCubit)
└── shared/         # Reusable widgets (sidebar, split view, loading states)
```

Each feature follows `data → domain → presentation` layers.

## Key Dependencies

| Category | Package |
|----------|---------|
| State Management | `flutter_bloc`, `hydrated_bloc` |
| Database | `drift` (SQLite) |
| Network | `dio` |
| Navigation | `go_router` |
| Code Editor | `flutter_code_editor` |
| Charts | `fl_chart` |
| DI | `get_it` |
| Secure Storage | `flutter_secure_storage` |

## Running Tests

```bash
flutter test
```

## Building

```bash
flutter build macos --release
```

The built app will be at `build/macos/Build/Products/Release/code_forge.app`.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Run `flutter analyze` and `flutter test`
5. Commit and push
6. Open a Pull Request

## License

MIT — see [LICENSE](LICENSE) for details.

## Disclaimer

CodeForge is an unofficial, community-built tool. It is not affiliated with or endorsed by LeetCode. Use responsibly and in accordance with LeetCode's terms of service.
