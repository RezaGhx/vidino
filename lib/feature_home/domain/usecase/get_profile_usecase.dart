import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_home/domain/repository/home_repository.dart';

import '../entity/profile_entity.dart';

class GetProfileUseCase
    implements UseCaseParam<DataState<UserEntity, MyException>, NoParam> {
  final IHomeRepository _repository;

  const GetProfileUseCase(this._repository);

  @override
  Future<DataState<UserEntity, MyException>> call(NoParam param) async {
    return _repository.profileInfo();
  }
}
