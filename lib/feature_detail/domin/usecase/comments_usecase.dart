import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../entity/media_suggest_entity.dart';
import '../repository/detail_repository.dart';


class MediaSuggestUseCase
    implements UseCaseParam<DataState<List<MediaSuggestEntity>, MyException>, String> {
  final IDetailRepository _repository;

  const MediaSuggestUseCase(this._repository);

  @override
  Future<DataState<List<MediaSuggestEntity>, MyException>> call(String param) async {
    return _repository.mediaSuggest(param: param);
  }
}
