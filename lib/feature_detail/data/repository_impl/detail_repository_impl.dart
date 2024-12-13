import 'package:competition/core/params/comments_param.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_detail/data/model/comments_modal.dart';
import 'package:competition/feature_detail/data/model/media_suggest_model.dart';
import 'package:competition/feature_detail/domin/entity/comments_entity.dart';
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
  Future<DataState<List<CommentsEntity>, MyException>> comments(
      {required String param}) async {
    try {
      return DataState.success(
        await compute(
            _getDataMediaComment, await _datasource.comments(param: param)),
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
  Future<DataState<NoParam, MyException>> commentsSend(
      {required CommentsParam param}) async {
    try {
      await _datasource.commentsSend(param: param);
      return DataState.success(NoParam());
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
  Future<DataState<String, MyException>> commentsSummary(
      {required String param}) async {
    try {
      return DataState.success(
        await compute(_getDataMediaCommentSummary,
            await _datasource.commentsSummary(param: param)),
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
  Future<DataState<NoParam, MyException>> dislike(
      {required String param}) async {
    try {
      await _datasource.dislike(param: param);
      return DataState.success(NoParam());
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
  Future<DataState<NoParam, MyException>> like({required String param}) async {
    try {
      await _datasource.like(param: param);
      return DataState.success(NoParam());
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

String _getDataMediaCommentSummary(dynamic response) {
  return BaseResponse.getDataWithOut<String>(
      response, (json) => json['content']);
}

List<MediaSuggestEntity> _getDataMediaSuggest(dynamic response) {
  return BaseResponse.getDataListNoPage<MediaSuggestEntity>(
    response,
    (json) => MediaSuggestModel.fromJson(json),
  );
}

List<CommentsEntity> _getDataMediaComment(dynamic response) {
  return BaseResponse.getDataList<CommentsEntity>(
    response,
    (json) => CommentsModal.fromJson(json),
  );
}
