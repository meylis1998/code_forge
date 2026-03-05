import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/problem_topic_tags_table.dart';
import '../tables/topic_tags_table.dart';

part 'topic_tag_dao.g.dart';

@DriftAccessor(tables: [TopicTagsTable, ProblemTopicTagsTable])
class TopicTagDao extends DatabaseAccessor<AppDatabase>
    with _$TopicTagDaoMixin {
  TopicTagDao(super.db);

  // Get all tags
  Future<List<TopicTagsTableData>> getAllTags() {
    return (select(topicTagsTable)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
  }

  // Upsert a tag
  Future<void> upsertTag(TopicTagsTableCompanion tag) {
    return into(topicTagsTable).insertOnConflictUpdate(tag);
  }

  // Batch upsert tags
  Future<void> upsertTags(List<TopicTagsTableCompanion> tags) {
    return batch((b) {
      b.insertAllOnConflictUpdate(topicTagsTable, tags);
    });
  }

  // Link problem to tag
  Future<void> linkProblemTag(int problemId, String tagId) {
    return into(problemTopicTagsTable).insertOnConflictUpdate(
      ProblemTopicTagsTableCompanion(
        problemId: Value(problemId),
        tagId: Value(tagId),
      ),
    );
  }

  // Batch link problem to tags
  Future<void> linkProblemTags(
    int problemId,
    List<String> tagIds,
  ) {
    return batch((b) {
      b.insertAllOnConflictUpdate(
        problemTopicTagsTable,
        tagIds
            .map(
              (tagId) => ProblemTopicTagsTableCompanion(
                problemId: Value(problemId),
                tagId: Value(tagId),
              ),
            )
            .toList(),
      );
    });
  }

  // Clear problem tags
  Future<void> clearProblemTags(int problemId) {
    return (delete(problemTopicTagsTable)
          ..where((t) => t.problemId.equals(problemId)))
        .go();
  }

  // Get tags with problem counts
  Future<List<TagWithCount>> getTagsWithCounts() async {
    final countExp = problemTopicTagsTable.problemId.count();
    final query = select(topicTagsTable).join([
      leftOuterJoin(
        problemTopicTagsTable,
        problemTopicTagsTable.tagId.equalsExp(topicTagsTable.id),
      ),
    ])
      ..addColumns([countExp])
      ..groupBy([topicTagsTable.id])
      ..orderBy([OrderingTerm.desc(countExp)]);

    final results = await query.get();
    return results.map((row) {
      return TagWithCount(
        tag: row.readTable(topicTagsTable),
        count: row.read(countExp) ?? 0,
      );
    }).toList();
  }
}

class TagWithCount {
  const TagWithCount({required this.tag, required this.count});

  final TopicTagsTableData tag;
  final int count;
}
