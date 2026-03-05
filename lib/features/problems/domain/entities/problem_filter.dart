import 'package:equatable/equatable.dart';

class ProblemFilter extends Equatable {
  const ProblemFilter({
    this.difficulty,
    this.status,
    this.searchQuery,
    this.tagSlugs,
    this.isFavorite = false,
    this.page = 0,
    this.pageSize = 50,
  });

  final String? difficulty;
  final String? status;
  final String? searchQuery;
  final List<String>? tagSlugs;
  final bool isFavorite;
  final int page;
  final int pageSize;

  ProblemFilter copyWith({
    String? Function()? difficulty,
    String? Function()? status,
    String? Function()? searchQuery,
    List<String>? Function()? tagSlugs,
    bool? isFavorite,
    int? page,
    int? pageSize,
  }) {
    return ProblemFilter(
      difficulty: difficulty != null ? difficulty() : this.difficulty,
      status: status != null ? status() : this.status,
      searchQuery: searchQuery != null ? searchQuery() : this.searchQuery,
      tagSlugs: tagSlugs != null ? tagSlugs() : this.tagSlugs,
      isFavorite: isFavorite ?? this.isFavorite,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [
    difficulty,
    status,
    searchQuery,
    tagSlugs,
    isFavorite,
    page,
    pageSize,
  ];
}
