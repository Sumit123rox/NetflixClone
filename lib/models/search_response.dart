// Main response model
class SearchResponse {
  final int page;
  final List<MediaItem> results;
  final int totalPages;
  final int totalResults;

  SearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    print('Parsing MediaResponse: $json'); // Debug print
    return SearchResponse(
      page: json['page'] as int? ?? 0,
      results: (json['results'] as List<dynamic>?)
          ?.map((item) => MediaItem.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((item) => item.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

// Media item model for individual results
class MediaItem {
  final String? backdropPath;
  final int id;
  final String? _title; // Private raw title
  final String? _originalTitle; // Private raw original title
  final String? _name; // Private raw name (TV)
  final String? _originalName; // Private raw original name (TV)
  final String? overview;
  final String? posterPath;
  final String mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? firstAirDate;
  final List<String>? originCountry;

  // Computed properties to handle both movie and TV titles
  String? get title => _title ?? _name; // Fallback to name if title is null
  String? get originalTitle => _originalTitle ?? _originalName; // Fallback to original_name

  MediaItem({
    this.backdropPath,
    required this.id,
    String? title,
    String? originalTitle,
    String? name,
    String? originalName,
    this.overview,
    this.posterPath,
    required this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.firstAirDate,
    this.originCountry,
  })  : _title = title,
        _originalTitle = originalTitle,
        _name = name,
        _originalName = originalName;

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    print('Parsing MediaItem: $json'); // Debug print to see raw JSON
    return MediaItem(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int? ?? 0,
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String? ?? 'unknown',
      adult: json['adult'] as bool?,
      originalLanguage: json['original_language'] as String?,
      genreIds: json['genre_ids'] != null
          ? (json['genre_ids'] as List<dynamic>).cast<int>()
          : null,
      popularity: (json['popularity'] as num?)?.toDouble(),
      releaseDate: json['release_date'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      firstAirDate: json['first_air_date'] as String?,
      originCountry: json['origin_country'] != null
          ? (json['origin_country'] as List<dynamic>).cast<String>()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': _title,
      'original_title': _originalTitle,
      'name': _name,
      'original_name': _originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'first_air_date': firstAirDate,
      'origin_country': originCountry,
    };
  }
}