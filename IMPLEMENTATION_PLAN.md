# CodeForge — Next Steps Implementation Plan

## Phase A: Git Init + First Commit

### A1. Initialize Git Repository
```bash
cd /Volumes/512-SSD/flutter_projects/code_forge
git init
```

### A2. Verify .gitignore
Ensure these are excluded:
- `build/`, `.dart_tool/`, `.packages`
- `*.g.dart` — NO, keep generated files (drift needs them)
- `.env`, `*.jks`, `*.keystore`
- `.flutter-plugins-dependencies`
- `macos/Flutter/ephemeral/`
- `.idea/`, `.vscode/`
- `coverage/`

### A3. Stage All Files
```bash
git add .
```

### A4. Create Initial Commit
```bash
git commit -m "Initial commit: CodeForge — macOS LeetCode practice app

- Clean Architecture (data/domain/presentation) with BLoC pattern
- Offline problem browsing (~3000 problems via SQLite/Drift)
- LeetCode GraphQL + REST API integration
- Code editor with syntax highlighting (flutter_code_editor)
- Run/submit code with polling-based execution
- Dashboard with stats, heatmap, contest info, language/skill breakdown
- Submission history with filters
- Cookie-based auth (LEETCODE_SESSION + csrftoken)
- Settings with HydratedCubit persistence
- Dark/light theme support
- 90 unit tests passing, 0 analysis issues
- MIT License"
```

---

## Phase B: Push to GitHub

### B1. Create GitHub Repository
```bash
gh repo create code_forge --public --description "Open-source macOS LeetCode practice app built with Flutter" --source=. --push
```

### B2. Add GitHub Topics
```bash
gh repo edit --add-topic flutter,leetcode,macos,desktop,dart,clean-architecture,bloc,open-source
```

---

## Phase C: CI/CD — GitHub Actions

### C1. Create `.github/workflows/ci.yml`
Triggers: push to `main`, pull requests to `main`

**Jobs:**

#### Job 1: `analyze`
- Runs on: `macos-latest`
- Steps:
  1. Checkout code
  2. Setup Flutter (stable channel)
  3. `flutter pub get`
  4. `dart run build_runner build --delete-conflicting-outputs`
  5. `flutter analyze --no-fatal-infos`
  6. `dart format --set-exit-if-changed .`

#### Job 2: `test`
- Runs on: `macos-latest`
- Needs: `analyze`
- Steps:
  1. Checkout code
  2. Setup Flutter (stable channel)
  3. `flutter pub get`
  4. `dart run build_runner build --delete-conflicting-outputs`
  5. `flutter test --coverage`
  6. Upload coverage artifact

#### Job 3: `build` (only on push to main)
- Runs on: `macos-latest`
- Needs: `test`
- Steps:
  1. Checkout code
  2. Setup Flutter (stable channel)
  3. `flutter pub get`
  4. `dart run build_runner build --delete-conflicting-outputs`
  5. `flutter build macos --release`
  6. Upload `build/macos/Build/Products/Release/code_forge.app` as artifact

---

## Phase D: More Tests

### D1. Missing Unit Tests (Priority Order)

#### D1a. `SubmissionsBloc` Test
**File:** `test/features/submissions/presentation/bloc/submissions_bloc_test.dart`
**Tests (~8):**
- Initial state is correct
- `SubmissionsLoaded` → emits [loading, loaded] with submissions
- `SubmissionsLoaded` → emits [loading, error] on failure
- `SubmissionsLoadMore` → appends submissions, updates hasReachedMax
- `SubmissionsLoadMore` → does nothing when hasReachedMax is true
- `SubmissionsFilterChanged` → refetches with lang filter
- `SubmissionsFilterChanged` → refetches with status filter
- `SubmissionsFilterChanged` → clears filters

#### D1b. `ProblemRepositoryImpl` Test
**File:** `test/features/problems/data/repositories/problem_repository_impl_test.dart`
**Tests (~10):**
- `getProblems` returns problems from remote when online
- `getProblems` returns problems from local when offline
- `getProblems` caches remote results locally
- `getProblems` returns failure on error
- `getProblemDetail` returns problem from remote
- `getProblemDetail` falls back to local on network error
- `getProblemDetail` returns failure when problem not found
- `getTags` returns tags from local data source
- `seedProblemsFromJson` delegates to local data source
- `seedProblemsFromJson` skips when already seeded

