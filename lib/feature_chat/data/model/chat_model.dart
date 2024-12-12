import '../../domin/entity/chat_entity.dart';

class ChatModel extends ChatEntity {

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    role: json["role"],
    content: json["content"],
  );

  ChatModel({
    super.role,
    super.content,
  });

  Map<String, dynamic>  toJson() => {
    "role": role,
    "content": content,
  };
}