class MediaSuggestEntity {
  final String? id;
  final String? mediaType;
  final String? categoryId;
  final String? mediaUrl;
  final String? imageUrl;
  final String? coverUrl;
  final String? title;
  final String? description;
  final int? likes;
  final int? disLikes;
  final int? score;

  MediaSuggestEntity({
    this.id,
    this.mediaType,
    this.categoryId,
    this.mediaUrl,
    this.imageUrl,
    this.coverUrl,
    this.title,
    this.description,
    this.likes,
    this.disLikes,
    this.score,
  });

  MediaSuggestEntity copyWith({
    String? id,
    String? mediaType,
    String? categoryId,
    String? mediaUrl,
    String? imageUrl,
    String? coverUrl,
    String? title,
    String? description,
    int? likes,
    int? disLikes,
    int? score,
  }) =>
      MediaSuggestEntity(
        id: id ?? this.id,
        mediaType: mediaType ?? this.mediaType,
        categoryId: categoryId ?? this.categoryId,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        coverUrl: coverUrl ?? this.coverUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        disLikes: disLikes ?? this.disLikes,
        score: score ?? this.score,
      );

}