#### D1c. `CodeExecutionRepositoryImpl` Test
**File:** `test/features/editor/data/repositories/code_execution_repository_impl_test.dart`
**Tests (~6):**
- `runCode` sends interpret request and polls for result
- `runCode` returns error on network failure
- `submitCode` sends submit request and polls for result
- `submitCode` saves submission to DB on accepted
- Polling handles PENDING → SUCCESS transition
- Polling times out after max attempts

#### D1d. `GetProblemDetailUseCase` + `GetTagsUseCase` Tests
**File:** `test/features/problems/domain/usecases/get_problem_detail_usecase_test.dart`
**Tests (~2):** success and failure

**File:** `test/features/problems/domain/usecases/get_tags_usecase_test.dart`
**Tests (~2):** success and failure

#### D1e. `UserStats` Entity Tests
**File:** `test/features/dashboard/domain/entities/user_stats_test.dart`
**Tests (~8):**
- `solveRate` calculation with valid totals
- `solveRate` returns 0 when totalQuestions is 0
- `DailyChallenge` equality
- `ContestStats` topPercentage calculation
- `LanguageStat` equality and sorting
- `SkillStats` aggregation
- `UserStats` props include all fields
- `submissionCalendar` parsing

#### D1f. Data Source Tests
**File:** `test/features/problems/data/datasources/problem_remote_data_source_test.dart`
**Tests (~6):**
- `getProblems` parses GraphQL response correctly
- `getProblems` handles empty response
- `getProblemDetail` parses all fields including JSON strings
- `getProblemDetail` handles missing optional fields
- `_parseSimilarQuestions` handles malformed JSON
- `_parseMetaData` handles malformed JSON

**File:** `test/features/dashboard/data/datasources/dashboard_remote_data_source_test.dart`
**Tests (~8):**
- `getUserStats` parses full response
- `getUserStats` handles missing submissionCalendar
- `getDailyChallenge` parses response with tags
- `getContestStats` parses contest history
- `getLanguageStats` sorts by problems solved
- `getSkillStats` parses all three levels
- `getBeatsPercentage` parses response
- Methods throw on auth error

#### D1g. Core Utility Tests
**File:** `test/core/network/cookie_interceptor_test.dart`
**Tests (~4):**
- Adds LEETCODE_SESSION cookie to request
- Adds csrftoken cookie to request
- Adds x-csrftoken header
- Skips when no credentials stored

**File:** `test/core/network/retry_interceptor_test.dart`
**Tests (~3):**
- Retries on 429 status
- Retries on 503 status
- Does not retry on 400 status

**File:** `test/core/storage/secure_storage_helper_test.dart`
**Tests (~6):**
- Save and retrieve LEETCODE_SESSION
- Save and retrieve csrfToken
- Save and retrieve username
- `isAuthenticated` returns true when session exists
- `isAuthenticated` returns false when no session
- `clearAuth` removes all credentials

**File:** `test/core/network/network_info_test.dart`
**Tests (~2):**
- Returns true when connected
- Returns false when disconnected

### D2. Widget Tests

#### D2a. Shared Widgets
**File:** `test/shared/widgets/empty_state_widget_test.dart`
**Tests (~3):**
- Renders icon, title, subtitle
- Renders without subtitle
- Renders with action widget

**File:** `test/shared/widgets/error_widget_test.dart`
**Tests (~3):**
- Renders error message
- Shows retry button when callback provided
- Hides retry button when no callback

**File:** `test/shared/widgets/loading_widget_test.dart`
**Tests (~3):**
- Shows progress indicator
- Shows message when provided
- Shows shimmer list tile

#### D2b. Feature Widgets
**File:** `test/features/problems/presentation/widgets/problem_list_tile_test.dart`
**Tests (~5):**
- Renders problem title and number
- Shows difficulty badge with correct color
- Shows solved icon for solved problems
- Shows attempted icon for attempted problems
- Shows lock icon for paid-only problems

**File:** `test/features/problems/presentation/widgets/problem_filter_bar_test.dart`
**Tests (~4):**
- Renders all filter chips
- Tapping difficulty chip calls onFilterChanged
- Tapping status chip calls onFilterChanged
- Clear button resets all filters

