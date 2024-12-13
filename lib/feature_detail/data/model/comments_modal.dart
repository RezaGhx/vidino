
import '../../domin/entity/comments_entity.dart';

class CommentsModal extends CommentsEntity{
  

  CommentsModal({
    super.id,
    super.mediaId,
    super.userId,
    super.text,
    super.userName,
  });



  factory CommentsModal.fromJson(Map<String, dynamic> json) => CommentsModal(
    id: json["id"],
    mediaId: json["mediaId"],
    userId: json["userId"],
    text: json["text"],
    userName: json["userName"],
  );
  
}