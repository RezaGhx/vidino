import 'package:competition/config/resoureces/my_api.dart';
import 'package:competition/core/network/http_request.dart';

abstract class ILoginDatasource {
  Future<dynamic> login({required String phone});
}

class LoginDatasourceImpl implements ILoginDatasource {
  final IHttpRequest _httpRequest;

  const LoginDatasourceImpl(this._httpRequest);

  @override
  Future login({required String phone}) async {
    return _httpRequest.post(
      path: MyApi.sendOTP,
      data: {
        "phoneNumber": phone,
      },
    );
  }
}
