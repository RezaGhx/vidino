
class CommentsEntity {
  final String? id;
  final String? mediaId;
  final String? userId;
  final String? text;
  final String? userName;

  CommentsEntity({
    this.id,
    this.mediaId,
    this.userId,
    this.text,
    this.userName,
  });

  CommentsEntity copyWith({
    String? id,
    String? mediaId,
    String? userId,
    String? text,
    String? userName,
  }) =>
      CommentsEntity(
        id: id ?? this.id,
        mediaId: mediaId ?? this.mediaId,
        userId: userId ?? this.userId,
        text: text ?? this.text,
        userName: userName ?? this.userName,
      );
}