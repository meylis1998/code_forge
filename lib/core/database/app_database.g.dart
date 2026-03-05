// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProblemsTableTable extends ProblemsTable
    with TableInfo<$ProblemsTableTable, ProblemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frontendIdMeta = const VerificationMeta(
    'frontendId',
  );
  @override
  late final GeneratedColumn<String> frontendId = GeneratedColumn<String>(
    'frontend_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleSlugMeta = const VerificationMeta(
    'titleSlug',
  );
  @override
  late final GeneratedColumn<String> titleSlug = GeneratedColumn<String>(
    'title_slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acRateMeta = const VerificationMeta('acRate');
  @override
  late final GeneratedColumn<double> acRate = GeneratedColumn<double>(
    'ac_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPaidOnlyMeta = const VerificationMeta(
    'isPaidOnly',
  );
  @override
  late final GeneratedColumn<bool> isPaidOnly = GeneratedColumn<bool>(
    'is_paid_only',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_paid_only" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int> likes = GeneratedColumn<int>(
    'likes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dislikesMeta = const VerificationMeta(
    'dislikes',
  );
  @override
  late final GeneratedColumn<int> dislikes = GeneratedColumn<int>(
    'dislikes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _categoryTitleMeta = const VerificationMeta(
    'categoryTitle',
  );
  @override
  late final GeneratedColumn<String> categoryTitle = GeneratedColumn<String>(
    'category_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _hintsMeta = const VerificationMeta('hints');
  @override
  late final GeneratedColumn<String> hints = GeneratedColumn<String>(
    'hints',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _similarQuestionsMeta = const VerificationMeta(
    'similarQuestions',
  );
  @override
  late final GeneratedColumn<String> similarQuestions = GeneratedColumn<String>(
    'similar_questions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exampleTestcasesMeta = const VerificationMeta(
    'exampleTestcases',
  );
  @override
  late final GeneratedColumn<String> exampleTestcases = GeneratedColumn<String>(
    'example_testcases',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sampleTestCaseMeta = const VerificationMeta(
    'sampleTestCase',
  );
  @override
  late final GeneratedColumn<String> sampleTestCase = GeneratedColumn<String>(
    'sample_test_case',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statsMeta = const VerificationMeta('stats');
  @override
  late final GeneratedColumn<String> stats = GeneratedColumn<String>(
    'stats',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastSyncedMeta = const VerificationMeta(
    'lastSynced',
  );
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
    'last_synced',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    frontendId,
    title,
    titleSlug,
    content,
    difficulty,
    acRate,
    isPaidOnly,
    status,
    likes,
    dislikes,
    categoryTitle,
    hints,
    similarQuestions,
    exampleTestcases,
    sampleTestCase,
    stats,
    isFavorite,
    lastSynced,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problems_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProblemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('frontend_id')) {
      context.handle(
        _frontendIdMeta,
        frontendId.isAcceptableOrUnknown(data['frontend_id']!, _frontendIdMeta),
      );
    } else if (isInserting) {
      context.missing(_frontendIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_slug')) {
      context.handle(
        _titleSlugMeta,
        titleSlug.isAcceptableOrUnknown(data['title_slug']!, _titleSlugMeta),
      );
    } else if (isInserting) {
      context.missing(_titleSlugMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('ac_rate')) {
      context.handle(
        _acRateMeta,
        acRate.isAcceptableOrUnknown(data['ac_rate']!, _acRateMeta),
      );
    }
    if (data.containsKey('is_paid_only')) {
      context.handle(
        _isPaidOnlyMeta,
        isPaidOnly.isAcceptableOrUnknown(
          data['is_paid_only']!,
          _isPaidOnlyMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('likes')) {
      context.handle(
        _likesMeta,
        likes.isAcceptableOrUnknown(data['likes']!, _likesMeta),
      );
    }
    if (data.containsKey('dislikes')) {
      context.handle(
        _dislikesMeta,
        dislikes.isAcceptableOrUnknown(data['dislikes']!, _dislikesMeta),
      );
    }
    if (data.containsKey('category_title')) {
      context.handle(
        _categoryTitleMeta,
        categoryTitle.isAcceptableOrUnknown(
          data['category_title']!,
          _categoryTitleMeta,
        ),
      );
    }
    if (data.containsKey('hints')) {
      context.handle(
        _hintsMeta,
        hints.isAcceptableOrUnknown(data['hints']!, _hintsMeta),
      );
    }
    if (data.containsKey('similar_questions')) {
      context.handle(
        _similarQuestionsMeta,
        similarQuestions.isAcceptableOrUnknown(
          data['similar_questions']!,
          _similarQuestionsMeta,
        ),
      );
    }
    if (data.containsKey('example_testcases')) {
      context.handle(
        _exampleTestcasesMeta,
        exampleTestcases.isAcceptableOrUnknown(
          data['example_testcases']!,
          _exampleTestcasesMeta,
        ),
      );
    }
    if (data.containsKey('sample_test_case')) {
      context.handle(
        _sampleTestCaseMeta,
        sampleTestCase.isAcceptableOrUnknown(
          data['sample_test_case']!,
          _sampleTestCaseMeta,
        ),
      );
    }
    if (data.containsKey('stats')) {
      context.handle(
        _statsMeta,
        stats.isAcceptableOrUnknown(data['stats']!, _statsMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('last_synced')) {
      context.handle(
        _lastSyncedMeta,
        lastSynced.isAcceptableOrUnknown(data['last_synced']!, _lastSyncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProblemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProblemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      frontendId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frontend_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      titleSlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_slug'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      acRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ac_rate'],
      )!,
      isPaidOnly: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_paid_only'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      likes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}likes'],
      )!,
      dislikes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dislikes'],
      )!,
      categoryTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_title'],
      )!,
      hints: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hints'],
      ),
      similarQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}similar_questions'],
      ),
      exampleTestcases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}example_testcases'],
      ),
      sampleTestCase: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sample_test_case'],
      ),
      stats: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stats'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      lastSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProblemsTableTable createAlias(String alias) {
    return $ProblemsTableTable(attachedDatabase, alias);
  }
}

