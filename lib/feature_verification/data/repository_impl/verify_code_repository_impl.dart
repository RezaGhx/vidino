import 'package:flutter/foundation.dart';
import 'package:competition/core/params/verify_param.dart';
import 'package:competition/core/utils/base_response.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/feature_verification/data/datasource/verify_code_datasource.dart';
import 'package:competition/feature_verification/domain/repository/verify_code_reporsitory.dart';

import '../../../feature_home/data/model/profile_model.dart';
import '../../../feature_home/domain/entity/profile_entity.dart';

class VerifyCodeRepositoryImpl implements IVerifyCodeRepository {
  final IVerifyCodeDatasource _datasource;

  const VerifyCodeRepositoryImpl(this._datasource);

  @override
  Future<DataState<ProfileEntity, MyException>> verifyCode(
      {required VerifyParam param}) async {
    try {
      return DataState.success(
        await compute(
          _getData,
          await _datasource.verifyCode(param: param),
        ),
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

ProfileEntity _getData(dynamic response) {
  return BaseResponse.getData(response, (json) => ProfileModel.fromJson(json));
}
