import 'package:flutter/foundation.dart';
import 'package:competition/core/utils/base_response.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/feature_login/data/datasource/login_datasource.dart';
import 'package:competition/feature_login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource _datasource;

  const LoginRepositoryImpl(this._datasource);

  @override
  Future<DataState<String, MyException>> login({required String phone}) async {
    try {
      return DataState.success(
        await compute(_getData, await _datasource.login(phone: phone)),
      );
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(message: '$e'));
      }
    }
  }
}

String _getData(dynamic response) {
  return BaseResponse.getData<String>(response, (json) => json['userId']);
}
