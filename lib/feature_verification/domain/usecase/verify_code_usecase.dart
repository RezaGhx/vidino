import 'package:competition/core/params/verify_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_verification/domain/repository/verify_code_reporsitory.dart';

import '../../../feature_home/domain/entity/profile_entity.dart';

class VerifyCodeUseCase
    implements UseCaseParam<DataState<ProfileEntity, MyException>, VerifyParam> {
  final IVerifyCodeRepository _repository;

  const VerifyCodeUseCase(this._repository);

  @override
  Future<DataState<ProfileEntity, MyException>> call(VerifyParam param) {
    return _repository.verifyCode(param: param);
  }
}
