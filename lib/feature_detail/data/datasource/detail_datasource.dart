import 'package:competition/config/resoureces/my_api.dart';
import 'package:competition/core/network/http_request.dart';

abstract class IDetailDatasource {
  Future<dynamic> mediaSuggest({required String param});
  Future<dynamic> comments({required String param});
}

class DetailDatasourceImpl implements IDetailDatasource {
  final IHttpRequest _httpRequest;

  const DetailDatasourceImpl(this._httpRequest);

  @override
  Future mediaSuggest({required String param}) {
    return _httpRequest.get(
      path: "${MyApi.categoriesID}$param/suggests",
    );
  }

  @override
  Future comments({required String param}) {
    return _httpRequest.get(
      path: "${MyApi.categoriesID}$param/comments",
    );
  }
}
