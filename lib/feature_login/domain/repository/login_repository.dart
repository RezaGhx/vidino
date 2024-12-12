import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';

abstract class ILoginRepository {
  Future<DataState<String, MyException>> login({required String phone});
}