**File:** `test/features/auth/presentation/widgets/login_dialog_test.dart`
**Tests (~4):**
- Renders session and csrf token fields
- Login button disabled when fields empty
- Shows error message from AuthBloc
- Dismisses on successful login

### D3. Integration Tests (Lightweight)

**File:** `test/features/problems/presentation/pages/problems_page_test.dart`
**Tests (~4):**
- Renders problem list on success
- Shows loading state initially
- Shows error state with retry
- Shows empty state when no problems

**File:** `test/features/settings/presentation/pages/settings_page_test.dart`
**Tests (~3):**
- Renders all settings sections
- Theme mode dropdown works
- Font size slider updates value

### Total New Tests: ~95 tests across 18 new test files
### Grand Total: ~185 tests (90 existing + 95 new)

---

## Phase E: Additional Features

### E1. Favorites (Problem Bookmarks)

#### E1a. Database
- Add `isFavorite` column to `ProblemsTable` (already exists — `BoolColumn` default false)
- Add `toggleFavorite(int problemId)` method to `ProblemDao`
- Add `getFavoriteProblems()` method to `ProblemDao`

#### E1b. Domain Layer
- Add `toggleFavorite(int problemId)` to `ProblemRepository`
- Create `ToggleFavoriteUseCase`

#### E1c. Data Layer
- Add `toggleFavorite` to `ProblemRepositoryImpl`
- Add `toggleFavorite` to `ProblemLocalDataSource`

#### E1d. Presentation
- Add `ProblemListFavoriteToggled(int problemId)` event to `ProblemListBloc`
- Add favorite filter chip to `ProblemFilterBar` (heart icon, "Favorites")
- Add heart icon button to `ProblemListTile` (right side, toggles on tap)
- Add `ProblemFilter.isFavorite` bool field

#### E1e. Files to Create/Modify
- CREATE: `lib/features/problems/domain/usecases/toggle_favorite_usecase.dart`
- MODIFY: `lib/core/database/daos/problem_dao.dart` (add toggleFavorite, getFavorites)
- MODIFY: `lib/features/problems/domain/entities/problem_filter.dart` (add isFavorite)
- MODIFY: `lib/features/problems/domain/repositories/problem_repository.dart`
- MODIFY: `lib/features/problems/data/repositories/problem_repository_impl.dart`
- MODIFY: `lib/features/problems/data/datasources/problem_local_data_source.dart`
- MODIFY: `lib/features/problems/presentation/bloc/problem_list_bloc.dart` (+event)
- MODIFY: `lib/features/problems/presentation/bloc/problem_list_event.dart` (+event)
- MODIFY: `lib/features/problems/presentation/widgets/problem_filter_bar.dart`
- MODIFY: `lib/features/problems/presentation/widgets/problem_list_tile.dart`
- MODIFY: `lib/core/dependency_injection/injection_container.dart` (register usecase)

---

### E2. Problem Notes

#### E2a. Database
- CREATE new table: `NotesTable`
  - `id` (autoincrement PK)
  - `problemId` (FK to problems, unique)
  - `content` (text, the note markdown)
  - `updatedAt` (DateTime)
  - `createdAt` (DateTime)
- CREATE new DAO: `NoteDao`
  - `getNoteForProblem(int problemId)` → Note?
  - `saveNote(int problemId, String content)` → upsert
  - `deleteNote(int problemId)`
  - `getAllNotes()` → List<Note> (for notes browser)
  - `getNotesCount()` → int

#### E2b. Domain Layer
- CREATE entity: `Note` (id, problemId, content, updatedAt, createdAt)
- CREATE repository: `NoteRepository`
  - `getNote(int problemId)` → Either<Failure, Note?>
  - `saveNote(int problemId, String content)` → Either<Failure, Note>
  - `deleteNote(int problemId)` → Either<Failure, void>
- CREATE use cases: `GetNoteUseCase`, `SaveNoteUseCase`, `DeleteNoteUseCase`

#### E2c. Data Layer
- CREATE: `NoteRepositoryImpl`

#### E2d. Presentation
- CREATE: `NoteCubit` (simpler than BLoC — single problem context)
  - States: `NoteInitial`, `NoteLoaded(content)`, `NoteSaving`, `NoteSaved`
  - Methods: `loadNote(problemId)`, `saveNote(problemId, content)`, `deleteNote(problemId)`
