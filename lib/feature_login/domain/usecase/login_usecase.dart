import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';

import '../../../feature_login/domain/repository/login_repository.dart';

class LoginUseCase
    implements UseCaseParam<DataState<String, MyException>, String> {
  final ILoginRepository _repository;

  const LoginUseCase(this._repository);

  @override
  Future<DataState<String, MyException>> call(String param) async {
    return _repository.login(phone: param);
  }
}
