import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/feature_home/domain/entity/list_item_media_entity.dart';
import 'package:competition/feature_home/domain/entity/profile_entity.dart';

import '../../../core/params/get_pages_param.dart';
import '../../../core/params/profile_param.dart';
import '../entity/list_item_category_entity.dart';

abstract class IHomeRepository {
  Future<DataState<UserEntity, MyException>> profileInfo();
  Future<DataState<NoParam, MyException>> profileUpdate({required ProfileParam param});
  Future<DataState<List<ListItemCategoryEntity>, MyException>> categories();
  Future<DataState<ListItemMediaEntity, MyException>> mediaByID({required String param});
  Future<DataState<List<ListItemMediaEntity>, MyException>> medias({required GetPagesParam param});
}
