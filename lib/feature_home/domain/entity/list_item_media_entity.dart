class ListItemMediaEntity {
  final String? id;
  final String? mediaType;
  final String? categoryId;
  final String? mediaUrl;
  final String? imageId;
  final String? coverId;
  final String? title;
  final String? description;
  final int? likes;
  final int? disLikes;
  final int? year;
  final String? country;
  final int? minAge;

  ListItemMediaEntity({
    this.id,
    this.mediaType,
    this.categoryId,
    this.mediaUrl,
    this.imageId,
    this.coverId,
    this.title,
    this.description,
    this.likes,
    this.disLikes,
    this.year,
    this.country,
    this.minAge,
  });

  ListItemMediaEntity copyWith({
    String? id,
    String? mediaType,
    String? categoryId,
    String? mediaUrl,
    String? imageId,
    String? coverId,
    String? title,
    String? description,
    int? likes,
    int? disLikes,
    int? year,
    String? country,
    int? minAge,
  }) =>
      ListItemMediaEntity(
        id: id ?? this.id,
        mediaType: mediaType ?? this.mediaType,
        categoryId: categoryId ?? this.categoryId,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        imageId: imageId ?? this.imageId,
        coverId: coverId ?? this.coverId,
        title: title ?? this.title,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        disLikes: disLikes ?? this.disLikes,
        year: year ?? this.year,
        country: country ?? this.country,
        minAge: minAge ?? this.minAge,
      );



}