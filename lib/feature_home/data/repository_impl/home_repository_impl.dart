import 'package:competition/core/params/get_pages_param.dart';
import 'package:competition/core/params/profile_param.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_home/data/model/list_item_category_model.dart';
import 'package:competition/feature_home/data/model/list_item_media_model.dart';
import 'package:competition/feature_home/domain/entity/list_item_category_entity.dart';
import 'package:competition/feature_home/domain/entity/list_item_media_entity.dart';
import 'package:competition/feature_home/domain/entity/profile_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:competition/core/utils/base_response.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/feature_home/domain/repository/home_repository.dart';

import '../datasource/home_datasource.dart';
import '../model/profile_model.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeDatasource _datasource;

  const HomeRepositoryImpl(this._datasource);

  @override
  Future<DataState<UserEntity, MyException>> profileInfo() async {
    try {
      return DataState.success(
        await compute(_getData, await _datasource.profileInfo()),
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
  Future<DataState<NoParam, MyException>> profileUpdate(
      {required ProfileParam param}) async {
    try {
      await _datasource.profileUpdate(param: param);
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
  Future<DataState<List<ListItemCategoryEntity>, MyException>>
      categories() async {
    try {
      return DataState.success(
        await compute(
            _getDataListItemCategory, await _datasource.categories()),
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
  Future<DataState<List<ListItemMediaEntity>, MyException>> medias({required GetPagesParam param})async {
    try {
      return DataState.success(
        await compute(
            _getDataListItemMedia, await _datasource.medias(param: param)),
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
  Future<DataState<ListItemMediaEntity, MyException>> mediaByID({required String param}) async{
    try {
      return DataState.success(
          await compute(
              _getDataMediaById, await _datasource.mediaByID(param: param)),
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

UserEntity _getData(dynamic response) {
  return BaseResponse.getData(response, (json) => UserModel.fromJson(json));
}

List<ListItemCategoryEntity> _getDataListItemCategory(dynamic response) {
  return BaseResponse.getDataList<ListItemCategoryEntity>(
    response,
    (json) => ListItemCategoryModel.fromJson(json),
  );
}
List<ListItemMediaEntity> _getDataListItemMedia(dynamic response) {
  return BaseResponse.getDataList<ListItemMediaEntity>(
    response,
        (json) => ListItemMediaModel.fromJson(json),
  );
}

ListItemMediaEntity _getDataMediaById(dynamic response) {
  return BaseResponse.getData(response, (json) => ListItemMediaModel.fromJson(json));
}