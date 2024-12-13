class CommentsParam {
  final String? id;
  final String? mediaId;
  final String? userId;
  final String? text;

  CommentsParam({
    this.id,
    this.mediaId,
    this.userId,
    this.text,
  });

  CommentsParam copyWith({
    String? id,
    String? mediaId,
    String? userId,
    String? text,
  }) =>
      CommentsParam(
        id: id ?? this.id,
        mediaId: mediaId ?? this.mediaId,
        userId: userId ?? this.userId,
        text: text ?? this.text,
      );

  factory CommentsParam.fromJson(Map<String, dynamic> json) => CommentsParam(
    mediaId: json["mediaId"],
    text: json["text"],
  );

  Map<String, dynamic> get toJson => {
    "mediaId": mediaId,
    "text": text,
  };
}