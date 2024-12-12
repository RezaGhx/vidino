import 'package:competition/core/params/profile_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_home/domain/repository/home_repository.dart';


class ProfileUpdateUseCase
    implements UseCaseParam<DataState<NoParam, MyException>, ProfileParam> {
  final IHomeRepository _repository;

  const ProfileUpdateUseCase(this._repository);

  @override
  Future<DataState<NoParam, MyException>> call(ProfileParam param) async {
    return _repository.profileUpdate(param: param);
  }
}
