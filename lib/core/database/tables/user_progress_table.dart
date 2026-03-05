import 'package:drift/drift.dart';

class UserProgressTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text()();
  IntColumn get easySolved => integer().withDefault(const Constant(0))();
  IntColumn get mediumSolved => integer().withDefault(const Constant(0))();
  IntColumn get hardSolved => integer().withDefault(const Constant(0))();
  IntColumn get totalSolved => integer().withDefault(const Constant(0))();
  IntColumn get easyTotal => integer().withDefault(const Constant(0))();
  IntColumn get mediumTotal => integer().withDefault(const Constant(0))();
  IntColumn get hardTotal => integer().withDefault(const Constant(0))();
  IntColumn get totalQuestions => integer().withDefault(const Constant(0))();
  IntColumn get ranking => integer().withDefault(const Constant(0))();
  IntColumn get reputation => integer().withDefault(const Constant(0))();
  IntColumn get streak => integer().withDefault(const Constant(0))();
  IntColumn get totalActiveDays =>
      integer().withDefault(const Constant(0))();
  TextColumn get submissionCalendar =>
      text().nullable()(); // JSON string from API
  DateTimeColumn get lastSynced =>
      dateTime().withDefault(currentDateAndTime)();
}
