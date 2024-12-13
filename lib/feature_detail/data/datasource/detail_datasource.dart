import 'package:competition/config/resoureces/my_api.dart';
import 'package:competition/core/network/http_request.dart';
import 'package:competition/core/params/comments_param.dart';

abstract class IDetailDatasource {
  Future<dynamic> mediaSuggest({required String param});
  Future<dynamic> comments({required String param});
  Future<dynamic> commentsSummary({required String param});
  Future<dynamic> commentsSend({required CommentsParam param});
  Future<dynamic> like({required String param});
  Future<dynamic> dislike({required String param});
}

class DetailDatasourceImpl implements IDetailDatasource {
  final IHttpRequest _httpRequest;

  const DetailDatasourceImpl(this._httpRequest);

  @override
  Future mediaSuggest({required String param}) {
    return _httpRequest.get(
      path: "${MyApi.mediaID}$param/suggests",
    );
  }

  @override
  Future comments({required String param}) {
    return _httpRequest.get(
      path: "${MyApi.mediaID}$param/comments?Page=1&PageSize=100",
    );
  }

  @override
  Future commentsSend({required CommentsParam param}) {
    return _httpRequest.post(
      path: "${MyApi.mediaID}${param.id}/comments",
      data: param.toJson
    );
  }

  @override
  Future commentsSummary({required String param}) {
    return _httpRequest.get(
      path: "${MyApi.mediaID}$param/comments/overall",
    );
  }

  @override
  Future dislike({required String param}) {
    return _httpRequest.put(
      path: "${MyApi.mediaID}$param/dislike",
    );
  }

  @override
  Future like({required String param}) {
    return _httpRequest.put(
      path: "${MyApi.mediaID}$param/like",
    );
  }
}
