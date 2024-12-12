import 'package:competition/core/params/verify_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';

import '../../../feature_home/domain/entity/profile_entity.dart';

abstract class IVerifyCodeRepository {
  Future<DataState<ProfileEntity, MyException>> verifyCode(
      {required VerifyParam param});
}