- MODIFY: `SolvePage` — add notes tab/panel
  - Add a "Notes" tab below the problem description panel
  - Or: add a toggleable notes panel (icon button in toolbar)
  - Use a plain `TextField(maxLines: null)` with auto-save (debounced 2s)
- MODIFY: `ProblemListTile` — show small note icon if problem has a note

#### E2e. Files to Create/Modify
- CREATE: `lib/core/database/tables/notes_table.dart`
- CREATE: `lib/core/database/daos/note_dao.dart`
- MODIFY: `lib/core/database/app_database.dart` (add table + DAO)
- RUN: `dart run build_runner build --delete-conflicting-outputs`
- CREATE: `lib/features/editor/domain/entities/note.dart`
- CREATE: `lib/features/editor/domain/repositories/note_repository.dart`
- CREATE: `lib/features/editor/domain/usecases/get_note_usecase.dart`
- CREATE: `lib/features/editor/domain/usecases/save_note_usecase.dart`
- CREATE: `lib/features/editor/domain/usecases/delete_note_usecase.dart`
- CREATE: `lib/features/editor/data/repositories/note_repository_impl.dart`
- CREATE: `lib/features/editor/presentation/bloc/note_cubit.dart`
- CREATE: `lib/features/editor/presentation/widgets/notes_panel.dart`
- MODIFY: `lib/features/editor/presentation/pages/solve_page.dart`
- MODIFY: `lib/features/problems/presentation/widgets/problem_list_tile.dart`
- MODIFY: `lib/core/dependency_injection/injection_container.dart`

---

### E3. Code Templates

#### E3a. Concept
When opening a problem, auto-fill the editor with the correct code snippet for the selected language. This already works via `CodeSnippet` entities. **Code Templates** extends this with:
- User-defined boilerplate templates per language (e.g., custom imports, helper functions)
- Template prepended to code snippet when starting a new problem

#### E3b. Database
- CREATE table: `CodeTemplatesTable`
  - `id` (autoincrement PK)
  - `languageSlug` (text, unique)
  - `template` (text — the boilerplate code)
  - `updatedAt` (DateTime)

#### E3c. Presentation
- MODIFY: `SettingsPage` — add "Code Templates" section
  - List of languages with "Edit Template" button
  - Modal dialog with code editor for template editing
- MODIFY: `CodeEditorBloc` — prepend template when loading new problem
  - `CodeEditorLoadProblem` handler: if template exists for language, prepend to snippet

#### E3d. Files to Create/Modify
- CREATE: `lib/core/database/tables/code_templates_table.dart`
- MODIFY: `lib/core/database/app_database.dart` (add table)
- RUN: `dart run build_runner build --delete-conflicting-outputs`
- CREATE: `lib/features/settings/data/datasources/code_template_local_data_source.dart`
- CREATE: `lib/features/settings/domain/entities/code_template.dart`
- CREATE: `lib/features/settings/presentation/bloc/code_template_cubit.dart`
- CREATE: `lib/features/settings/presentation/widgets/code_template_editor_dialog.dart`
- MODIFY: `lib/features/settings/presentation/pages/settings_page.dart`
- MODIFY: `lib/features/editor/presentation/bloc/code_editor_bloc.dart`
- MODIFY: `lib/core/dependency_injection/injection_container.dart`

---

### E4. Solution Viewer

#### E4a. Concept
View official LeetCode solutions for problems (editorial + community solutions).
- Fetch via `officialSolution` GraphQL query (already defined in `graphql_queries.dart`)
- Display in a new tab on the solve page

#### E4b. Domain Layer
- CREATE entity: `Solution` (id, title, content as HTML, isPaidOnly)
- Add `getSolution(String titleSlug)` to `ProblemRepository`

#### E4c. Data Layer
- Add `getSolution(titleSlug)` to `ProblemRemoteDataSource`
  - Uses `GraphQLQueries.officialSolution` query
  - Parses `question.solution` response

#### E4d. Presentation
- MODIFY: `SolvePage` / `ProblemDescriptionPanel`
  - Add tab bar: "Description" | "Solution" | "Notes"
  - Solution tab shows HTML content via `flutter_widget_from_html`
  - Show lock icon + "Premium required" for paid-only solutions
  - Loading state while fetching

