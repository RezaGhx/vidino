import 'package:competition/config/resoureces/my_api.dart';
import 'package:competition/core/network/http_request.dart';
import 'package:competition/core/params/verify_param.dart';

abstract class IVerifyCodeDatasource {
  Future<dynamic> verifyCode({required VerifyParam param});
}

class VerifyCodeDatasourceImpl implements IVerifyCodeDatasource {
  final IHttpRequest _httpRequest;

  const VerifyCodeDatasourceImpl(this._httpRequest);

  @override
  Future verifyCode({required VerifyParam param}) async {
    return await _httpRequest.post(
      path: MyApi.verifyCode,
      data: param.toJson,
    );
  }
}
