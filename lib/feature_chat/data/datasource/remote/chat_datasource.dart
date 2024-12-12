import 'package:competition/core/network/http_request.dart';
import '../../../../../config/constants/constans.dart';
import '../../../../../config/resoureces/my_api.dart';
import '../../../../../core/params/chat_param.dart';
abstract class IChatDatasource {
  Future<dynamic> chatGpt3Turbo({required List<ChatParam> param});

}

class ChatDatasourceImpl implements IChatDatasource {
  final IHttpRequest _httpRequest;

  const ChatDatasourceImpl(this._httpRequest);



  @override
  Future chatGpt3Turbo({required List<ChatParam> param}) {
    final List<Map<String, dynamic>> jsonData = param.map((e) => e.toJson).toList();

    return _httpRequest.post(
      path: MyApi.chatGpt3Turbo,
      data: jsonData,
      header: {
        'one-api-token': MyConstants.token,
      }
    );
  }


}
