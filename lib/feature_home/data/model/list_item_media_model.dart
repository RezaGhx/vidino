import 'package:competition/feature_home/domain/entity/list_item_category_entity.dart';

import '../../domain/entity/list_item_media_entity.dart';

class ListItemMediaModel extends ListItemMediaEntity{


  ListItemMediaModel({
    super.id,
    super.categoryId,
    super.country,
    super.disLikes,
    super.coverId,
    super.mediaUrl,
    super.likes,
    super.minAge,
    super.year,
    super.mediaType,
    super.imageId,
    super.title,
    super.description,
  });



  factory ListItemMediaModel.fromJson(Map<String, dynamic> json) => ListItemMediaModel(
    id: json["id"],
    mediaType: json["mediaType"],
    categoryId: json["categoryId"],
    mediaUrl: json["mediaUrl"],
    imageId: json["imageId"],
    coverId: json["coverId"],
    title: json["title"],
    description: json["description"],
    likes: json["likes"],
    disLikes: json["disLikes"],
    year: json["year"],
    country: json["country"],
    minAge: json["minAge"],
  );

}