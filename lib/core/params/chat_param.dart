class ChatParam {
  final String? role;
  final String? content;

  ChatParam({
    this.role,
    this.content,
  });

  ChatParam copyWith({
    String? role,
    String? content,
  }) =>
      ChatParam(
        role: role ?? this.role,
        content: content ?? this.content,
      );

  Map<String, dynamic> get toJson => {
    "role": role,
    "content": content,
  };
}