import 'package:competition/feature_detail/data/model/media_suggest_model.dart';
import 'package:competition/feature_detail/domin/entity/media_suggest_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:competition/core/utils/base_response.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import '../../domin/repository/detail_repository.dart';
import '../datasource/detail_datasource.dart';

class DetailRepositoryImpl implements IDetailRepository {
  final IDetailDatasource _datasource;

  const DetailRepositoryImpl(this._datasource);

  @override
  Future<DataState<List<MediaSuggestEntity>, MyException>> mediaSuggest(
      {required String param}) async {
    try {
      return DataState.success(
        await compute(
            _getDataMediaSuggest, await _datasource.mediaSuggest(param: param)),
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

  @override
  Future<DataState<List<MediaSuggestEntity>, MyException>> comments(
      {required String param}) async {
    try {
      return DataState.success(
        await compute(
            _getDataMediaSuggest, await _datasource.mediaSuggest(param: param)),
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

List<MediaSuggestEntity> _getDataMediaSuggest(dynamic response) {
  return BaseResponse.getDataListNoPage<MediaSuggestEntity>(
    response,
    (json) => MediaSuggestModel.fromJson(json),
  );
}
