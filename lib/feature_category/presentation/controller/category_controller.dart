import 'package:get/get.dart';

import '../../../core/params/get_pages_param.dart';
import '../../../core/params/profile_param.dart';
import '../../../core/usecase/usecase_param.dart';
import '../../../core/utils/base_status.dart';
import '../../../core/widgets/modals/filter/my_modal_bottom_sheet_filter.dart';
import '../../../core/widgets/modals/my_show_modal_bottom_sheets.dart';
import '../../../core/widgets/modals/profile/my_modal_bottom_sheet_profile.dart';
import '../../../core/widgets/snackbar/my_snack_bar.dart';
import '../../../feature_home/domain/entity/list_item_category_entity.dart';
import '../../../feature_home/domain/entity/list_item_media_entity.dart';
import '../../../feature_home/domain/entity/profile_entity.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/list_item_media_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';

class CategoryController extends GetxController{
  ProfileEntity? profileEntity;
  ProfileParam? profileParam;
  ListItemCategoryEntity? listItemCategoryEntity;
  List<ListItemMediaEntity> listItemMediaEntity = [];

  ///Status
  BaseStatus baseStatusProfile = const BaseInit();
  BaseStatus baseStatusListItemMedia = const BaseInit();

  ///UseCase
  GetProfileUseCase getProfileUseCase;
  ProfileUpdateUseCase profileUpdateUseCase;
  ListItemMediaUseCase listItemMediaUseCase;


  CategoryController(this.getProfileUseCase, this.profileUpdateUseCase,this.listItemMediaUseCase);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    profileEntity=ProfileEntity();
    listItemCategoryEntity=Get.arguments["listItemCategoryEntity"]??ListItemCategoryEntity();
    repGetProfile();
    repGetListItemMedia();
  }

  void repGetProfile() async {
    baseStatusProfile = const BaseLoading();
    update();
    await getProfileUseCase(NoParam()).then(
          (value) {
        value.fold(
              (data) {
            baseStatusProfile = BaseComplete<dynamic>(data);
            setUserEntity(userEntity: data);
            update();

          },
              (error) {
            baseStatusProfile = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repSetProfileUpdate({UserEntity? userEntity}) async {
    baseStatusProfile = const BaseLoading();
    profileParam=ProfileParam(
      userId: userEntity!.userId!,
      fullname: userEntity.fullName!,
      phoneNumber: userEntity.phoneNumber!,
      gender: userEntity.gender!,
      birthDate: userEntity.birthDate!,
    );
    update();
    await profileUpdateUseCase(profileParam!).then(
          (value) {
        value.fold(
              (data) {
            baseStatusProfile = BaseComplete<dynamic>(data);
            repGetProfile();
            update();

          },
              (error) {
            baseStatusProfile = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repGetListItemMedia() async {
    baseStatusListItemMedia = const BaseLoading();
    update();
    await listItemMediaUseCase(GetPagesParam(
        page: "1",
        pageSize: "100",
        category: listItemCategoryEntity!.id
    )).then(
          (value) {
        value.fold(
              (data) {
            baseStatusListItemMedia = BaseComplete<dynamic>(data);
            listItemMediaEntity=data;
            update();
          },
              (error) {
            baseStatusListItemMedia = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  setUserEntity({UserEntity? userEntity}){
    profileEntity = profileEntity!.copyWith(
        user: userEntity
    );
  }

  void profileModalBottomSheet() {
    showMyModalBottomSheet(
      childModal: MyModalBottomSheetProfile(
        userEntity: profileEntity!.user,
        onTap: (value) {
          repSetProfileUpdate(userEntity: value);
        },
      ),
    );
  }

}