class ProblemsTableData extends DataClass
    implements Insertable<ProblemsTableData> {
  final int id;
  final String frontendId;
  final String title;
  final String titleSlug;
  final String? content;
  final String difficulty;
  final double acRate;
  final bool isPaidOnly;
  final String? status;
  final int likes;
  final int dislikes;
  final String categoryTitle;
  final String? hints;
  final String? similarQuestions;
  final String? exampleTestcases;
  final String? sampleTestCase;
  final String? stats;
  final bool isFavorite;
  final DateTime? lastSynced;
  final DateTime createdAt;
  const ProblemsTableData({
    required this.id,
    required this.frontendId,
    required this.title,
    required this.titleSlug,
    this.content,
    required this.difficulty,
    required this.acRate,
    required this.isPaidOnly,
    this.status,
    required this.likes,
    required this.dislikes,
    required this.categoryTitle,
    this.hints,
    this.similarQuestions,
    this.exampleTestcases,
    this.sampleTestCase,
    this.stats,
    required this.isFavorite,
    this.lastSynced,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['frontend_id'] = Variable<String>(frontendId);
    map['title'] = Variable<String>(title);
    map['title_slug'] = Variable<String>(titleSlug);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['difficulty'] = Variable<String>(difficulty);
    map['ac_rate'] = Variable<double>(acRate);
    map['is_paid_only'] = Variable<bool>(isPaidOnly);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['likes'] = Variable<int>(likes);
    map['dislikes'] = Variable<int>(dislikes);
    map['category_title'] = Variable<String>(categoryTitle);
    if (!nullToAbsent || hints != null) {
      map['hints'] = Variable<String>(hints);
    }
    if (!nullToAbsent || similarQuestions != null) {
      map['similar_questions'] = Variable<String>(similarQuestions);
    }
    if (!nullToAbsent || exampleTestcases != null) {
      map['example_testcases'] = Variable<String>(exampleTestcases);
    }
    if (!nullToAbsent || sampleTestCase != null) {
      map['sample_test_case'] = Variable<String>(sampleTestCase);
    }
    if (!nullToAbsent || stats != null) {
      map['stats'] = Variable<String>(stats);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || lastSynced != null) {
      map['last_synced'] = Variable<DateTime>(lastSynced);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProblemsTableCompanion toCompanion(bool nullToAbsent) {
    return ProblemsTableCompanion(
      id: Value(id),
      frontendId: Value(frontendId),
      title: Value(title),
      titleSlug: Value(titleSlug),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      difficulty: Value(difficulty),
      acRate: Value(acRate),
      isPaidOnly: Value(isPaidOnly),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      likes: Value(likes),
      dislikes: Value(dislikes),
      categoryTitle: Value(categoryTitle),
      hints: hints == null && nullToAbsent
          ? const Value.absent()
          : Value(hints),
      similarQuestions: similarQuestions == null && nullToAbsent
          ? const Value.absent()
          : Value(similarQuestions),
      exampleTestcases: exampleTestcases == null && nullToAbsent
          ? const Value.absent()
          : Value(exampleTestcases),
      sampleTestCase: sampleTestCase == null && nullToAbsent
          ? const Value.absent()
          : Value(sampleTestCase),
      stats: stats == null && nullToAbsent
          ? const Value.absent()
          : Value(stats),
      isFavorite: Value(isFavorite),
      lastSynced: lastSynced == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynced),
      createdAt: Value(createdAt),
    );
  }

  factory ProblemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProblemsTableData(
      id: serializer.fromJson<int>(json['id']),
      frontendId: serializer.fromJson<String>(json['frontendId']),
      title: serializer.fromJson<String>(json['title']),
      titleSlug: serializer.fromJson<String>(json['titleSlug']),
      content: serializer.fromJson<String?>(json['content']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      acRate: serializer.fromJson<double>(json['acRate']),
      isPaidOnly: serializer.fromJson<bool>(json['isPaidOnly']),
      status: serializer.fromJson<String?>(json['status']),
      likes: serializer.fromJson<int>(json['likes']),
      dislikes: serializer.fromJson<int>(json['dislikes']),
      categoryTitle: serializer.fromJson<String>(json['categoryTitle']),
      hints: serializer.fromJson<String?>(json['hints']),
      similarQuestions: serializer.fromJson<String?>(json['similarQuestions']),
      exampleTestcases: serializer.fromJson<String?>(json['exampleTestcases']),
      sampleTestCase: serializer.fromJson<String?>(json['sampleTestCase']),
      stats: serializer.fromJson<String?>(json['stats']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      lastSynced: serializer.fromJson<DateTime?>(json['lastSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'frontendId': serializer.toJson<String>(frontendId),
      'title': serializer.toJson<String>(title),
      'titleSlug': serializer.toJson<String>(titleSlug),
      'content': serializer.toJson<String?>(content),
      'difficulty': serializer.toJson<String>(difficulty),
      'acRate': serializer.toJson<double>(acRate),
      'isPaidOnly': serializer.toJson<bool>(isPaidOnly),
      'status': serializer.toJson<String?>(status),
      'likes': serializer.toJson<int>(likes),
      'dislikes': serializer.toJson<int>(dislikes),
      'categoryTitle': serializer.toJson<String>(categoryTitle),
      'hints': serializer.toJson<String?>(hints),
      'similarQuestions': serializer.toJson<String?>(similarQuestions),
      'exampleTestcases': serializer.toJson<String?>(exampleTestcases),
      'sampleTestCase': serializer.toJson<String?>(sampleTestCase),
      'stats': serializer.toJson<String?>(stats),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'lastSynced': serializer.toJson<DateTime?>(lastSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProblemsTableData copyWith({
    int? id,
    String? frontendId,
    String? title,
    String? titleSlug,
    Value<String?> content = const Value.absent(),
    String? difficulty,
    double? acRate,
    bool? isPaidOnly,
    Value<String?> status = const Value.absent(),
    int? likes,
    int? dislikes,
    String? categoryTitle,
    Value<String?> hints = const Value.absent(),
    Value<String?> similarQuestions = const Value.absent(),
    Value<String?> exampleTestcases = const Value.absent(),
    Value<String?> sampleTestCase = const Value.absent(),
    Value<String?> stats = const Value.absent(),
    bool? isFavorite,
    Value<DateTime?> lastSynced = const Value.absent(),
    DateTime? createdAt,
  }) => ProblemsTableData(
    id: id ?? this.id,
    frontendId: frontendId ?? this.frontendId,
    title: title ?? this.title,
    titleSlug: titleSlug ?? this.titleSlug,
    content: content.present ? content.value : this.content,
    difficulty: difficulty ?? this.difficulty,
    acRate: acRate ?? this.acRate,
    isPaidOnly: isPaidOnly ?? this.isPaidOnly,
    status: status.present ? status.value : this.status,
    likes: likes ?? this.likes,
    dislikes: dislikes ?? this.dislikes,
    categoryTitle: categoryTitle ?? this.categoryTitle,
    hints: hints.present ? hints.value : this.hints,
    similarQuestions: similarQuestions.present
        ? similarQuestions.value
        : this.similarQuestions,
    exampleTestcases: exampleTestcases.present
        ? exampleTestcases.value
        : this.exampleTestcases,
    sampleTestCase: sampleTestCase.present
        ? sampleTestCase.value
        : this.sampleTestCase,
    stats: stats.present ? stats.value : this.stats,
    isFavorite: isFavorite ?? this.isFavorite,
    lastSynced: lastSynced.present ? lastSynced.value : this.lastSynced,
    createdAt: createdAt ?? this.createdAt,
  );
  ProblemsTableData copyWithCompanion(ProblemsTableCompanion data) {
    return ProblemsTableData(
      id: data.id.present ? data.id.value : this.id,
      frontendId: data.frontendId.present
          ? data.frontendId.value
          : this.frontendId,
      title: data.title.present ? data.title.value : this.title,
      titleSlug: data.titleSlug.present ? data.titleSlug.value : this.titleSlug,
      content: data.content.present ? data.content.value : this.content,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      acRate: data.acRate.present ? data.acRate.value : this.acRate,
      isPaidOnly: data.isPaidOnly.present
          ? data.isPaidOnly.value
          : this.isPaidOnly,
      status: data.status.present ? data.status.value : this.status,
      likes: data.likes.present ? data.likes.value : this.likes,
      dislikes: data.dislikes.present ? data.dislikes.value : this.dislikes,
      categoryTitle: data.categoryTitle.present
          ? data.categoryTitle.value
          : this.categoryTitle,
      hints: data.hints.present ? data.hints.value : this.hints,
      similarQuestions: data.similarQuestions.present
          ? data.similarQuestions.value
          : this.similarQuestions,
      exampleTestcases: data.exampleTestcases.present
          ? data.exampleTestcases.value
          : this.exampleTestcases,
      sampleTestCase: data.sampleTestCase.present
          ? data.sampleTestCase.value
          : this.sampleTestCase,
      stats: data.stats.present ? data.stats.value : this.stats,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      lastSynced: data.lastSynced.present
          ? data.lastSynced.value
          : this.lastSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProblemsTableData(')
          ..write('id: $id, ')
          ..write('frontendId: $frontendId, ')
          ..write('title: $title, ')
          ..write('titleSlug: $titleSlug, ')
          ..write('content: $content, ')
          ..write('difficulty: $difficulty, ')
          ..write('acRate: $acRate, ')
          ..write('isPaidOnly: $isPaidOnly, ')
          ..write('status: $status, ')
          ..write('likes: $likes, ')
          ..write('dislikes: $dislikes, ')
          ..write('categoryTitle: $categoryTitle, ')
          ..write('hints: $hints, ')
          ..write('similarQuestions: $similarQuestions, ')
          ..write('exampleTestcases: $exampleTestcases, ')
          ..write('sampleTestCase: $sampleTestCase, ')
          ..write('stats: $stats, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('lastSynced: $lastSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    frontendId,
    title,
    titleSlug,
    content,
    difficulty,
    acRate,
    isPaidOnly,
    status,
    likes,
    dislikes,
    categoryTitle,
    hints,
    similarQuestions,
    exampleTestcases,
    sampleTestCase,
    stats,
    isFavorite,
    lastSynced,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProblemsTableData &&
          other.id == this.id &&
          other.frontendId == this.frontendId &&
          other.title == this.title &&
          other.titleSlug == this.titleSlug &&
          other.content == this.content &&
          other.difficulty == this.difficulty &&
          other.acRate == this.acRate &&
          other.isPaidOnly == this.isPaidOnly &&
          other.status == this.status &&
          other.likes == this.likes &&
          other.dislikes == this.dislikes &&
          other.categoryTitle == this.categoryTitle &&
          other.hints == this.hints &&
          other.similarQuestions == this.similarQuestions &&
          other.exampleTestcases == this.exampleTestcases &&
          other.sampleTestCase == this.sampleTestCase &&
          other.stats == this.stats &&
          other.isFavorite == this.isFavorite &&
          other.lastSynced == this.lastSynced &&
          other.createdAt == this.createdAt);
}

class ProblemsTableCompanion extends UpdateCompanion<ProblemsTableData> {
  final Value<int> id;
  final Value<String> frontendId;
  final Value<String> title;
  final Value<String> titleSlug;
  final Value<String?> content;
  final Value<String> difficulty;
  final Value<double> acRate;
  final Value<bool> isPaidOnly;
  final Value<String?> status;
  final Value<int> likes;
  final Value<int> dislikes;
  final Value<String> categoryTitle;
  final Value<String?> hints;
  final Value<String?> similarQuestions;
  final Value<String?> exampleTestcases;
  final Value<String?> sampleTestCase;
  final Value<String?> stats;
  final Value<bool> isFavorite;
  final Value<DateTime?> lastSynced;
  final Value<DateTime> createdAt;
  const ProblemsTableCompanion({
    this.id = const Value.absent(),
    this.frontendId = const Value.absent(),
    this.title = const Value.absent(),
    this.titleSlug = const Value.absent(),
    this.content = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.acRate = const Value.absent(),
    this.isPaidOnly = const Value.absent(),
    this.status = const Value.absent(),
    this.likes = const Value.absent(),
    this.dislikes = const Value.absent(),
    this.categoryTitle = const Value.absent(),
    this.hints = const Value.absent(),
    this.similarQuestions = const Value.absent(),
    this.exampleTestcases = const Value.absent(),
    this.sampleTestCase = const Value.absent(),
    this.stats = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProblemsTableCompanion.insert({
    this.id = const Value.absent(),
    required String frontendId,
    required String title,
    required String titleSlug,
    this.content = const Value.absent(),
    required String difficulty,
    this.acRate = const Value.absent(),
    this.isPaidOnly = const Value.absent(),
    this.status = const Value.absent(),
    this.likes = const Value.absent(),
    this.dislikes = const Value.absent(),
    this.categoryTitle = const Value.absent(),
    this.hints = const Value.absent(),
    this.similarQuestions = const Value.absent(),
    this.exampleTestcases = const Value.absent(),
    this.sampleTestCase = const Value.absent(),
    this.stats = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : frontendId = Value(frontendId),
       title = Value(title),
       titleSlug = Value(titleSlug),
       difficulty = Value(difficulty);
  static Insertable<ProblemsTableData> custom({
    Expression<int>? id,
    Expression<String>? frontendId,
    Expression<String>? title,
    Expression<String>? titleSlug,
    Expression<String>? content,
    Expression<String>? difficulty,
    Expression<double>? acRate,
    Expression<bool>? isPaidOnly,
    Expression<String>? status,
    Expression<int>? likes,
    Expression<int>? dislikes,
    Expression<String>? categoryTitle,
    Expression<String>? hints,
    Expression<String>? similarQuestions,
    Expression<String>? exampleTestcases,
    Expression<String>? sampleTestCase,
    Expression<String>? stats,
    Expression<bool>? isFavorite,
    Expression<DateTime>? lastSynced,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (frontendId != null) 'frontend_id': frontendId,
      if (title != null) 'title': title,
      if (titleSlug != null) 'title_slug': titleSlug,
      if (content != null) 'content': content,
      if (difficulty != null) 'difficulty': difficulty,
      if (acRate != null) 'ac_rate': acRate,
      if (isPaidOnly != null) 'is_paid_only': isPaidOnly,
      if (status != null) 'status': status,
      if (likes != null) 'likes': likes,
      if (dislikes != null) 'dislikes': dislikes,
      if (categoryTitle != null) 'category_title': categoryTitle,
      if (hints != null) 'hints': hints,
      if (similarQuestions != null) 'similar_questions': similarQuestions,
      if (exampleTestcases != null) 'example_testcases': exampleTestcases,
      if (sampleTestCase != null) 'sample_test_case': sampleTestCase,
      if (stats != null) 'stats': stats,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (lastSynced != null) 'last_synced': lastSynced,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProblemsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? frontendId,
    Value<String>? title,
    Value<String>? titleSlug,
    Value<String?>? content,
    Value<String>? difficulty,
    Value<double>? acRate,
    Value<bool>? isPaidOnly,
    Value<String?>? status,
    Value<int>? likes,
    Value<int>? dislikes,
    Value<String>? categoryTitle,
    Value<String?>? hints,
    Value<String?>? similarQuestions,
    Value<String?>? exampleTestcases,
    Value<String?>? sampleTestCase,
    Value<String?>? stats,
    Value<bool>? isFavorite,
    Value<DateTime?>? lastSynced,
    Value<DateTime>? createdAt,
  }) {
    return ProblemsTableCompanion(
      id: id ?? this.id,
      frontendId: frontendId ?? this.frontendId,
      title: title ?? this.title,
      titleSlug: titleSlug ?? this.titleSlug,
      content: content ?? this.content,
      difficulty: difficulty ?? this.difficulty,
      acRate: acRate ?? this.acRate,
      isPaidOnly: isPaidOnly ?? this.isPaidOnly,
      status: status ?? this.status,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      hints: hints ?? this.hints,
      similarQuestions: similarQuestions ?? this.similarQuestions,
      exampleTestcases: exampleTestcases ?? this.exampleTestcases,
      sampleTestCase: sampleTestCase ?? this.sampleTestCase,
      stats: stats ?? this.stats,
      isFavorite: isFavorite ?? this.isFavorite,
      lastSynced: lastSynced ?? this.lastSynced,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (frontendId.present) {
      map['frontend_id'] = Variable<String>(frontendId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleSlug.present) {
      map['title_slug'] = Variable<String>(titleSlug.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (acRate.present) {
      map['ac_rate'] = Variable<double>(acRate.value);
    }
    if (isPaidOnly.present) {
      map['is_paid_only'] = Variable<bool>(isPaidOnly.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (dislikes.present) {
      map['dislikes'] = Variable<int>(dislikes.value);
    }
    if (categoryTitle.present) {
      map['category_title'] = Variable<String>(categoryTitle.value);
    }
    if (hints.present) {
      map['hints'] = Variable<String>(hints.value);
    }
    if (similarQuestions.present) {
      map['similar_questions'] = Variable<String>(similarQuestions.value);
    }
    if (exampleTestcases.present) {
      map['example_testcases'] = Variable<String>(exampleTestcases.value);
    }
    if (sampleTestCase.present) {
      map['sample_test_case'] = Variable<String>(sampleTestCase.value);
    }
    if (stats.present) {
      map['stats'] = Variable<String>(stats.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemsTableCompanion(')
          ..write('id: $id, ')
          ..write('frontendId: $frontendId, ')
          ..write('title: $title, ')
          ..write('titleSlug: $titleSlug, ')
          ..write('content: $content, ')
          ..write('difficulty: $difficulty, ')
          ..write('acRate: $acRate, ')
          ..write('isPaidOnly: $isPaidOnly, ')
          ..write('status: $status, ')
          ..write('likes: $likes, ')
          ..write('dislikes: $dislikes, ')
          ..write('categoryTitle: $categoryTitle, ')
          ..write('hints: $hints, ')
          ..write('similarQuestions: $similarQuestions, ')
          ..write('exampleTestcases: $exampleTestcases, ')
          ..write('sampleTestCase: $sampleTestCase, ')
          ..write('stats: $stats, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('lastSynced: $lastSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TopicTagsTableTable extends TopicTagsTable
    with TableInfo<$TopicTagsTableTable, TopicTagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicTagsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, slug];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topic_tags_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TopicTagsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TopicTagsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicTagsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
    );
  }

  @override
  $TopicTagsTableTable createAlias(String alias) {
    return $TopicTagsTableTable(attachedDatabase, alias);
  }
}

class TopicTagsTableData extends DataClass
    implements Insertable<TopicTagsTableData> {
  final String id;
  final String name;
  final String slug;
  const TopicTagsTableData({
    required this.id,
    required this.name,
    required this.slug,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['slug'] = Variable<String>(slug);
    return map;
  }

  TopicTagsTableCompanion toCompanion(bool nullToAbsent) {
    return TopicTagsTableCompanion(
      id: Value(id),
      name: Value(name),
      slug: Value(slug),
    );
  }

  factory TopicTagsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicTagsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      slug: serializer.fromJson<String>(json['slug']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'slug': serializer.toJson<String>(slug),
    };
  }

  TopicTagsTableData copyWith({String? id, String? name, String? slug}) =>
      TopicTagsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );
  TopicTagsTableData copyWithCompanion(TopicTagsTableCompanion data) {
    return TopicTagsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      slug: data.slug.present ? data.slug.value : this.slug,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicTagsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, slug);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicTagsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.slug == this.slug);
}

class TopicTagsTableCompanion extends UpdateCompanion<TopicTagsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> slug;
  final Value<int> rowid;
  const TopicTagsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.slug = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicTagsTableCompanion.insert({
    required String id,
    required String name,
    required String slug,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       slug = Value(slug);
  static Insertable<TopicTagsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? slug,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicTagsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? slug,
    Value<int>? rowid,
  }) {
    return TopicTagsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicTagsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProblemTopicTagsTableTable extends ProblemTopicTagsTable
    with TableInfo<$ProblemTopicTagsTableTable, ProblemTopicTagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemTopicTagsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<int> problemId = GeneratedColumn<int>(
    'problem_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES problems_table (id)',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topic_tags_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [problemId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problem_topic_tags_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProblemTopicTagsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('problem_id')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['problem_id']!, _problemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_problemIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {problemId, tagId};
  @override
  ProblemTopicTagsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProblemTopicTagsTableData(
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}problem_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $ProblemTopicTagsTableTable createAlias(String alias) {
    return $ProblemTopicTagsTableTable(attachedDatabase, alias);
  }
}

class ProblemTopicTagsTableData extends DataClass
    implements Insertable<ProblemTopicTagsTableData> {
  final int problemId;
  final String tagId;
  const ProblemTopicTagsTableData({
    required this.problemId,
    required this.tagId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['problem_id'] = Variable<int>(problemId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  ProblemTopicTagsTableCompanion toCompanion(bool nullToAbsent) {
    return ProblemTopicTagsTableCompanion(
      problemId: Value(problemId),
      tagId: Value(tagId),
    );
  }

  factory ProblemTopicTagsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProblemTopicTagsTableData(
      problemId: serializer.fromJson<int>(json['problemId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'problemId': serializer.toJson<int>(problemId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  ProblemTopicTagsTableData copyWith({int? problemId, String? tagId}) =>
      ProblemTopicTagsTableData(
        problemId: problemId ?? this.problemId,
        tagId: tagId ?? this.tagId,
      );
  ProblemTopicTagsTableData copyWithCompanion(
    ProblemTopicTagsTableCompanion data,
  ) {
    return ProblemTopicTagsTableData(
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProblemTopicTagsTableData(')
          ..write('problemId: $problemId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(problemId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProblemTopicTagsTableData &&
          other.problemId == this.problemId &&
          other.tagId == this.tagId);
}

class ProblemTopicTagsTableCompanion
    extends UpdateCompanion<ProblemTopicTagsTableData> {
  final Value<int> problemId;
  final Value<String> tagId;
  final Value<int> rowid;
  const ProblemTopicTagsTableCompanion({
    this.problemId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProblemTopicTagsTableCompanion.insert({
    required int problemId,
    required String tagId,
    this.rowid = const Value.absent(),
  }) : problemId = Value(problemId),
       tagId = Value(tagId);
  static Insertable<ProblemTopicTagsTableData> custom({
    Expression<int>? problemId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (problemId != null) 'problem_id': problemId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProblemTopicTagsTableCompanion copyWith({
    Value<int>? problemId,
    Value<String>? tagId,
    Value<int>? rowid,
  }) {
    return ProblemTopicTagsTableCompanion(
      problemId: problemId ?? this.problemId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (problemId.present) {
      map['problem_id'] = Variable<int>(problemId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemTopicTagsTableCompanion(')
          ..write('problemId: $problemId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CodeSnippetsTableTable extends CodeSnippetsTable
    with TableInfo<$CodeSnippetsTableTable, CodeSnippetsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CodeSnippetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<int> problemId = GeneratedColumn<int>(
    'problem_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES problems_table (id)',
    ),
  );
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  @override
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
    'lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _langSlugMeta = const VerificationMeta(
    'langSlug',
  );
  @override
  late final GeneratedColumn<String> langSlug = GeneratedColumn<String>(
    'lang_slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, problemId, lang, langSlug, code];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'code_snippets_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CodeSnippetsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('problem_id')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['problem_id']!, _problemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_problemIdMeta);
    }
    if (data.containsKey('lang')) {
      context.handle(
        _langMeta,
        lang.isAcceptableOrUnknown(data['lang']!, _langMeta),
      );
    } else if (isInserting) {
      context.missing(_langMeta);
    }
    if (data.containsKey('lang_slug')) {
      context.handle(
        _langSlugMeta,
        langSlug.isAcceptableOrUnknown(data['lang_slug']!, _langSlugMeta),
      );
    } else if (isInserting) {
      context.missing(_langSlugMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {problemId, langSlug},
  ];
  @override
  CodeSnippetsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CodeSnippetsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}problem_id'],
      )!,
      lang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lang'],
      )!,
      langSlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lang_slug'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
    );
  }

  @override
  $CodeSnippetsTableTable createAlias(String alias) {
    return $CodeSnippetsTableTable(attachedDatabase, alias);
  }
}

class CodeSnippetsTableData extends DataClass
    implements Insertable<CodeSnippetsTableData> {
  final int id;
  final int problemId;
  final String lang;
  final String langSlug;
  final String code;
  const CodeSnippetsTableData({
    required this.id,
    required this.problemId,
    required this.lang,
    required this.langSlug,
    required this.code,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['problem_id'] = Variable<int>(problemId);
    map['lang'] = Variable<String>(lang);
    map['lang_slug'] = Variable<String>(langSlug);
    map['code'] = Variable<String>(code);
    return map;
  }

  CodeSnippetsTableCompanion toCompanion(bool nullToAbsent) {
    return CodeSnippetsTableCompanion(
      id: Value(id),
      problemId: Value(problemId),
      lang: Value(lang),
      langSlug: Value(langSlug),
      code: Value(code),
    );
  }

  factory CodeSnippetsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CodeSnippetsTableData(
      id: serializer.fromJson<int>(json['id']),
      problemId: serializer.fromJson<int>(json['problemId']),
      lang: serializer.fromJson<String>(json['lang']),
      langSlug: serializer.fromJson<String>(json['langSlug']),
      code: serializer.fromJson<String>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'problemId': serializer.toJson<int>(problemId),
      'lang': serializer.toJson<String>(lang),
      'langSlug': serializer.toJson<String>(langSlug),
      'code': serializer.toJson<String>(code),
    };
  }

  CodeSnippetsTableData copyWith({
    int? id,
    int? problemId,
    String? lang,
    String? langSlug,
    String? code,
  }) => CodeSnippetsTableData(
    id: id ?? this.id,
    problemId: problemId ?? this.problemId,
    lang: lang ?? this.lang,
    langSlug: langSlug ?? this.langSlug,
    code: code ?? this.code,
  );
  CodeSnippetsTableData copyWithCompanion(CodeSnippetsTableCompanion data) {
    return CodeSnippetsTableData(
      id: data.id.present ? data.id.value : this.id,
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      lang: data.lang.present ? data.lang.value : this.lang,
      langSlug: data.langSlug.present ? data.langSlug.value : this.langSlug,
      code: data.code.present ? data.code.value : this.code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CodeSnippetsTableData(')
          ..write('id: $id, ')
          ..write('problemId: $problemId, ')
          ..write('lang: $lang, ')
          ..write('langSlug: $langSlug, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, problemId, lang, langSlug, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CodeSnippetsTableData &&
          other.id == this.id &&
          other.problemId == this.problemId &&
          other.lang == this.lang &&
          other.langSlug == this.langSlug &&
          other.code == this.code);
}

class CodeSnippetsTableCompanion
    extends UpdateCompanion<CodeSnippetsTableData> {
  final Value<int> id;
  final Value<int> problemId;
  final Value<String> lang;
  final Value<String> langSlug;
  final Value<String> code;
  const CodeSnippetsTableCompanion({
    this.id = const Value.absent(),
    this.problemId = const Value.absent(),
    this.lang = const Value.absent(),
    this.langSlug = const Value.absent(),
    this.code = const Value.absent(),
  });
  CodeSnippetsTableCompanion.insert({
    this.id = const Value.absent(),
    required int problemId,
    required String lang,
    required String langSlug,
    required String code,
  }) : problemId = Value(problemId),
       lang = Value(lang),
       langSlug = Value(langSlug),
       code = Value(code);
  static Insertable<CodeSnippetsTableData> custom({
    Expression<int>? id,
    Expression<int>? problemId,
    Expression<String>? lang,
    Expression<String>? langSlug,
    Expression<String>? code,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (problemId != null) 'problem_id': problemId,
      if (lang != null) 'lang': lang,
      if (langSlug != null) 'lang_slug': langSlug,
      if (code != null) 'code': code,
    });
  }

  CodeSnippetsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? problemId,
    Value<String>? lang,
    Value<String>? langSlug,
    Value<String>? code,
  }) {
    return CodeSnippetsTableCompanion(
      id: id ?? this.id,
      problemId: problemId ?? this.problemId,
      lang: lang ?? this.lang,
      langSlug: langSlug ?? this.langSlug,
      code: code ?? this.code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (problemId.present) {
      map['problem_id'] = Variable<int>(problemId.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (langSlug.present) {
      map['lang_slug'] = Variable<String>(langSlug.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CodeSnippetsTableCompanion(')
          ..write('id: $id, ')
          ..write('problemId: $problemId, ')
          ..write('lang: $lang, ')
          ..write('langSlug: $langSlug, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }
}

class $SubmissionsTableTable extends SubmissionsTable
    with TableInfo<$SubmissionsTableTable, SubmissionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubmissionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<int> problemId = GeneratedColumn<int>(
    'problem_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES problems_table (id)',
    ),
  );
  static const VerificationMeta _titleSlugMeta = const VerificationMeta(
    'titleSlug',
  );
  @override
  late final GeneratedColumn<String> titleSlug = GeneratedColumn<String>(
    'title_slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  @override
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
    'lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusDisplayMeta = const VerificationMeta(
    'statusDisplay',
  );
  @override
  late final GeneratedColumn<String> statusDisplay = GeneratedColumn<String>(
    'status_display',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusCodeMeta = const VerificationMeta(
    'statusCode',
  );
  @override
  late final GeneratedColumn<int> statusCode = GeneratedColumn<int>(
    'status_code',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runtimeMeta = const VerificationMeta(
    'runtime',
  );
  @override
  late final GeneratedColumn<String> runtime = GeneratedColumn<String>(
    'runtime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runtimePercentileMeta = const VerificationMeta(
    'runtimePercentile',
  );
  @override
  late final GeneratedColumn<double> runtimePercentile =
      GeneratedColumn<double>(
        'runtime_percentile',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _memoryMeta = const VerificationMeta('memory');
  @override
  late final GeneratedColumn<String> memory = GeneratedColumn<String>(
    'memory',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _memoryPercentileMeta = const VerificationMeta(
    'memoryPercentile',
  );
  @override
  late final GeneratedColumn<double> memoryPercentile = GeneratedColumn<double>(
    'memory_percentile',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalCorrectMeta = const VerificationMeta(
    'totalCorrect',
  );
  @override
  late final GeneratedColumn<int> totalCorrect = GeneratedColumn<int>(
    'total_correct',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalTestcasesMeta = const VerificationMeta(
    'totalTestcases',
  );
  @override
  late final GeneratedColumn<int> totalTestcases = GeneratedColumn<int>(
    'total_testcases',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    problemId,
    titleSlug,
    title,
    lang,
    code,
    statusDisplay,
    statusCode,
    runtime,
    runtimePercentile,
    memory,
    memoryPercentile,
    totalCorrect,
    totalTestcases,
    timestamp,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'submissions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubmissionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('problem_id')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['problem_id']!, _problemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_problemIdMeta);
    }
    if (data.containsKey('title_slug')) {
      context.handle(
        _titleSlugMeta,
        titleSlug.isAcceptableOrUnknown(data['title_slug']!, _titleSlugMeta),
      );
    } else if (isInserting) {
      context.missing(_titleSlugMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('lang')) {
      context.handle(
        _langMeta,
        lang.isAcceptableOrUnknown(data['lang']!, _langMeta),
      );
    } else if (isInserting) {
      context.missing(_langMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('status_display')) {
      context.handle(
        _statusDisplayMeta,
        statusDisplay.isAcceptableOrUnknown(
          data['status_display']!,
          _statusDisplayMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statusDisplayMeta);
    }
    if (data.containsKey('status_code')) {
      context.handle(
        _statusCodeMeta,
        statusCode.isAcceptableOrUnknown(data['status_code']!, _statusCodeMeta),
      );
    }
    if (data.containsKey('runtime')) {
      context.handle(
        _runtimeMeta,
        runtime.isAcceptableOrUnknown(data['runtime']!, _runtimeMeta),
      );
    }
    if (data.containsKey('runtime_percentile')) {
      context.handle(
        _runtimePercentileMeta,
        runtimePercentile.isAcceptableOrUnknown(
          data['runtime_percentile']!,
          _runtimePercentileMeta,
        ),
      );
    }
    if (data.containsKey('memory')) {
      context.handle(
        _memoryMeta,
        memory.isAcceptableOrUnknown(data['memory']!, _memoryMeta),
      );
    }
    if (data.containsKey('memory_percentile')) {
      context.handle(
        _memoryPercentileMeta,
        memoryPercentile.isAcceptableOrUnknown(
          data['memory_percentile']!,
          _memoryPercentileMeta,
        ),
      );
    }
    if (data.containsKey('total_correct')) {
      context.handle(
        _totalCorrectMeta,
        totalCorrect.isAcceptableOrUnknown(
          data['total_correct']!,
          _totalCorrectMeta,
        ),
      );
    }
    if (data.containsKey('total_testcases')) {
      context.handle(
        _totalTestcasesMeta,
        totalTestcases.isAcceptableOrUnknown(
          data['total_testcases']!,
          _totalTestcasesMeta,
        ),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubmissionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubmissionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}problem_id'],
      )!,
      titleSlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_slug'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      lang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lang'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      statusDisplay: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_display'],
      )!,
      statusCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_code'],
      ),
      runtime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}runtime'],
      ),
      runtimePercentile: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}runtime_percentile'],
      ),
      memory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memory'],
      ),
      memoryPercentile: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}memory_percentile'],
      ),
      totalCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_correct'],
      ),
      totalTestcases: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_testcases'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SubmissionsTableTable createAlias(String alias) {
    return $SubmissionsTableTable(attachedDatabase, alias);
  }
}

class SubmissionsTableData extends DataClass
    implements Insertable<SubmissionsTableData> {
  final int id;
  final int problemId;
  final String titleSlug;
  final String title;
  final String lang;
  final String code;
  final String statusDisplay;
  final int? statusCode;
  final String? runtime;
  final double? runtimePercentile;
  final String? memory;
  final double? memoryPercentile;
  final int? totalCorrect;
  final int? totalTestcases;
  final int timestamp;
  final DateTime createdAt;
  const SubmissionsTableData({
    required this.id,
    required this.problemId,
    required this.titleSlug,
    required this.title,
    required this.lang,
    required this.code,
    required this.statusDisplay,
    this.statusCode,
    this.runtime,
    this.runtimePercentile,
    this.memory,
    this.memoryPercentile,
    this.totalCorrect,
    this.totalTestcases,
    required this.timestamp,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['problem_id'] = Variable<int>(problemId);
    map['title_slug'] = Variable<String>(titleSlug);
    map['title'] = Variable<String>(title);
    map['lang'] = Variable<String>(lang);
    map['code'] = Variable<String>(code);
    map['status_display'] = Variable<String>(statusDisplay);
    if (!nullToAbsent || statusCode != null) {
      map['status_code'] = Variable<int>(statusCode);
    }
    if (!nullToAbsent || runtime != null) {
      map['runtime'] = Variable<String>(runtime);
    }
    if (!nullToAbsent || runtimePercentile != null) {
      map['runtime_percentile'] = Variable<double>(runtimePercentile);
    }
    if (!nullToAbsent || memory != null) {
      map['memory'] = Variable<String>(memory);
    }
    if (!nullToAbsent || memoryPercentile != null) {
      map['memory_percentile'] = Variable<double>(memoryPercentile);
    }
    if (!nullToAbsent || totalCorrect != null) {
      map['total_correct'] = Variable<int>(totalCorrect);
    }
    if (!nullToAbsent || totalTestcases != null) {
      map['total_testcases'] = Variable<int>(totalTestcases);
    }
    map['timestamp'] = Variable<int>(timestamp);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SubmissionsTableCompanion toCompanion(bool nullToAbsent) {
    return SubmissionsTableCompanion(
      id: Value(id),
      problemId: Value(problemId),
      titleSlug: Value(titleSlug),
      title: Value(title),
      lang: Value(lang),
      code: Value(code),
      statusDisplay: Value(statusDisplay),
      statusCode: statusCode == null && nullToAbsent
          ? const Value.absent()
          : Value(statusCode),
      runtime: runtime == null && nullToAbsent
          ? const Value.absent()
          : Value(runtime),
      runtimePercentile: runtimePercentile == null && nullToAbsent
          ? const Value.absent()
          : Value(runtimePercentile),
      memory: memory == null && nullToAbsent
          ? const Value.absent()
          : Value(memory),
      memoryPercentile: memoryPercentile == null && nullToAbsent
          ? const Value.absent()
          : Value(memoryPercentile),
      totalCorrect: totalCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCorrect),
      totalTestcases: totalTestcases == null && nullToAbsent
          ? const Value.absent()
          : Value(totalTestcases),
      timestamp: Value(timestamp),
      createdAt: Value(createdAt),
    );
  }

  factory SubmissionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubmissionsTableData(
      id: serializer.fromJson<int>(json['id']),
      problemId: serializer.fromJson<int>(json['problemId']),
      titleSlug: serializer.fromJson<String>(json['titleSlug']),
      title: serializer.fromJson<String>(json['title']),
      lang: serializer.fromJson<String>(json['lang']),
      code: serializer.fromJson<String>(json['code']),
      statusDisplay: serializer.fromJson<String>(json['statusDisplay']),
      statusCode: serializer.fromJson<int?>(json['statusCode']),
      runtime: serializer.fromJson<String?>(json['runtime']),
      runtimePercentile: serializer.fromJson<double?>(
        json['runtimePercentile'],
      ),
      memory: serializer.fromJson<String?>(json['memory']),
      memoryPercentile: serializer.fromJson<double?>(json['memoryPercentile']),
      totalCorrect: serializer.fromJson<int?>(json['totalCorrect']),
      totalTestcases: serializer.fromJson<int?>(json['totalTestcases']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'problemId': serializer.toJson<int>(problemId),
      'titleSlug': serializer.toJson<String>(titleSlug),
      'title': serializer.toJson<String>(title),
      'lang': serializer.toJson<String>(lang),
      'code': serializer.toJson<String>(code),
      'statusDisplay': serializer.toJson<String>(statusDisplay),
      'statusCode': serializer.toJson<int?>(statusCode),
      'runtime': serializer.toJson<String?>(runtime),
      'runtimePercentile': serializer.toJson<double?>(runtimePercentile),
      'memory': serializer.toJson<String?>(memory),
      'memoryPercentile': serializer.toJson<double?>(memoryPercentile),
      'totalCorrect': serializer.toJson<int?>(totalCorrect),
      'totalTestcases': serializer.toJson<int?>(totalTestcases),
      'timestamp': serializer.toJson<int>(timestamp),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SubmissionsTableData copyWith({
    int? id,
    int? problemId,
    String? titleSlug,
    String? title,
    String? lang,
    String? code,
    String? statusDisplay,
    Value<int?> statusCode = const Value.absent(),
    Value<String?> runtime = const Value.absent(),
    Value<double?> runtimePercentile = const Value.absent(),
    Value<String?> memory = const Value.absent(),
    Value<double?> memoryPercentile = const Value.absent(),
    Value<int?> totalCorrect = const Value.absent(),
    Value<int?> totalTestcases = const Value.absent(),
    int? timestamp,
    DateTime? createdAt,
  }) => SubmissionsTableData(
    id: id ?? this.id,
    problemId: problemId ?? this.problemId,
    titleSlug: titleSlug ?? this.titleSlug,
    title: title ?? this.title,
    lang: lang ?? this.lang,
    code: code ?? this.code,
    statusDisplay: statusDisplay ?? this.statusDisplay,
    statusCode: statusCode.present ? statusCode.value : this.statusCode,
    runtime: runtime.present ? runtime.value : this.runtime,
    runtimePercentile: runtimePercentile.present
        ? runtimePercentile.value
        : this.runtimePercentile,
    memory: memory.present ? memory.value : this.memory,
    memoryPercentile: memoryPercentile.present
        ? memoryPercentile.value
        : this.memoryPercentile,
    totalCorrect: totalCorrect.present ? totalCorrect.value : this.totalCorrect,
    totalTestcases: totalTestcases.present
        ? totalTestcases.value
        : this.totalTestcases,
    timestamp: timestamp ?? this.timestamp,
    createdAt: createdAt ?? this.createdAt,
  );
  SubmissionsTableData copyWithCompanion(SubmissionsTableCompanion data) {
    return SubmissionsTableData(
      id: data.id.present ? data.id.value : this.id,
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      titleSlug: data.titleSlug.present ? data.titleSlug.value : this.titleSlug,
      title: data.title.present ? data.title.value : this.title,
      lang: data.lang.present ? data.lang.value : this.lang,
      code: data.code.present ? data.code.value : this.code,
      statusDisplay: data.statusDisplay.present
          ? data.statusDisplay.value
          : this.statusDisplay,
      statusCode: data.statusCode.present
          ? data.statusCode.value
          : this.statusCode,
      runtime: data.runtime.present ? data.runtime.value : this.runtime,
      runtimePercentile: data.runtimePercentile.present
          ? data.runtimePercentile.value
          : this.runtimePercentile,
      memory: data.memory.present ? data.memory.value : this.memory,
      memoryPercentile: data.memoryPercentile.present
          ? data.memoryPercentile.value
          : this.memoryPercentile,
      totalCorrect: data.totalCorrect.present
          ? data.totalCorrect.value
          : this.totalCorrect,
      totalTestcases: data.totalTestcases.present
          ? data.totalTestcases.value
          : this.totalTestcases,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubmissionsTableData(')
          ..write('id: $id, ')
          ..write('problemId: $problemId, ')
          ..write('titleSlug: $titleSlug, ')
          ..write('title: $title, ')
          ..write('lang: $lang, ')
          ..write('code: $code, ')
          ..write('statusDisplay: $statusDisplay, ')
          ..write('statusCode: $statusCode, ')
          ..write('runtime: $runtime, ')
          ..write('runtimePercentile: $runtimePercentile, ')
          ..write('memory: $memory, ')
          ..write('memoryPercentile: $memoryPercentile, ')
          ..write('totalCorrect: $totalCorrect, ')
          ..write('totalTestcases: $totalTestcases, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    problemId,
    titleSlug,
    title,
    lang,
    code,
    statusDisplay,
    statusCode,
    runtime,
    runtimePercentile,
    memory,
    memoryPercentile,
    totalCorrect,
    totalTestcases,
    timestamp,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubmissionsTableData &&
          other.id == this.id &&
          other.problemId == this.problemId &&
          other.titleSlug == this.titleSlug &&
          other.title == this.title &&
          other.lang == this.lang &&
          other.code == this.code &&
          other.statusDisplay == this.statusDisplay &&
          other.statusCode == this.statusCode &&
          other.runtime == this.runtime &&
          other.runtimePercentile == this.runtimePercentile &&
          other.memory == this.memory &&
          other.memoryPercentile == this.memoryPercentile &&
          other.totalCorrect == this.totalCorrect &&
          other.totalTestcases == this.totalTestcases &&
          other.timestamp == this.timestamp &&
          other.createdAt == this.createdAt);
}

class SubmissionsTableCompanion extends UpdateCompanion<SubmissionsTableData> {
  final Value<int> id;
  final Value<int> problemId;
  final Value<String> titleSlug;
  final Value<String> title;
  final Value<String> lang;
  final Value<String> code;
  final Value<String> statusDisplay;
  final Value<int?> statusCode;
  final Value<String?> runtime;
  final Value<double?> runtimePercentile;
  final Value<String?> memory;
  final Value<double?> memoryPercentile;
  final Value<int?> totalCorrect;
  final Value<int?> totalTestcases;
  final Value<int> timestamp;
  final Value<DateTime> createdAt;
  const SubmissionsTableCompanion({
    this.id = const Value.absent(),
    this.problemId = const Value.absent(),
    this.titleSlug = const Value.absent(),
    this.title = const Value.absent(),
    this.lang = const Value.absent(),
    this.code = const Value.absent(),
    this.statusDisplay = const Value.absent(),
    this.statusCode = const Value.absent(),
    this.runtime = const Value.absent(),
    this.runtimePercentile = const Value.absent(),
    this.memory = const Value.absent(),
    this.memoryPercentile = const Value.absent(),
    this.totalCorrect = const Value.absent(),
    this.totalTestcases = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SubmissionsTableCompanion.insert({
    this.id = const Value.absent(),
    required int problemId,
    required String titleSlug,
    required String title,
    required String lang,
    required String code,
    required String statusDisplay,
    this.statusCode = const Value.absent(),
    this.runtime = const Value.absent(),
    this.runtimePercentile = const Value.absent(),
    this.memory = const Value.absent(),
    this.memoryPercentile = const Value.absent(),
    this.totalCorrect = const Value.absent(),
    this.totalTestcases = const Value.absent(),
    required int timestamp,
    this.createdAt = const Value.absent(),
  }) : problemId = Value(problemId),
       titleSlug = Value(titleSlug),
       title = Value(title),
       lang = Value(lang),
       code = Value(code),
       statusDisplay = Value(statusDisplay),
       timestamp = Value(timestamp);
  static Insertable<SubmissionsTableData> custom({
    Expression<int>? id,
    Expression<int>? problemId,
    Expression<String>? titleSlug,
    Expression<String>? title,
    Expression<String>? lang,
    Expression<String>? code,
    Expression<String>? statusDisplay,
    Expression<int>? statusCode,
    Expression<String>? runtime,
    Expression<double>? runtimePercentile,
    Expression<String>? memory,
    Expression<double>? memoryPercentile,
    Expression<int>? totalCorrect,
    Expression<int>? totalTestcases,
    Expression<int>? timestamp,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (problemId != null) 'problem_id': problemId,
      if (titleSlug != null) 'title_slug': titleSlug,
      if (title != null) 'title': title,
      if (lang != null) 'lang': lang,
      if (code != null) 'code': code,
      if (statusDisplay != null) 'status_display': statusDisplay,
      if (statusCode != null) 'status_code': statusCode,
      if (runtime != null) 'runtime': runtime,
      if (runtimePercentile != null) 'runtime_percentile': runtimePercentile,
      if (memory != null) 'memory': memory,
      if (memoryPercentile != null) 'memory_percentile': memoryPercentile,
      if (totalCorrect != null) 'total_correct': totalCorrect,
      if (totalTestcases != null) 'total_testcases': totalTestcases,
      if (timestamp != null) 'timestamp': timestamp,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SubmissionsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? problemId,
    Value<String>? titleSlug,
    Value<String>? title,
    Value<String>? lang,
    Value<String>? code,
    Value<String>? statusDisplay,
    Value<int?>? statusCode,
    Value<String?>? runtime,
    Value<double?>? runtimePercentile,
    Value<String?>? memory,
    Value<double?>? memoryPercentile,
    Value<int?>? totalCorrect,
    Value<int?>? totalTestcases,
    Value<int>? timestamp,
    Value<DateTime>? createdAt,
  }) {
    return SubmissionsTableCompanion(
      id: id ?? this.id,
      problemId: problemId ?? this.problemId,
      titleSlug: titleSlug ?? this.titleSlug,
      title: title ?? this.title,
      lang: lang ?? this.lang,
      code: code ?? this.code,
      statusDisplay: statusDisplay ?? this.statusDisplay,
      statusCode: statusCode ?? this.statusCode,
      runtime: runtime ?? this.runtime,
      runtimePercentile: runtimePercentile ?? this.runtimePercentile,
      memory: memory ?? this.memory,
      memoryPercentile: memoryPercentile ?? this.memoryPercentile,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalTestcases: totalTestcases ?? this.totalTestcases,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (problemId.present) {
      map['problem_id'] = Variable<int>(problemId.value);
    }
    if (titleSlug.present) {
      map['title_slug'] = Variable<String>(titleSlug.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (statusDisplay.present) {
      map['status_display'] = Variable<String>(statusDisplay.value);
    }
    if (statusCode.present) {
      map['status_code'] = Variable<int>(statusCode.value);
    }
    if (runtime.present) {
      map['runtime'] = Variable<String>(runtime.value);
    }
    if (runtimePercentile.present) {
      map['runtime_percentile'] = Variable<double>(runtimePercentile.value);
    }
    if (memory.present) {
      map['memory'] = Variable<String>(memory.value);
    }
    if (memoryPercentile.present) {
      map['memory_percentile'] = Variable<double>(memoryPercentile.value);
    }
    if (totalCorrect.present) {
      map['total_correct'] = Variable<int>(totalCorrect.value);
    }
    if (totalTestcases.present) {
      map['total_testcases'] = Variable<int>(totalTestcases.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubmissionsTableCompanion(')
          ..write('id: $id, ')
          ..write('problemId: $problemId, ')
          ..write('titleSlug: $titleSlug, ')
          ..write('title: $title, ')
          ..write('lang: $lang, ')
          ..write('code: $code, ')
          ..write('statusDisplay: $statusDisplay, ')
          ..write('statusCode: $statusCode, ')
          ..write('runtime: $runtime, ')
          ..write('runtimePercentile: $runtimePercentile, ')
          ..write('memory: $memory, ')
          ..write('memoryPercentile: $memoryPercentile, ')
          ..write('totalCorrect: $totalCorrect, ')
          ..write('totalTestcases: $totalTestcases, ')
          ..write('timestamp: $timestamp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserProgressTableTable extends UserProgressTable
    with TableInfo<$UserProgressTableTable, UserProgressTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _easySolvedMeta = const VerificationMeta(
    'easySolved',
  );
  @override
  late final GeneratedColumn<int> easySolved = GeneratedColumn<int>(
    'easy_solved',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mediumSolvedMeta = const VerificationMeta(
    'mediumSolved',
  );
  @override
  late final GeneratedColumn<int> mediumSolved = GeneratedColumn<int>(
    'medium_solved',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _hardSolvedMeta = const VerificationMeta(
    'hardSolved',
  );
  @override
  late final GeneratedColumn<int> hardSolved = GeneratedColumn<int>(
    'hard_solved',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalSolvedMeta = const VerificationMeta(
    'totalSolved',
  );
  @override
  late final GeneratedColumn<int> totalSolved = GeneratedColumn<int>(
    'total_solved',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _easyTotalMeta = const VerificationMeta(
    'easyTotal',
  );
  @override
  late final GeneratedColumn<int> easyTotal = GeneratedColumn<int>(
    'easy_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mediumTotalMeta = const VerificationMeta(
    'mediumTotal',
  );
  @override
  late final GeneratedColumn<int> mediumTotal = GeneratedColumn<int>(
    'medium_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _hardTotalMeta = const VerificationMeta(
    'hardTotal',
  );
  @override
  late final GeneratedColumn<int> hardTotal = GeneratedColumn<int>(
    'hard_total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalQuestionsMeta = const VerificationMeta(
    'totalQuestions',
  );
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
    'total_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rankingMeta = const VerificationMeta(
    'ranking',
  );
  @override
  late final GeneratedColumn<int> ranking = GeneratedColumn<int>(
    'ranking',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reputationMeta = const VerificationMeta(
    'reputation',
  );
  @override
  late final GeneratedColumn<int> reputation = GeneratedColumn<int>(
    'reputation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _streakMeta = const VerificationMeta('streak');
  @override
  late final GeneratedColumn<int> streak = GeneratedColumn<int>(
    'streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalActiveDaysMeta = const VerificationMeta(
    'totalActiveDays',
  );
  @override
  late final GeneratedColumn<int> totalActiveDays = GeneratedColumn<int>(
    'total_active_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _submissionCalendarMeta =
      const VerificationMeta('submissionCalendar');
  @override
  late final GeneratedColumn<String> submissionCalendar =
      GeneratedColumn<String>(
        'submission_calendar',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastSyncedMeta = const VerificationMeta(
    'lastSynced',
  );
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
    'last_synced',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    easySolved,
    mediumSolved,
    hardSolved,
    totalSolved,
    easyTotal,
    mediumTotal,
    hardTotal,
    totalQuestions,
    ranking,
    reputation,
    streak,
    totalActiveDays,
    submissionCalendar,
    lastSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_progress_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProgressTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('easy_solved')) {
      context.handle(
        _easySolvedMeta,
        easySolved.isAcceptableOrUnknown(data['easy_solved']!, _easySolvedMeta),
      );
    }
    if (data.containsKey('medium_solved')) {
      context.handle(
        _mediumSolvedMeta,
        mediumSolved.isAcceptableOrUnknown(
          data['medium_solved']!,
          _mediumSolvedMeta,
        ),
      );
    }
    if (data.containsKey('hard_solved')) {
      context.handle(
        _hardSolvedMeta,
        hardSolved.isAcceptableOrUnknown(data['hard_solved']!, _hardSolvedMeta),
      );
    }
    if (data.containsKey('total_solved')) {
      context.handle(
        _totalSolvedMeta,
        totalSolved.isAcceptableOrUnknown(
          data['total_solved']!,
          _totalSolvedMeta,
        ),
      );
    }
    if (data.containsKey('easy_total')) {
      context.handle(
        _easyTotalMeta,
        easyTotal.isAcceptableOrUnknown(data['easy_total']!, _easyTotalMeta),
      );
    }
    if (data.containsKey('medium_total')) {
      context.handle(
        _mediumTotalMeta,
        mediumTotal.isAcceptableOrUnknown(
          data['medium_total']!,
          _mediumTotalMeta,
        ),
      );
    }
    if (data.containsKey('hard_total')) {
      context.handle(
        _hardTotalMeta,
        hardTotal.isAcceptableOrUnknown(data['hard_total']!, _hardTotalMeta),
      );
    }
    if (data.containsKey('total_questions')) {
      context.handle(
        _totalQuestionsMeta,
        totalQuestions.isAcceptableOrUnknown(
          data['total_questions']!,
          _totalQuestionsMeta,
        ),
      );
    }
    if (data.containsKey('ranking')) {
      context.handle(
        _rankingMeta,
        ranking.isAcceptableOrUnknown(data['ranking']!, _rankingMeta),
      );
    }
    if (data.containsKey('reputation')) {
      context.handle(
        _reputationMeta,
        reputation.isAcceptableOrUnknown(data['reputation']!, _reputationMeta),
      );
    }
    if (data.containsKey('streak')) {
      context.handle(
        _streakMeta,
        streak.isAcceptableOrUnknown(data['streak']!, _streakMeta),
      );
    }
    if (data.containsKey('total_active_days')) {
      context.handle(
        _totalActiveDaysMeta,
        totalActiveDays.isAcceptableOrUnknown(
          data['total_active_days']!,
          _totalActiveDaysMeta,
        ),
      );
    }
    if (data.containsKey('submission_calendar')) {
      context.handle(
        _submissionCalendarMeta,
        submissionCalendar.isAcceptableOrUnknown(
          data['submission_calendar']!,
          _submissionCalendarMeta,
        ),
      );
    }
    if (data.containsKey('last_synced')) {
      context.handle(
        _lastSyncedMeta,
        lastSynced.isAcceptableOrUnknown(data['last_synced']!, _lastSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProgressTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProgressTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      easySolved: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}easy_solved'],
      )!,
      mediumSolved: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medium_solved'],
      )!,
      hardSolved: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hard_solved'],
      )!,
      totalSolved: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_solved'],
      )!,
      easyTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}easy_total'],
      )!,
      mediumTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medium_total'],
      )!,
      hardTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hard_total'],
      )!,
      totalQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_questions'],
      )!,
      ranking: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ranking'],
      )!,
      reputation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reputation'],
      )!,
      streak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak'],
      )!,
      totalActiveDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_active_days'],
      )!,
      submissionCalendar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}submission_calendar'],
      ),
      lastSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced'],
      )!,
    );
  }

  @override
  $UserProgressTableTable createAlias(String alias) {
    return $UserProgressTableTable(attachedDatabase, alias);
  }
}

class UserProgressTableData extends DataClass
    implements Insertable<UserProgressTableData> {
  final int id;
  final String username;
  final int easySolved;
  final int mediumSolved;
  final int hardSolved;
  final int totalSolved;
  final int easyTotal;
  final int mediumTotal;
  final int hardTotal;
  final int totalQuestions;
  final int ranking;
  final int reputation;
  final int streak;
  final int totalActiveDays;
  final String? submissionCalendar;
  final DateTime lastSynced;
  const UserProgressTableData({
    required this.id,
    required this.username,
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
    required this.totalSolved,
    required this.easyTotal,
    required this.mediumTotal,
    required this.hardTotal,
    required this.totalQuestions,
    required this.ranking,
    required this.reputation,
    required this.streak,
    required this.totalActiveDays,
    this.submissionCalendar,
    required this.lastSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['easy_solved'] = Variable<int>(easySolved);
    map['medium_solved'] = Variable<int>(mediumSolved);
    map['hard_solved'] = Variable<int>(hardSolved);
    map['total_solved'] = Variable<int>(totalSolved);
    map['easy_total'] = Variable<int>(easyTotal);
    map['medium_total'] = Variable<int>(mediumTotal);
    map['hard_total'] = Variable<int>(hardTotal);
    map['total_questions'] = Variable<int>(totalQuestions);
    map['ranking'] = Variable<int>(ranking);
    map['reputation'] = Variable<int>(reputation);
    map['streak'] = Variable<int>(streak);
    map['total_active_days'] = Variable<int>(totalActiveDays);
    if (!nullToAbsent || submissionCalendar != null) {
      map['submission_calendar'] = Variable<String>(submissionCalendar);
    }
    map['last_synced'] = Variable<DateTime>(lastSynced);
    return map;
  }

  UserProgressTableCompanion toCompanion(bool nullToAbsent) {
    return UserProgressTableCompanion(
      id: Value(id),
      username: Value(username),
      easySolved: Value(easySolved),
      mediumSolved: Value(mediumSolved),
      hardSolved: Value(hardSolved),
      totalSolved: Value(totalSolved),
      easyTotal: Value(easyTotal),
      mediumTotal: Value(mediumTotal),
      hardTotal: Value(hardTotal),
      totalQuestions: Value(totalQuestions),
      ranking: Value(ranking),
      reputation: Value(reputation),
      streak: Value(streak),
      totalActiveDays: Value(totalActiveDays),
      submissionCalendar: submissionCalendar == null && nullToAbsent
          ? const Value.absent()
          : Value(submissionCalendar),
      lastSynced: Value(lastSynced),
    );
  }

  factory UserProgressTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProgressTableData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      easySolved: serializer.fromJson<int>(json['easySolved']),
      mediumSolved: serializer.fromJson<int>(json['mediumSolved']),
      hardSolved: serializer.fromJson<int>(json['hardSolved']),
      totalSolved: serializer.fromJson<int>(json['totalSolved']),
      easyTotal: serializer.fromJson<int>(json['easyTotal']),
      mediumTotal: serializer.fromJson<int>(json['mediumTotal']),
      hardTotal: serializer.fromJson<int>(json['hardTotal']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      ranking: serializer.fromJson<int>(json['ranking']),
      reputation: serializer.fromJson<int>(json['reputation']),
      streak: serializer.fromJson<int>(json['streak']),
      totalActiveDays: serializer.fromJson<int>(json['totalActiveDays']),
      submissionCalendar: serializer.fromJson<String?>(
        json['submissionCalendar'],
      ),
      lastSynced: serializer.fromJson<DateTime>(json['lastSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'easySolved': serializer.toJson<int>(easySolved),
      'mediumSolved': serializer.toJson<int>(mediumSolved),
      'hardSolved': serializer.toJson<int>(hardSolved),
      'totalSolved': serializer.toJson<int>(totalSolved),
      'easyTotal': serializer.toJson<int>(easyTotal),
      'mediumTotal': serializer.toJson<int>(mediumTotal),
      'hardTotal': serializer.toJson<int>(hardTotal),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'ranking': serializer.toJson<int>(ranking),
      'reputation': serializer.toJson<int>(reputation),
      'streak': serializer.toJson<int>(streak),
      'totalActiveDays': serializer.toJson<int>(totalActiveDays),
      'submissionCalendar': serializer.toJson<String?>(submissionCalendar),
      'lastSynced': serializer.toJson<DateTime>(lastSynced),
    };
  }

  UserProgressTableData copyWith({
    int? id,
    String? username,
    int? easySolved,
    int? mediumSolved,
    int? hardSolved,
    int? totalSolved,
    int? easyTotal,
    int? mediumTotal,
    int? hardTotal,
    int? totalQuestions,
    int? ranking,
    int? reputation,
    int? streak,
    int? totalActiveDays,
    Value<String?> submissionCalendar = const Value.absent(),
    DateTime? lastSynced,
  }) => UserProgressTableData(
    id: id ?? this.id,
    username: username ?? this.username,
    easySolved: easySolved ?? this.easySolved,
    mediumSolved: mediumSolved ?? this.mediumSolved,
    hardSolved: hardSolved ?? this.hardSolved,
    totalSolved: totalSolved ?? this.totalSolved,
    easyTotal: easyTotal ?? this.easyTotal,
    mediumTotal: mediumTotal ?? this.mediumTotal,
    hardTotal: hardTotal ?? this.hardTotal,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    ranking: ranking ?? this.ranking,
    reputation: reputation ?? this.reputation,
    streak: streak ?? this.streak,
    totalActiveDays: totalActiveDays ?? this.totalActiveDays,
    submissionCalendar: submissionCalendar.present
        ? submissionCalendar.value
        : this.submissionCalendar,
    lastSynced: lastSynced ?? this.lastSynced,
  );
  UserProgressTableData copyWithCompanion(UserProgressTableCompanion data) {
    return UserProgressTableData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      easySolved: data.easySolved.present
          ? data.easySolved.value
          : this.easySolved,
      mediumSolved: data.mediumSolved.present
          ? data.mediumSolved.value
          : this.mediumSolved,
      hardSolved: data.hardSolved.present
          ? data.hardSolved.value
          : this.hardSolved,
      totalSolved: data.totalSolved.present
          ? data.totalSolved.value
          : this.totalSolved,
      easyTotal: data.easyTotal.present ? data.easyTotal.value : this.easyTotal,
      mediumTotal: data.mediumTotal.present
          ? data.mediumTotal.value
          : this.mediumTotal,
      hardTotal: data.hardTotal.present ? data.hardTotal.value : this.hardTotal,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      ranking: data.ranking.present ? data.ranking.value : this.ranking,
      reputation: data.reputation.present
          ? data.reputation.value
          : this.reputation,
      streak: data.streak.present ? data.streak.value : this.streak,
      totalActiveDays: data.totalActiveDays.present
          ? data.totalActiveDays.value
          : this.totalActiveDays,
      submissionCalendar: data.submissionCalendar.present
          ? data.submissionCalendar.value
          : this.submissionCalendar,
      lastSynced: data.lastSynced.present
          ? data.lastSynced.value
          : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProgressTableData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('easySolved: $easySolved, ')
          ..write('mediumSolved: $mediumSolved, ')
          ..write('hardSolved: $hardSolved, ')
          ..write('totalSolved: $totalSolved, ')
          ..write('easyTotal: $easyTotal, ')
          ..write('mediumTotal: $mediumTotal, ')
          ..write('hardTotal: $hardTotal, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('ranking: $ranking, ')
          ..write('reputation: $reputation, ')
          ..write('streak: $streak, ')
          ..write('totalActiveDays: $totalActiveDays, ')
          ..write('submissionCalendar: $submissionCalendar, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    username,
    easySolved,
    mediumSolved,
    hardSolved,
    totalSolved,
    easyTotal,
    mediumTotal,
    hardTotal,
    totalQuestions,
    ranking,
    reputation,
    streak,
    totalActiveDays,
    submissionCalendar,
    lastSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProgressTableData &&
          other.id == this.id &&
          other.username == this.username &&
          other.easySolved == this.easySolved &&
          other.mediumSolved == this.mediumSolved &&
          other.hardSolved == this.hardSolved &&
          other.totalSolved == this.totalSolved &&
          other.easyTotal == this.easyTotal &&
          other.mediumTotal == this.mediumTotal &&
          other.hardTotal == this.hardTotal &&
          other.totalQuestions == this.totalQuestions &&
          other.ranking == this.ranking &&
          other.reputation == this.reputation &&
          other.streak == this.streak &&
          other.totalActiveDays == this.totalActiveDays &&
          other.submissionCalendar == this.submissionCalendar &&
          other.lastSynced == this.lastSynced);
}

class UserProgressTableCompanion
    extends UpdateCompanion<UserProgressTableData> {
  final Value<int> id;
  final Value<String> username;
  final Value<int> easySolved;
  final Value<int> mediumSolved;
  final Value<int> hardSolved;
  final Value<int> totalSolved;
  final Value<int> easyTotal;
  final Value<int> mediumTotal;
  final Value<int> hardTotal;
  final Value<int> totalQuestions;
  final Value<int> ranking;
  final Value<int> reputation;
  final Value<int> streak;
  final Value<int> totalActiveDays;
  final Value<String?> submissionCalendar;
  final Value<DateTime> lastSynced;
  const UserProgressTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.easySolved = const Value.absent(),
    this.mediumSolved = const Value.absent(),
    this.hardSolved = const Value.absent(),
    this.totalSolved = const Value.absent(),
    this.easyTotal = const Value.absent(),
    this.mediumTotal = const Value.absent(),
    this.hardTotal = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.ranking = const Value.absent(),
    this.reputation = const Value.absent(),
    this.streak = const Value.absent(),
    this.totalActiveDays = const Value.absent(),
    this.submissionCalendar = const Value.absent(),
    this.lastSynced = const Value.absent(),
  });
  UserProgressTableCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    this.easySolved = const Value.absent(),
    this.mediumSolved = const Value.absent(),
    this.hardSolved = const Value.absent(),
    this.totalSolved = const Value.absent(),
    this.easyTotal = const Value.absent(),
    this.mediumTotal = const Value.absent(),
    this.hardTotal = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.ranking = const Value.absent(),
    this.reputation = const Value.absent(),
    this.streak = const Value.absent(),
    this.totalActiveDays = const Value.absent(),
    this.submissionCalendar = const Value.absent(),
    this.lastSynced = const Value.absent(),
  }) : username = Value(username);
  static Insertable<UserProgressTableData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<int>? easySolved,
    Expression<int>? mediumSolved,
    Expression<int>? hardSolved,
    Expression<int>? totalSolved,
    Expression<int>? easyTotal,
    Expression<int>? mediumTotal,
    Expression<int>? hardTotal,
    Expression<int>? totalQuestions,
    Expression<int>? ranking,
    Expression<int>? reputation,
    Expression<int>? streak,
    Expression<int>? totalActiveDays,
    Expression<String>? submissionCalendar,
    Expression<DateTime>? lastSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (easySolved != null) 'easy_solved': easySolved,
      if (mediumSolved != null) 'medium_solved': mediumSolved,
      if (hardSolved != null) 'hard_solved': hardSolved,
      if (totalSolved != null) 'total_solved': totalSolved,
      if (easyTotal != null) 'easy_total': easyTotal,
      if (mediumTotal != null) 'medium_total': mediumTotal,
      if (hardTotal != null) 'hard_total': hardTotal,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (ranking != null) 'ranking': ranking,
      if (reputation != null) 'reputation': reputation,
      if (streak != null) 'streak': streak,
      if (totalActiveDays != null) 'total_active_days': totalActiveDays,
      if (submissionCalendar != null) 'submission_calendar': submissionCalendar,
      if (lastSynced != null) 'last_synced': lastSynced,
    });
  }

  UserProgressTableCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<int>? easySolved,
    Value<int>? mediumSolved,
    Value<int>? hardSolved,
    Value<int>? totalSolved,
    Value<int>? easyTotal,
    Value<int>? mediumTotal,
    Value<int>? hardTotal,
    Value<int>? totalQuestions,
    Value<int>? ranking,
    Value<int>? reputation,
    Value<int>? streak,
    Value<int>? totalActiveDays,
    Value<String?>? submissionCalendar,
    Value<DateTime>? lastSynced,
  }) {
    return UserProgressTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      easySolved: easySolved ?? this.easySolved,
      mediumSolved: mediumSolved ?? this.mediumSolved,
      hardSolved: hardSolved ?? this.hardSolved,
      totalSolved: totalSolved ?? this.totalSolved,
      easyTotal: easyTotal ?? this.easyTotal,
      mediumTotal: mediumTotal ?? this.mediumTotal,
      hardTotal: hardTotal ?? this.hardTotal,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      ranking: ranking ?? this.ranking,
      reputation: reputation ?? this.reputation,
      streak: streak ?? this.streak,
      totalActiveDays: totalActiveDays ?? this.totalActiveDays,
      submissionCalendar: submissionCalendar ?? this.submissionCalendar,
      lastSynced: lastSynced ?? this.lastSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (easySolved.present) {
      map['easy_solved'] = Variable<int>(easySolved.value);
    }
    if (mediumSolved.present) {
      map['medium_solved'] = Variable<int>(mediumSolved.value);
    }
    if (hardSolved.present) {
      map['hard_solved'] = Variable<int>(hardSolved.value);
    }
    if (totalSolved.present) {
      map['total_solved'] = Variable<int>(totalSolved.value);
    }
    if (easyTotal.present) {
      map['easy_total'] = Variable<int>(easyTotal.value);
    }
    if (mediumTotal.present) {
      map['medium_total'] = Variable<int>(mediumTotal.value);
    }
    if (hardTotal.present) {
      map['hard_total'] = Variable<int>(hardTotal.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (ranking.present) {
      map['ranking'] = Variable<int>(ranking.value);
    }
    if (reputation.present) {
      map['reputation'] = Variable<int>(reputation.value);
    }
    if (streak.present) {
      map['streak'] = Variable<int>(streak.value);
    }
    if (totalActiveDays.present) {
      map['total_active_days'] = Variable<int>(totalActiveDays.value);
    }
    if (submissionCalendar.present) {
      map['submission_calendar'] = Variable<String>(submissionCalendar.value);
    }
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProgressTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('easySolved: $easySolved, ')
          ..write('mediumSolved: $mediumSolved, ')
          ..write('hardSolved: $hardSolved, ')
          ..write('totalSolved: $totalSolved, ')
          ..write('easyTotal: $easyTotal, ')
          ..write('mediumTotal: $mediumTotal, ')
          ..write('hardTotal: $hardTotal, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('ranking: $ranking, ')
          ..write('reputation: $reputation, ')
          ..write('streak: $streak, ')
          ..write('totalActiveDays: $totalActiveDays, ')
          ..write('submissionCalendar: $submissionCalendar, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProblemsTableTable problemsTable = $ProblemsTableTable(this);
  late final $TopicTagsTableTable topicTagsTable = $TopicTagsTableTable(this);
  late final $ProblemTopicTagsTableTable problemTopicTagsTable =
      $ProblemTopicTagsTableTable(this);
  late final $CodeSnippetsTableTable codeSnippetsTable =
      $CodeSnippetsTableTable(this);
  late final $SubmissionsTableTable submissionsTable = $SubmissionsTableTable(
    this,
  );
  late final $UserProgressTableTable userProgressTable =
      $UserProgressTableTable(this);
  late final ProblemDao problemDao = ProblemDao(this as AppDatabase);
  late final TopicTagDao topicTagDao = TopicTagDao(this as AppDatabase);
  late final SubmissionDao submissionDao = SubmissionDao(this as AppDatabase);
  late final UserProgressDao userProgressDao = UserProgressDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    problemsTable,
    topicTagsTable,
    problemTopicTagsTable,
    codeSnippetsTable,
    submissionsTable,
    userProgressTable,
  ];
}

typedef $$ProblemsTableTableCreateCompanionBuilder =
    ProblemsTableCompanion Function({
      Value<int> id,
      required String frontendId,
      required String title,
      required String titleSlug,
      Value<String?> content,
      required String difficulty,
      Value<double> acRate,
      Value<bool> isPaidOnly,
      Value<String?> status,
      Value<int> likes,
      Value<int> dislikes,
      Value<String> categoryTitle,
      Value<String?> hints,
      Value<String?> similarQuestions,
      Value<String?> exampleTestcases,
      Value<String?> sampleTestCase,
      Value<String?> stats,
      Value<bool> isFavorite,
      Value<DateTime?> lastSynced,
      Value<DateTime> createdAt,
    });
typedef $$ProblemsTableTableUpdateCompanionBuilder =
    ProblemsTableCompanion Function({
      Value<int> id,
      Value<String> frontendId,
      Value<String> title,
      Value<String> titleSlug,
      Value<String?> content,
      Value<String> difficulty,
      Value<double> acRate,
      Value<bool> isPaidOnly,
      Value<String?> status,
      Value<int> likes,
      Value<int> dislikes,
      Value<String> categoryTitle,
      Value<String?> hints,
      Value<String?> similarQuestions,
      Value<String?> exampleTestcases,
      Value<String?> sampleTestCase,
      Value<String?> stats,
      Value<bool> isFavorite,
      Value<DateTime?> lastSynced,
      Value<DateTime> createdAt,
    });

final class $$ProblemsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProblemsTableTable, ProblemsTableData> {
  $$ProblemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ProblemTopicTagsTableTable,
    List<ProblemTopicTagsTableData>
  >
  _problemTopicTagsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.problemTopicTagsTable,
        aliasName: $_aliasNameGenerator(
          db.problemsTable.id,
          db.problemTopicTagsTable.problemId,
        ),
      );

  $$ProblemTopicTagsTableTableProcessedTableManager
  get problemTopicTagsTableRefs {
    final manager = $$ProblemTopicTagsTableTableTableManager(
      $_db,
      $_db.problemTopicTagsTable,
    ).filter((f) => f.problemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _problemTopicTagsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CodeSnippetsTableTable,
    List<CodeSnippetsTableData>
  >
  _codeSnippetsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.codeSnippetsTable,
        aliasName: $_aliasNameGenerator(
          db.problemsTable.id,
          db.codeSnippetsTable.problemId,
        ),
      );

  $$CodeSnippetsTableTableProcessedTableManager get codeSnippetsTableRefs {
    final manager = $$CodeSnippetsTableTableTableManager(
      $_db,
      $_db.codeSnippetsTable,
    ).filter((f) => f.problemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _codeSnippetsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SubmissionsTableTable, List<SubmissionsTableData>>
  _submissionsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.submissionsTable,
    aliasName: $_aliasNameGenerator(
      db.problemsTable.id,
      db.submissionsTable.problemId,
    ),
  );

  $$SubmissionsTableTableProcessedTableManager get submissionsTableRefs {
    final manager = $$SubmissionsTableTableTableManager(
      $_db,
      $_db.submissionsTable,
    ).filter((f) => f.problemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _submissionsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProblemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemsTableTable> {
  $$ProblemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frontendId => $composableBuilder(
    column: $table.frontendId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleSlug => $composableBuilder(
    column: $table.titleSlug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get acRate => $composableBuilder(
    column: $table.acRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPaidOnly => $composableBuilder(
    column: $table.isPaidOnly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dislikes => $composableBuilder(
    column: $table.dislikes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryTitle => $composableBuilder(
    column: $table.categoryTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hints => $composableBuilder(
    column: $table.hints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get similarQuestions => $composableBuilder(
    column: $table.similarQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exampleTestcases => $composableBuilder(
    column: $table.exampleTestcases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sampleTestCase => $composableBuilder(
    column: $table.sampleTestCase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stats => $composableBuilder(
    column: $table.stats,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> problemTopicTagsTableRefs(
    Expression<bool> Function($$ProblemTopicTagsTableTableFilterComposer f) f,
  ) {
    final $$ProblemTopicTagsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.problemTopicTagsTable,
          getReferencedColumn: (t) => t.problemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProblemTopicTagsTableTableFilterComposer(
                $db: $db,
                $table: $db.problemTopicTagsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> codeSnippetsTableRefs(
    Expression<bool> Function($$CodeSnippetsTableTableFilterComposer f) f,
  ) {
    final $$CodeSnippetsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codeSnippetsTable,
      getReferencedColumn: (t) => t.problemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodeSnippetsTableTableFilterComposer(
            $db: $db,
            $table: $db.codeSnippetsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> submissionsTableRefs(
    Expression<bool> Function($$SubmissionsTableTableFilterComposer f) f,
  ) {
    final $$SubmissionsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.submissionsTable,
      getReferencedColumn: (t) => t.problemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubmissionsTableTableFilterComposer(
            $db: $db,
            $table: $db.submissionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProblemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemsTableTable> {
  $$ProblemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frontendId => $composableBuilder(
    column: $table.frontendId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleSlug => $composableBuilder(
    column: $table.titleSlug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get acRate => $composableBuilder(
    column: $table.acRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPaidOnly => $composableBuilder(
    column: $table.isPaidOnly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dislikes => $composableBuilder(
    column: $table.dislikes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryTitle => $composableBuilder(
    column: $table.categoryTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hints => $composableBuilder(
    column: $table.hints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get similarQuestions => $composableBuilder(
    column: $table.similarQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exampleTestcases => $composableBuilder(
    column: $table.exampleTestcases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sampleTestCase => $composableBuilder(
    column: $table.sampleTestCase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stats => $composableBuilder(
    column: $table.stats,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProblemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemsTableTable> {
  $$ProblemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get frontendId => $composableBuilder(
    column: $table.frontendId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get titleSlug =>
      $composableBuilder(column: $table.titleSlug, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<double> get acRate =>
      $composableBuilder(column: $table.acRate, builder: (column) => column);

  GeneratedColumn<bool> get isPaidOnly => $composableBuilder(
    column: $table.isPaidOnly,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get likes =>
      $composableBuilder(column: $table.likes, builder: (column) => column);

  GeneratedColumn<int> get dislikes =>
      $composableBuilder(column: $table.dislikes, builder: (column) => column);

  GeneratedColumn<String> get categoryTitle => $composableBuilder(
    column: $table.categoryTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hints =>
      $composableBuilder(column: $table.hints, builder: (column) => column);

  GeneratedColumn<String> get similarQuestions => $composableBuilder(
    column: $table.similarQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exampleTestcases => $composableBuilder(
    column: $table.exampleTestcases,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sampleTestCase => $composableBuilder(
    column: $table.sampleTestCase,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stats =>
      $composableBuilder(column: $table.stats, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> problemTopicTagsTableRefs<T extends Object>(
    Expression<T> Function($$ProblemTopicTagsTableTableAnnotationComposer a) f,
  ) {
    final $$ProblemTopicTagsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.problemTopicTagsTable,
          getReferencedColumn: (t) => t.problemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProblemTopicTagsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.problemTopicTagsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> codeSnippetsTableRefs<T extends Object>(
    Expression<T> Function($$CodeSnippetsTableTableAnnotationComposer a) f,
  ) {
    final $$CodeSnippetsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.codeSnippetsTable,
          getReferencedColumn: (t) => t.problemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CodeSnippetsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.codeSnippetsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> submissionsTableRefs<T extends Object>(
    Expression<T> Function($$SubmissionsTableTableAnnotationComposer a) f,
  ) {
    final $$SubmissionsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.submissionsTable,
      getReferencedColumn: (t) => t.problemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubmissionsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.submissionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProblemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemsTableTable,
          ProblemsTableData,
          $$ProblemsTableTableFilterComposer,
          $$ProblemsTableTableOrderingComposer,
          $$ProblemsTableTableAnnotationComposer,
          $$ProblemsTableTableCreateCompanionBuilder,
          $$ProblemsTableTableUpdateCompanionBuilder,
          (ProblemsTableData, $$ProblemsTableTableReferences),
          ProblemsTableData,
          PrefetchHooks Function({
            bool problemTopicTagsTableRefs,
            bool codeSnippetsTableRefs,
            bool submissionsTableRefs,
          })
        > {
  $$ProblemsTableTableTableManager(_$AppDatabase db, $ProblemsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProblemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProblemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> frontendId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> titleSlug = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<double> acRate = const Value.absent(),
                Value<bool> isPaidOnly = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> likes = const Value.absent(),
                Value<int> dislikes = const Value.absent(),
                Value<String> categoryTitle = const Value.absent(),
                Value<String?> hints = const Value.absent(),
                Value<String?> similarQuestions = const Value.absent(),
                Value<String?> exampleTestcases = const Value.absent(),
                Value<String?> sampleTestCase = const Value.absent(),
                Value<String?> stats = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime?> lastSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProblemsTableCompanion(
                id: id,
                frontendId: frontendId,
                title: title,
                titleSlug: titleSlug,
                content: content,
                difficulty: difficulty,
                acRate: acRate,
                isPaidOnly: isPaidOnly,
                status: status,
                likes: likes,
                dislikes: dislikes,
                categoryTitle: categoryTitle,
                hints: hints,
                similarQuestions: similarQuestions,
                exampleTestcases: exampleTestcases,
                sampleTestCase: sampleTestCase,
                stats: stats,
                isFavorite: isFavorite,
                lastSynced: lastSynced,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String frontendId,
                required String title,
                required String titleSlug,
                Value<String?> content = const Value.absent(),
                required String difficulty,
                Value<double> acRate = const Value.absent(),
                Value<bool> isPaidOnly = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> likes = const Value.absent(),
                Value<int> dislikes = const Value.absent(),
                Value<String> categoryTitle = const Value.absent(),
                Value<String?> hints = const Value.absent(),
                Value<String?> similarQuestions = const Value.absent(),
                Value<String?> exampleTestcases = const Value.absent(),
                Value<String?> sampleTestCase = const Value.absent(),
                Value<String?> stats = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime?> lastSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProblemsTableCompanion.insert(
                id: id,
                frontendId: frontendId,
                title: title,
                titleSlug: titleSlug,
                content: content,
                difficulty: difficulty,
                acRate: acRate,
                isPaidOnly: isPaidOnly,
                status: status,
                likes: likes,
                dislikes: dislikes,
                categoryTitle: categoryTitle,
                hints: hints,
                similarQuestions: similarQuestions,
                exampleTestcases: exampleTestcases,
                sampleTestCase: sampleTestCase,
                stats: stats,
                isFavorite: isFavorite,
                lastSynced: lastSynced,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProblemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                problemTopicTagsTableRefs = false,
                codeSnippetsTableRefs = false,
                submissionsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (problemTopicTagsTableRefs) db.problemTopicTagsTable,
                    if (codeSnippetsTableRefs) db.codeSnippetsTable,
                    if (submissionsTableRefs) db.submissionsTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (problemTopicTagsTableRefs)
                        await $_getPrefetchedData<
                          ProblemsTableData,
                          $ProblemsTableTable,
                          ProblemTopicTagsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ProblemsTableTableReferences
                              ._problemTopicTagsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProblemsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).problemTopicTagsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.problemId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (codeSnippetsTableRefs)
                        await $_getPrefetchedData<
                          ProblemsTableData,
                          $ProblemsTableTable,
                          CodeSnippetsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ProblemsTableTableReferences
                              ._codeSnippetsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProblemsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).codeSnippetsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.problemId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (submissionsTableRefs)
                        await $_getPrefetchedData<
                          ProblemsTableData,
                          $ProblemsTableTable,
                          SubmissionsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ProblemsTableTableReferences
                              ._submissionsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProblemsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).submissionsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.problemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProblemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemsTableTable,
      ProblemsTableData,
      $$ProblemsTableTableFilterComposer,
      $$ProblemsTableTableOrderingComposer,
      $$ProblemsTableTableAnnotationComposer,
      $$ProblemsTableTableCreateCompanionBuilder,
      $$ProblemsTableTableUpdateCompanionBuilder,
      (ProblemsTableData, $$ProblemsTableTableReferences),
      ProblemsTableData,
      PrefetchHooks Function({
        bool problemTopicTagsTableRefs,
        bool codeSnippetsTableRefs,
        bool submissionsTableRefs,
      })
    >;
typedef $$TopicTagsTableTableCreateCompanionBuilder =
    TopicTagsTableCompanion Function({
      required String id,
      required String name,
      required String slug,
      Value<int> rowid,
    });
typedef $$TopicTagsTableTableUpdateCompanionBuilder =
    TopicTagsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> slug,
      Value<int> rowid,
    });

final class $$TopicTagsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TopicTagsTableTable,
          TopicTagsTableData
        > {
  $$TopicTagsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ProblemTopicTagsTableTable,
    List<ProblemTopicTagsTableData>
  >
  _problemTopicTagsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.problemTopicTagsTable,
        aliasName: $_aliasNameGenerator(
          db.topicTagsTable.id,
          db.problemTopicTagsTable.tagId,
        ),
      );

  $$ProblemTopicTagsTableTableProcessedTableManager
  get problemTopicTagsTableRefs {
    final manager = $$ProblemTopicTagsTableTableTableManager(
      $_db,
      $_db.problemTopicTagsTable,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _problemTopicTagsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TopicTagsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TopicTagsTableTable> {
  $$TopicTagsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> problemTopicTagsTableRefs(
    Expression<bool> Function($$ProblemTopicTagsTableTableFilterComposer f) f,
  ) {
    final $$ProblemTopicTagsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.problemTopicTagsTable,
          getReferencedColumn: (t) => t.tagId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProblemTopicTagsTableTableFilterComposer(
                $db: $db,
                $table: $db.problemTopicTagsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TopicTagsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicTagsTableTable> {
  $$TopicTagsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TopicTagsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicTagsTableTable> {
  $$TopicTagsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  Expression<T> problemTopicTagsTableRefs<T extends Object>(
    Expression<T> Function($$ProblemTopicTagsTableTableAnnotationComposer a) f,
  ) {
    final $$ProblemTopicTagsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.problemTopicTagsTable,
          getReferencedColumn: (t) => t.tagId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProblemTopicTagsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.problemTopicTagsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TopicTagsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicTagsTableTable,
          TopicTagsTableData,
          $$TopicTagsTableTableFilterComposer,
          $$TopicTagsTableTableOrderingComposer,
          $$TopicTagsTableTableAnnotationComposer,
          $$TopicTagsTableTableCreateCompanionBuilder,
          $$TopicTagsTableTableUpdateCompanionBuilder,
          (TopicTagsTableData, $$TopicTagsTableTableReferences),
          TopicTagsTableData,
          PrefetchHooks Function({bool problemTopicTagsTableRefs})
        > {
  $$TopicTagsTableTableTableManager(
    _$AppDatabase db,
    $TopicTagsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicTagsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicTagsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicTagsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicTagsTableCompanion(
                id: id,
                name: name,
                slug: slug,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String slug,
                Value<int> rowid = const Value.absent(),
              }) => TopicTagsTableCompanion.insert(
                id: id,
                name: name,
                slug: slug,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TopicTagsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({problemTopicTagsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (problemTopicTagsTableRefs) db.problemTopicTagsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (problemTopicTagsTableRefs)
                    await $_getPrefetchedData<
                      TopicTagsTableData,
                      $TopicTagsTableTable,
                      ProblemTopicTagsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$TopicTagsTableTableReferences
                          ._problemTopicTagsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TopicTagsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).problemTopicTagsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TopicTagsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicTagsTableTable,
      TopicTagsTableData,
      $$TopicTagsTableTableFilterComposer,
      $$TopicTagsTableTableOrderingComposer,
      $$TopicTagsTableTableAnnotationComposer,
      $$TopicTagsTableTableCreateCompanionBuilder,
      $$TopicTagsTableTableUpdateCompanionBuilder,
      (TopicTagsTableData, $$TopicTagsTableTableReferences),
      TopicTagsTableData,
      PrefetchHooks Function({bool problemTopicTagsTableRefs})
    >;
typedef $$ProblemTopicTagsTableTableCreateCompanionBuilder =
    ProblemTopicTagsTableCompanion Function({
      required int problemId,
      required String tagId,
      Value<int> rowid,
    });
typedef $$ProblemTopicTagsTableTableUpdateCompanionBuilder =
    ProblemTopicTagsTableCompanion Function({
      Value<int> problemId,
      Value<String> tagId,
      Value<int> rowid,
    });

final class $$ProblemTopicTagsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProblemTopicTagsTableTable,
          ProblemTopicTagsTableData
        > {
  $$ProblemTopicTagsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProblemsTableTable _problemIdTable(_$AppDatabase db) =>
      db.problemsTable.createAlias(
        $_aliasNameGenerator(
          db.problemTopicTagsTable.problemId,
          db.problemsTable.id,
        ),
      );

  $$ProblemsTableTableProcessedTableManager get problemId {
    final $_column = $_itemColumn<int>('problem_id')!;

    final manager = $$ProblemsTableTableTableManager(
      $_db,
      $_db.problemsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_problemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TopicTagsTableTable _tagIdTable(_$AppDatabase db) =>
      db.topicTagsTable.createAlias(
        $_aliasNameGenerator(
          db.problemTopicTagsTable.tagId,
          db.topicTagsTable.id,
        ),
      );

  $$TopicTagsTableTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$TopicTagsTableTableTableManager(
      $_db,
      $_db.topicTagsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProblemTopicTagsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemTopicTagsTableTable> {
  $$ProblemTopicTagsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProblemsTableTableFilterComposer get problemId {
    final $$ProblemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableFilterComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TopicTagsTableTableFilterComposer get tagId {
    final $$TopicTagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.topicTagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicTagsTableTableFilterComposer(
            $db: $db,
            $table: $db.topicTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemTopicTagsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemTopicTagsTableTable> {
  $$ProblemTopicTagsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProblemsTableTableOrderingComposer get problemId {
    final $$ProblemsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableOrderingComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TopicTagsTableTableOrderingComposer get tagId {
    final $$TopicTagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.topicTagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicTagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.topicTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemTopicTagsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemTopicTagsTableTable> {
  $$ProblemTopicTagsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProblemsTableTableAnnotationComposer get problemId {
    final $$ProblemsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TopicTagsTableTableAnnotationComposer get tagId {
    final $$TopicTagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.topicTagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicTagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.topicTagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProblemTopicTagsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemTopicTagsTableTable,
          ProblemTopicTagsTableData,
          $$ProblemTopicTagsTableTableFilterComposer,
          $$ProblemTopicTagsTableTableOrderingComposer,
          $$ProblemTopicTagsTableTableAnnotationComposer,
          $$ProblemTopicTagsTableTableCreateCompanionBuilder,
          $$ProblemTopicTagsTableTableUpdateCompanionBuilder,
          (ProblemTopicTagsTableData, $$ProblemTopicTagsTableTableReferences),
          ProblemTopicTagsTableData,
          PrefetchHooks Function({bool problemId, bool tagId})
        > {
  $$ProblemTopicTagsTableTableTableManager(
    _$AppDatabase db,
    $ProblemTopicTagsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemTopicTagsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ProblemTopicTagsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProblemTopicTagsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> problemId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProblemTopicTagsTableCompanion(
                problemId: problemId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int problemId,
                required String tagId,
                Value<int> rowid = const Value.absent(),
              }) => ProblemTopicTagsTableCompanion.insert(
                problemId: problemId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProblemTopicTagsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({problemId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (problemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.problemId,
                                referencedTable:
                                    $$ProblemTopicTagsTableTableReferences
                                        ._problemIdTable(db),
                                referencedColumn:
                                    $$ProblemTopicTagsTableTableReferences
                                        ._problemIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable:
                                    $$ProblemTopicTagsTableTableReferences
                                        ._tagIdTable(db),
                                referencedColumn:
                                    $$ProblemTopicTagsTableTableReferences
                                        ._tagIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProblemTopicTagsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemTopicTagsTableTable,
      ProblemTopicTagsTableData,
      $$ProblemTopicTagsTableTableFilterComposer,
      $$ProblemTopicTagsTableTableOrderingComposer,
      $$ProblemTopicTagsTableTableAnnotationComposer,
      $$ProblemTopicTagsTableTableCreateCompanionBuilder,
      $$ProblemTopicTagsTableTableUpdateCompanionBuilder,
      (ProblemTopicTagsTableData, $$ProblemTopicTagsTableTableReferences),
      ProblemTopicTagsTableData,
      PrefetchHooks Function({bool problemId, bool tagId})
    >;
typedef $$CodeSnippetsTableTableCreateCompanionBuilder =
    CodeSnippetsTableCompanion Function({
      Value<int> id,
      required int problemId,
      required String lang,
      required String langSlug,
      required String code,
    });
typedef $$CodeSnippetsTableTableUpdateCompanionBuilder =
    CodeSnippetsTableCompanion Function({
      Value<int> id,
      Value<int> problemId,
      Value<String> lang,
      Value<String> langSlug,
      Value<String> code,
    });

final class $$CodeSnippetsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CodeSnippetsTableTable,
          CodeSnippetsTableData
        > {
  $$CodeSnippetsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProblemsTableTable _problemIdTable(_$AppDatabase db) =>
      db.problemsTable.createAlias(
        $_aliasNameGenerator(
          db.codeSnippetsTable.problemId,
          db.problemsTable.id,
        ),
      );

  $$ProblemsTableTableProcessedTableManager get problemId {
    final $_column = $_itemColumn<int>('problem_id')!;

    final manager = $$ProblemsTableTableTableManager(
      $_db,
      $_db.problemsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_problemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CodeSnippetsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CodeSnippetsTableTable> {
  $$CodeSnippetsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get langSlug => $composableBuilder(
    column: $table.langSlug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  $$ProblemsTableTableFilterComposer get problemId {
    final $$ProblemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableFilterComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodeSnippetsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CodeSnippetsTableTable> {
  $$CodeSnippetsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get langSlug => $composableBuilder(
    column: $table.langSlug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProblemsTableTableOrderingComposer get problemId {
    final $$ProblemsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableOrderingComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodeSnippetsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CodeSnippetsTableTable> {
  $$CodeSnippetsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lang =>
      $composableBuilder(column: $table.lang, builder: (column) => column);

  GeneratedColumn<String> get langSlug =>
      $composableBuilder(column: $table.langSlug, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  $$ProblemsTableTableAnnotationComposer get problemId {
    final $$ProblemsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodeSnippetsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CodeSnippetsTableTable,
          CodeSnippetsTableData,
          $$CodeSnippetsTableTableFilterComposer,
          $$CodeSnippetsTableTableOrderingComposer,
          $$CodeSnippetsTableTableAnnotationComposer,
          $$CodeSnippetsTableTableCreateCompanionBuilder,
          $$CodeSnippetsTableTableUpdateCompanionBuilder,
          (CodeSnippetsTableData, $$CodeSnippetsTableTableReferences),
          CodeSnippetsTableData,
          PrefetchHooks Function({bool problemId})
        > {
  $$CodeSnippetsTableTableTableManager(
    _$AppDatabase db,
    $CodeSnippetsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CodeSnippetsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CodeSnippetsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CodeSnippetsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> problemId = const Value.absent(),
                Value<String> lang = const Value.absent(),
                Value<String> langSlug = const Value.absent(),
                Value<String> code = const Value.absent(),
              }) => CodeSnippetsTableCompanion(
                id: id,
                problemId: problemId,
                lang: lang,
                langSlug: langSlug,
                code: code,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int problemId,
                required String lang,
                required String langSlug,
                required String code,
              }) => CodeSnippetsTableCompanion.insert(
                id: id,
                problemId: problemId,
                lang: lang,
                langSlug: langSlug,
                code: code,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CodeSnippetsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({problemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (problemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.problemId,
                                referencedTable:
                                    $$CodeSnippetsTableTableReferences
                                        ._problemIdTable(db),
                                referencedColumn:
                                    $$CodeSnippetsTableTableReferences
                                        ._problemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CodeSnippetsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CodeSnippetsTableTable,
      CodeSnippetsTableData,
      $$CodeSnippetsTableTableFilterComposer,
      $$CodeSnippetsTableTableOrderingComposer,
      $$CodeSnippetsTableTableAnnotationComposer,
      $$CodeSnippetsTableTableCreateCompanionBuilder,
      $$CodeSnippetsTableTableUpdateCompanionBuilder,
      (CodeSnippetsTableData, $$CodeSnippetsTableTableReferences),
      CodeSnippetsTableData,
      PrefetchHooks Function({bool problemId})
    >;
typedef $$SubmissionsTableTableCreateCompanionBuilder =
    SubmissionsTableCompanion Function({
      Value<int> id,
      required int problemId,
      required String titleSlug,
      required String title,
      required String lang,
      required String code,
      required String statusDisplay,
      Value<int?> statusCode,
      Value<String?> runtime,
      Value<double?> runtimePercentile,
      Value<String?> memory,
      Value<double?> memoryPercentile,
      Value<int?> totalCorrect,
      Value<int?> totalTestcases,
      required int timestamp,
      Value<DateTime> createdAt,
    });
typedef $$SubmissionsTableTableUpdateCompanionBuilder =
    SubmissionsTableCompanion Function({
      Value<int> id,
      Value<int> problemId,
      Value<String> titleSlug,
      Value<String> title,
      Value<String> lang,
      Value<String> code,
      Value<String> statusDisplay,
      Value<int?> statusCode,
      Value<String?> runtime,
      Value<double?> runtimePercentile,
      Value<String?> memory,
      Value<double?> memoryPercentile,
      Value<int?> totalCorrect,
      Value<int?> totalTestcases,
      Value<int> timestamp,
      Value<DateTime> createdAt,
    });

final class $$SubmissionsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SubmissionsTableTable,
          SubmissionsTableData
        > {
  $$SubmissionsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProblemsTableTable _problemIdTable(_$AppDatabase db) =>
      db.problemsTable.createAlias(
        $_aliasNameGenerator(
          db.submissionsTable.problemId,
          db.problemsTable.id,
        ),
      );

  $$ProblemsTableTableProcessedTableManager get problemId {
    final $_column = $_itemColumn<int>('problem_id')!;

    final manager = $$ProblemsTableTableTableManager(
      $_db,
      $_db.problemsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_problemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SubmissionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SubmissionsTableTable> {
  $$SubmissionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleSlug => $composableBuilder(
    column: $table.titleSlug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusDisplay => $composableBuilder(
    column: $table.statusDisplay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get runtime => $composableBuilder(
    column: $table.runtime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get runtimePercentile => $composableBuilder(
    column: $table.runtimePercentile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memory => $composableBuilder(
    column: $table.memory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get memoryPercentile => $composableBuilder(
    column: $table.memoryPercentile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCorrect => $composableBuilder(
    column: $table.totalCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalTestcases => $composableBuilder(
    column: $table.totalTestcases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProblemsTableTableFilterComposer get problemId {
    final $$ProblemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableFilterComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubmissionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SubmissionsTableTable> {
  $$SubmissionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleSlug => $composableBuilder(
    column: $table.titleSlug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lang => $composableBuilder(
    column: $table.lang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusDisplay => $composableBuilder(
    column: $table.statusDisplay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get runtime => $composableBuilder(
    column: $table.runtime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get runtimePercentile => $composableBuilder(
    column: $table.runtimePercentile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memory => $composableBuilder(
    column: $table.memory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get memoryPercentile => $composableBuilder(
    column: $table.memoryPercentile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCorrect => $composableBuilder(
    column: $table.totalCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalTestcases => $composableBuilder(
    column: $table.totalTestcases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProblemsTableTableOrderingComposer get problemId {
    final $$ProblemsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableOrderingComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubmissionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubmissionsTableTable> {
  $$SubmissionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titleSlug =>
      $composableBuilder(column: $table.titleSlug, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get lang =>
      $composableBuilder(column: $table.lang, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get statusDisplay => $composableBuilder(
    column: $table.statusDisplay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get runtime =>
      $composableBuilder(column: $table.runtime, builder: (column) => column);

  GeneratedColumn<double> get runtimePercentile => $composableBuilder(
    column: $table.runtimePercentile,
    builder: (column) => column,
  );

  GeneratedColumn<String> get memory =>
      $composableBuilder(column: $table.memory, builder: (column) => column);

  GeneratedColumn<double> get memoryPercentile => $composableBuilder(
    column: $table.memoryPercentile,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCorrect => $composableBuilder(
    column: $table.totalCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalTestcases => $composableBuilder(
    column: $table.totalTestcases,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProblemsTableTableAnnotationComposer get problemId {
    final $$ProblemsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.problemId,
      referencedTable: $db.problemsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProblemsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.problemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubmissionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubmissionsTableTable,
          SubmissionsTableData,
          $$SubmissionsTableTableFilterComposer,
          $$SubmissionsTableTableOrderingComposer,
          $$SubmissionsTableTableAnnotationComposer,
          $$SubmissionsTableTableCreateCompanionBuilder,
          $$SubmissionsTableTableUpdateCompanionBuilder,
          (SubmissionsTableData, $$SubmissionsTableTableReferences),
          SubmissionsTableData,
          PrefetchHooks Function({bool problemId})
        > {
  $$SubmissionsTableTableTableManager(
    _$AppDatabase db,
    $SubmissionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubmissionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubmissionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubmissionsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> problemId = const Value.absent(),
                Value<String> titleSlug = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> lang = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> statusDisplay = const Value.absent(),
                Value<int?> statusCode = const Value.absent(),
                Value<String?> runtime = const Value.absent(),
                Value<double?> runtimePercentile = const Value.absent(),
                Value<String?> memory = const Value.absent(),
                Value<double?> memoryPercentile = const Value.absent(),
                Value<int?> totalCorrect = const Value.absent(),
                Value<int?> totalTestcases = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SubmissionsTableCompanion(
                id: id,
                problemId: problemId,
                titleSlug: titleSlug,
                title: title,
                lang: lang,
                code: code,
                statusDisplay: statusDisplay,
                statusCode: statusCode,
                runtime: runtime,
                runtimePercentile: runtimePercentile,
                memory: memory,
                memoryPercentile: memoryPercentile,
                totalCorrect: totalCorrect,
                totalTestcases: totalTestcases,
                timestamp: timestamp,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int problemId,
                required String titleSlug,
                required String title,
                required String lang,
                required String code,
                required String statusDisplay,
                Value<int?> statusCode = const Value.absent(),
                Value<String?> runtime = const Value.absent(),
                Value<double?> runtimePercentile = const Value.absent(),
                Value<String?> memory = const Value.absent(),
                Value<double?> memoryPercentile = const Value.absent(),
                Value<int?> totalCorrect = const Value.absent(),
                Value<int?> totalTestcases = const Value.absent(),
                required int timestamp,
                Value<DateTime> createdAt = const Value.absent(),
              }) => SubmissionsTableCompanion.insert(
                id: id,
                problemId: problemId,
                titleSlug: titleSlug,
                title: title,
                lang: lang,
                code: code,
                statusDisplay: statusDisplay,
                statusCode: statusCode,
                runtime: runtime,
                runtimePercentile: runtimePercentile,
                memory: memory,
                memoryPercentile: memoryPercentile,
                totalCorrect: totalCorrect,
                totalTestcases: totalTestcases,
                timestamp: timestamp,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubmissionsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({problemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (problemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.problemId,
                                referencedTable:
                                    $$SubmissionsTableTableReferences
                                        ._problemIdTable(db),
                                referencedColumn:
                                    $$SubmissionsTableTableReferences
                                        ._problemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SubmissionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubmissionsTableTable,
      SubmissionsTableData,
      $$SubmissionsTableTableFilterComposer,
      $$SubmissionsTableTableOrderingComposer,
      $$SubmissionsTableTableAnnotationComposer,
      $$SubmissionsTableTableCreateCompanionBuilder,
      $$SubmissionsTableTableUpdateCompanionBuilder,
      (SubmissionsTableData, $$SubmissionsTableTableReferences),
      SubmissionsTableData,
      PrefetchHooks Function({bool problemId})
    >;
typedef $$UserProgressTableTableCreateCompanionBuilder =
    UserProgressTableCompanion Function({
      Value<int> id,
      required String username,
      Value<int> easySolved,
      Value<int> mediumSolved,
      Value<int> hardSolved,
      Value<int> totalSolved,
      Value<int> easyTotal,
      Value<int> mediumTotal,
      Value<int> hardTotal,
      Value<int> totalQuestions,
      Value<int> ranking,
      Value<int> reputation,
      Value<int> streak,
      Value<int> totalActiveDays,
      Value<String?> submissionCalendar,
      Value<DateTime> lastSynced,
    });
typedef $$UserProgressTableTableUpdateCompanionBuilder =
    UserProgressTableCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<int> easySolved,
      Value<int> mediumSolved,
      Value<int> hardSolved,
      Value<int> totalSolved,
      Value<int> easyTotal,
      Value<int> mediumTotal,
      Value<int> hardTotal,
      Value<int> totalQuestions,
      Value<int> ranking,
      Value<int> reputation,
      Value<int> streak,
      Value<int> totalActiveDays,
      Value<String?> submissionCalendar,
      Value<DateTime> lastSynced,
    });

class $$UserProgressTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserProgressTableTable> {
  $$UserProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get easySolved => $composableBuilder(
    column: $table.easySolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mediumSolved => $composableBuilder(
    column: $table.mediumSolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hardSolved => $composableBuilder(
    column: $table.hardSolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSolved => $composableBuilder(
    column: $table.totalSolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get easyTotal => $composableBuilder(
    column: $table.easyTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mediumTotal => $composableBuilder(
    column: $table.mediumTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hardTotal => $composableBuilder(
    column: $table.hardTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ranking => $composableBuilder(
    column: $table.ranking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reputation => $composableBuilder(
    column: $table.reputation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streak => $composableBuilder(
    column: $table.streak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalActiveDays => $composableBuilder(
    column: $table.totalActiveDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get submissionCalendar => $composableBuilder(
    column: $table.submissionCalendar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProgressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProgressTableTable> {
  $$UserProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get easySolved => $composableBuilder(
    column: $table.easySolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mediumSolved => $composableBuilder(
    column: $table.mediumSolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hardSolved => $composableBuilder(
    column: $table.hardSolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSolved => $composableBuilder(
    column: $table.totalSolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get easyTotal => $composableBuilder(
    column: $table.easyTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mediumTotal => $composableBuilder(
    column: $table.mediumTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hardTotal => $composableBuilder(
    column: $table.hardTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ranking => $composableBuilder(
    column: $table.ranking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reputation => $composableBuilder(
    column: $table.reputation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streak => $composableBuilder(
    column: $table.streak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalActiveDays => $composableBuilder(
    column: $table.totalActiveDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get submissionCalendar => $composableBuilder(
    column: $table.submissionCalendar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProgressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProgressTableTable> {
  $$UserProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<int> get easySolved => $composableBuilder(
    column: $table.easySolved,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mediumSolved => $composableBuilder(
    column: $table.mediumSolved,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hardSolved => $composableBuilder(
    column: $table.hardSolved,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSolved => $composableBuilder(
    column: $table.totalSolved,
    builder: (column) => column,
  );

  GeneratedColumn<int> get easyTotal =>
      $composableBuilder(column: $table.easyTotal, builder: (column) => column);

  GeneratedColumn<int> get mediumTotal => $composableBuilder(
    column: $table.mediumTotal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hardTotal =>
      $composableBuilder(column: $table.hardTotal, builder: (column) => column);

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ranking =>
      $composableBuilder(column: $table.ranking, builder: (column) => column);

  GeneratedColumn<int> get reputation => $composableBuilder(
    column: $table.reputation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get streak =>
      $composableBuilder(column: $table.streak, builder: (column) => column);

  GeneratedColumn<int> get totalActiveDays => $composableBuilder(
    column: $table.totalActiveDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get submissionCalendar => $composableBuilder(
    column: $table.submissionCalendar,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => column,
  );
}

class $$UserProgressTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProgressTableTable,
          UserProgressTableData,
          $$UserProgressTableTableFilterComposer,
          $$UserProgressTableTableOrderingComposer,
          $$UserProgressTableTableAnnotationComposer,
          $$UserProgressTableTableCreateCompanionBuilder,
          $$UserProgressTableTableUpdateCompanionBuilder,
          (
            UserProgressTableData,
            BaseReferences<
              _$AppDatabase,
              $UserProgressTableTable,
              UserProgressTableData
            >,
          ),
          UserProgressTableData,
          PrefetchHooks Function()
        > {
  $$UserProgressTableTableTableManager(
    _$AppDatabase db,
    $UserProgressTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProgressTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProgressTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<int> easySolved = const Value.absent(),
                Value<int> mediumSolved = const Value.absent(),
                Value<int> hardSolved = const Value.absent(),
                Value<int> totalSolved = const Value.absent(),
                Value<int> easyTotal = const Value.absent(),
                Value<int> mediumTotal = const Value.absent(),
                Value<int> hardTotal = const Value.absent(),
                Value<int> totalQuestions = const Value.absent(),
                Value<int> ranking = const Value.absent(),
                Value<int> reputation = const Value.absent(),
                Value<int> streak = const Value.absent(),
                Value<int> totalActiveDays = const Value.absent(),
                Value<String?> submissionCalendar = const Value.absent(),
                Value<DateTime> lastSynced = const Value.absent(),
              }) => UserProgressTableCompanion(
                id: id,
                username: username,
                easySolved: easySolved,
                mediumSolved: mediumSolved,
                hardSolved: hardSolved,
                totalSolved: totalSolved,
                easyTotal: easyTotal,
                mediumTotal: mediumTotal,
                hardTotal: hardTotal,
                totalQuestions: totalQuestions,
                ranking: ranking,
                reputation: reputation,
                streak: streak,
                totalActiveDays: totalActiveDays,
                submissionCalendar: submissionCalendar,
                lastSynced: lastSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                Value<int> easySolved = const Value.absent(),
                Value<int> mediumSolved = const Value.absent(),
                Value<int> hardSolved = const Value.absent(),
                Value<int> totalSolved = const Value.absent(),
                Value<int> easyTotal = const Value.absent(),
                Value<int> mediumTotal = const Value.absent(),
                Value<int> hardTotal = const Value.absent(),
                Value<int> totalQuestions = const Value.absent(),
                Value<int> ranking = const Value.absent(),
                Value<int> reputation = const Value.absent(),
                Value<int> streak = const Value.absent(),
                Value<int> totalActiveDays = const Value.absent(),
                Value<String?> submissionCalendar = const Value.absent(),
                Value<DateTime> lastSynced = const Value.absent(),
              }) => UserProgressTableCompanion.insert(
                id: id,
                username: username,
                easySolved: easySolved,
                mediumSolved: mediumSolved,
                hardSolved: hardSolved,
                totalSolved: totalSolved,
                easyTotal: easyTotal,
                mediumTotal: mediumTotal,
                hardTotal: hardTotal,
                totalQuestions: totalQuestions,
                ranking: ranking,
                reputation: reputation,
                streak: streak,
                totalActiveDays: totalActiveDays,
                submissionCalendar: submissionCalendar,
                lastSynced: lastSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProgressTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProgressTableTable,
      UserProgressTableData,
      $$UserProgressTableTableFilterComposer,
      $$UserProgressTableTableOrderingComposer,
      $$UserProgressTableTableAnnotationComposer,
      $$UserProgressTableTableCreateCompanionBuilder,
      $$UserProgressTableTableUpdateCompanionBuilder,
      (
        UserProgressTableData,
        BaseReferences<
          _$AppDatabase,
          $UserProgressTableTable,
          UserProgressTableData
        >,
      ),
      UserProgressTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProblemsTableTableTableManager get problemsTable =>
      $$ProblemsTableTableTableManager(_db, _db.problemsTable);
  $$TopicTagsTableTableTableManager get topicTagsTable =>
      $$TopicTagsTableTableTableManager(_db, _db.topicTagsTable);
  $$ProblemTopicTagsTableTableTableManager get problemTopicTagsTable =>
      $$ProblemTopicTagsTableTableTableManager(_db, _db.problemTopicTagsTable);
  $$CodeSnippetsTableTableTableManager get codeSnippetsTable =>
      $$CodeSnippetsTableTableTableManager(_db, _db.codeSnippetsTable);
  $$SubmissionsTableTableTableManager get submissionsTable =>
      $$SubmissionsTableTableTableManager(_db, _db.submissionsTable);
  $$UserProgressTableTableTableManager get userProgressTable =>
      $$UserProgressTableTableTableManager(_db, _db.userProgressTable);
}
