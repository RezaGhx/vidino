import 'list_item_media_entity.dart';

class ListItemCategoryEntity {
  final String? id;
  final String? mediaType;
  final dynamic imageId;
  final String? title;
  final String? description;
  List<ListItemMediaEntity>? list;
  ListItemCategoryEntity({
    this.id,
    this.mediaType,
    this.imageId,
    this.title,
    this.description,
    this.list,
  });

  ListItemCategoryEntity copyWith({
    String? id,
    String? mediaType,
    dynamic imageId,
    String? title,
    String? description,
    List<ListItemMediaEntity>? list,
  }) =>
      ListItemCategoryEntity(
        id: id ?? this.id,
        mediaType: mediaType ?? this.mediaType,
        imageId: imageId ?? this.imageId,
        title: title ?? this.title,
        description: description ?? this.description,
        list: list ?? this.list,
      );

}