#### E4e. Files to Create/Modify
- CREATE: `lib/features/editor/domain/entities/solution.dart`
- MODIFY: `lib/features/problems/domain/repositories/problem_repository.dart`
- MODIFY: `lib/features/problems/data/repositories/problem_repository_impl.dart`
- MODIFY: `lib/features/problems/data/datasources/problem_remote_data_source.dart`
- CREATE: `lib/features/editor/presentation/bloc/solution_cubit.dart`
- MODIFY: `lib/features/editor/presentation/widgets/problem_description_panel.dart`
- MODIFY: `lib/features/editor/presentation/pages/solve_page.dart`
- MODIFY: `lib/core/dependency_injection/injection_container.dart`

---

### E5. Contest Calendar

#### E5a. Concept
View upcoming and past LeetCode contests in a calendar/list view.
- New sidebar item: "Contests" (between Submissions and Settings)
- Fetches via `allContests` GraphQL query (already defined)
- Shows upcoming contests with countdown timer
- Shows past contests with user's performance (if participated)

#### E5b. Domain Layer
- CREATE entity: `Contest`
  - `title` (String)
  - `titleSlug` (String)
  - `startTime` (DateTime)
  - `duration` (int, seconds)
  - `isVirtual` (bool)
  - `originStartTime` (DateTime)
- CREATE entity: `ContestList` — wraps List<Contest> with helpers
  - `upcoming` → List<Contest> (startTime > now)
  - `past` → List<Contest> (startTime < now)
  - `nextContest` → Contest?

#### E5c. Data Layer
- CREATE: `ContestRemoteDataSource`
  - `getContests()` → List<Contest>
  - Uses `GraphQLQueries.allContests` query
  - Parses `allContests` response array

#### E5d. Presentation
- CREATE: `ContestBloc`
  - Events: `ContestsLoaded`, `ContestsRefreshed`
  - States: `ContestState(status, contests, errorMessage)`
- CREATE: `ContestsPage` — new sidebar page
  - Top section: next upcoming contest with countdown timer
  - List of upcoming contests (cards with title, date, duration)
  - Expandable section: past contests
  - Each contest card shows: title, date/time, duration, "Open in Browser" button
- MODIFY: `MainShell` sidebar — add "Contests" item (index 4, before Settings)
- MODIFY: `AppRoutes` — add `/contests` route branch

#### E5e. Files to Create/Modify
- CREATE: `lib/features/contests/domain/entities/contest.dart`
- CREATE: `lib/features/contests/data/datasources/contest_remote_data_source.dart`
- CREATE: `lib/features/contests/presentation/bloc/contest_bloc.dart`
- CREATE: `lib/features/contests/presentation/bloc/contest_event.dart`
- CREATE: `lib/features/contests/presentation/bloc/contest_state.dart`
- CREATE: `lib/features/contests/presentation/pages/contests_page.dart`
- CREATE: `lib/features/contests/presentation/widgets/contest_card.dart`
- CREATE: `lib/features/contests/presentation/widgets/countdown_timer.dart`
- MODIFY: `lib/shared/widgets/main_shell.dart` (add Contests sidebar item)
- MODIFY: `lib/core/navigation/app_routes.dart` (add /contests branch)
- MODIFY: `lib/app.dart` (add ContestBloc provider)
- MODIFY: `lib/core/dependency_injection/injection_container.dart`

---

## Implementation Order

1. **Phase A** — Git init + first commit (~2 min)
2. **Phase B** — Push to GitHub (~1 min)
3. **Phase C** — CI/CD workflow (~5 min)
4. **Phase D** — Tests (~30 min)
   - D1a: SubmissionsBloc tests
   - D1b: ProblemRepositoryImpl tests
   - D1c: CodeExecutionRepositoryImpl tests
   - D1d: Missing use case tests
   - D1e: UserStats entity tests
   - D1f: Data source tests
   - D1g: Core utility tests
   - D2a: Shared widget tests
   - D2b: Feature widget tests
   - D3: Integration (page) tests
5. **Phase E** — Features (implement in order)
   - E1: Favorites (simplest, builds on existing schema)
   - E2: Problem Notes (new table + UI panel)
   - E3: Code Templates (new table + settings UI)
   - E4: Solution Viewer (API + new tab)
   - E5: Contest Calendar (new feature module + sidebar)

Each phase gets its own commit.
