import 'package:competition/config/resoureces/my_api.dart';
import 'package:competition/core/network/http_request.dart';
import 'package:competition/core/params/get_pages_param.dart';

import '../../../core/params/profile_param.dart';

abstract class IHomeDatasource {
  Future<dynamic> profileInfo();
  Future<dynamic> categories();
  Future<dynamic> profileUpdate({required ProfileParam param});
  Future<dynamic> medias({required GetPagesParam param});
  Future<dynamic> mediaByID({required String param});
}

class HomeDatasourceImpl implements IHomeDatasource {
  final IHttpRequest _httpRequest;

  const HomeDatasourceImpl(this._httpRequest);

  @override
  Future profileInfo() async {
    return _httpRequest.get(
      path: MyApi.profileMe,

    );
  }

  @override
  Future profileUpdate({required ProfileParam param}) {
    return _httpRequest.put(
      path: MyApi.profileUpdate,
      data: param.toJson

    );
  }

  @override
  Future categories({String? page,String? pageSize}) {
    return _httpRequest.get(
        path: "${MyApi.categories}?Page=${page??1}&PageSize=${pageSize??6}&MediaType=Video",


    );
  }

  @override
  Future medias({required GetPagesParam param}) {
    return _httpRequest.get(
      path: "${MyApi.medias}?Page=${param.page??1}&PageSize=${param.pageSize??5}&MediaType=Video&category=${param.category}",
    );
  }

  @override
  Future mediaByID({required String param}) {
    return _httpRequest.get(
      path: "${MyApi.mediaID}$param",
    );
  }
}
