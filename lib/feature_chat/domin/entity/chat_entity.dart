class ChatEntity {
  final String? role;
  final String? content;

  ChatEntity({
    this.role,
    this.content,
  });

  ChatEntity copyWith({
    String? role,
    String? content,
  }) =>
      ChatEntity(
        role: role ?? this.role,
        content: content ?? this.content,
      );
}