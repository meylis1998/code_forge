# Contributing to CodeForge

Thanks for your interest in contributing! Here's how to get started.

## Development Setup

1. Ensure you have Flutter 3.11+ installed
2. Clone the repo and run `flutter pub get`
3. Generate code: `dart run build_runner build --delete-conflicting-outputs`
4. Run: `flutter run -d macos`

## Code Style

- Follow `very_good_analysis` lint rules
- Run `flutter analyze` before submitting — must have zero issues
- Use relative imports within `lib/`
- Follow existing clean architecture patterns (data/domain/presentation)

## Pull Requests

- Keep PRs focused on a single change
- Include tests for new BLoCs and use cases
- Ensure all existing tests pass: `flutter test`
- Write clear commit messages

## Reporting Issues

Open an issue with:
- Steps to reproduce
- Expected vs actual behavior
- macOS version and Flutter version (`flutter --version`)

## Architecture Guidelines

- **New features**: Create under `lib/features/<name>/` with data, domain, presentation layers
- **State management**: Use BLoC for complex features, Cubit for simple state
- **Database**: Add new tables in `lib/core/database/tables/`, create DAOs in `daos/`
- **API calls**: Add GraphQL queries to `graphql_queries.dart`, use `LeetCodeApiClient`
