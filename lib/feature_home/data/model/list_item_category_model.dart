import 'package:competition/feature_home/domain/entity/list_item_category_entity.dart';

class ListItemCategoryModel extends ListItemCategoryEntity{


  ListItemCategoryModel({
    super.id,
    super.mediaType,
    super.imageId,
    super.title,
    super.description,
  });



  factory ListItemCategoryModel.fromJson(Map<String, dynamic> json) => ListItemCategoryModel(
    id: json["id"],
    mediaType: json["mediaType"],
    imageId: json["imageId"],
    title: json["title"],
    description: json["description"],
  );

}