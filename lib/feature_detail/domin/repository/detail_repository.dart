import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/feature_detail/domin/entity/media_suggest_entity.dart';

import '../../../core/params/comments_param.dart';
import '../entity/comments_entity.dart';

abstract class IDetailRepository {
  Future<DataState<List<MediaSuggestEntity>, MyException>> mediaSuggest({required String param});
  Future<DataState<List<CommentsEntity>, MyException>> comments({required String param});
  Future<DataState<String, MyException>> commentsSummary({required String param});
  Future<DataState<NoParam, MyException>> commentsSend({required CommentsParam param});
  Future<DataState<NoParam, MyException>> like({required String param});
  Future<DataState<NoParam, MyException>> dislike({required String param});
}
