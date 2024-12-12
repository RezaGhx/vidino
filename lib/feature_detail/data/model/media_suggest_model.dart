import '../../domin/entity/media_suggest_entity.dart';

class MediaSuggestModel extends MediaSuggestEntity{

  MediaSuggestModel({
    super.id,
    super.mediaType,
    super.categoryId,
    super.mediaUrl,
    super.imageUrl,
    super.coverUrl,
    super.title,
    super.description,
    super.likes,
    super.disLikes,
    super.score,
  });

  

  factory MediaSuggestModel.fromJson(Map<String, dynamic> json) => MediaSuggestModel(
    id: json["id"],
    mediaType: json["mediaType"],
    categoryId: json["categoryId"],
    mediaUrl: json["mediaUrl"],
    imageUrl: json["imageUrl"],
    coverUrl: json["coverUrl"],
    title: json["title"],
    description: json["description"],
    likes: json["likes"],
    disLikes: json["disLikes"],
    score: json["score"],
  );

 
}