import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/feature_detail/domin/entity/media_suggest_entity.dart';

abstract class IDetailRepository {
  Future<DataState<List<MediaSuggestEntity>, MyException>> mediaSuggest({required String param});
  Future<DataState<List<MediaSuggestEntity>, MyException>> comments({required String param});
}
