import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/user_progress_table.dart';

part 'user_progress_dao.g.dart';

@DriftAccessor(tables: [UserProgressTable])
class UserProgressDao extends DatabaseAccessor<AppDatabase>
    with _$UserProgressDaoMixin {
  UserProgressDao(super.db);

  // Get user progress
  Future<UserProgressTableData?> getUserProgress(String username) {
    return (select(
      userProgressTable,
    )..where((u) => u.username.equals(username))).getSingleOrNull();
  }

  // Upsert user progress
  Future<void> upsertUserProgress(UserProgressTableCompanion progress) {
    return into(userProgressTable).insertOnConflictUpdate(progress);
  }

  // Watch user progress
  Stream<UserProgressTableData?> watchUserProgress(String username) {
    return (select(
      userProgressTable,
    )..where((u) => u.username.equals(username))).watchSingleOrNull();
  }

  // Delete user progress
  Future<void> deleteUserProgress(String username) {
    return (delete(
      userProgressTable,
    )..where((u) => u.username.equals(username))).go();
  }
}
