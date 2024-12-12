import 'package:competition/core/params/get_pages_param.dart';
import 'package:competition/core/params/profile_param.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/modals/profile/my_modal_bottom_sheet_profile.dart';
import 'package:competition/feature_home/domain/entity/profile_entity.dart';
import 'package:competition/feature_home/domain/usecase/list_item_media_usecase.dart';
import 'package:get/get.dart';

import '../../../config/routes/routes.dart';
import '../../../core/utils/auth_storage.dart';
import '../../../core/widgets/modals/confirm/my_dialog_confirm.dart';
import '../../../core/widgets/modals/my_show_dialogs.dart';
import '../../../core/widgets/modals/my_show_modal_bottom_sheets.dart';
import '../../../core/widgets/snackbar/my_snack_bar.dart';
import '../../domain/entity/list_item_category_entity.dart';
import '../../domain/entity/list_item_media_entity.dart';
import '../../domain/usecase/get_profile_usecase.dart';
import '../../domain/usecase/list_item_category_usecase.dart';
import '../../domain/usecase/media_by_id_usecase.dart';
import '../../domain/usecase/profile_update_usecase.dart';

class HomeController extends GetxController {
  ProfileEntity? profileEntity;
  ProfileParam? profileParam;
  List<ListItemCategoryEntity> listItemCategoryEntity = [];
  List<ListItemMediaEntity> listItemMediaEntity = [
    ListItemMediaEntity(id: '68110000-e519-00ff-358e-08dd1ab19211'),
    ListItemMediaEntity(id: '68110000-e519-00ff-b685-08dd1ab138bd'),
    ListItemMediaEntity(id: '68110000-e519-00ff-e48e-08dd1ab10926'),
    ListItemMediaEntity(id: '68110000-e519-00ff-f38d-08dd1ab0e47e'),
    ListItemMediaEntity(id: '68110000-e519-00ff-b993-08dd1ab05705'),
    ListItemMediaEntity(id: '68110000-e519-00ff-b685-08dd1ab138bd'),
  ];
  // I/flutter (19717): 68110000-e519-00ff-358e-08dd1ab19211
  // I/flutter (19717): 68110000-e519-00ff-b685-08dd1ab138bd
  // I/flutter (19717): 68110000-e519-00ff-e48e-08dd1ab10926
  // I/flutter (19717): 68110000-e519-00ff-f38d-08dd1ab0e47e
  // I/flutter (19717): 68110000-e519-00ff-b993-08dd1ab05705



  ///Status
  BaseStatus baseStatusProfile = const BaseInit();
  BaseStatus baseStatusListItemCategory = const BaseInit();
  BaseStatus baseStatusListItemMedia = const BaseInit();
  BaseStatus baseStatusMediaBYId = const BaseInit();

  ///UseCase
  GetProfileUseCase getProfileUseCase;
  ProfileUpdateUseCase profileUpdateUseCase;
  ListItemCategoryUseCase listItemCategoryUseCase;
  ListItemMediaUseCase listItemMediaUseCase;
  MediaByIdUseCase mediaByIdUseCase;

  HomeController(
      this.getProfileUseCase,
      this.profileUpdateUseCase,
      this.listItemMediaUseCase,
      this.mediaByIdUseCase,
      this.listItemCategoryUseCase);

  @override
  void onInit() {
    super.onInit();
    profileEntity = ProfileEntity();

    repGetListItemCategory();
    for(int index=0;index< listItemMediaEntity.length;index++){

      repGetMediaById(id: listItemMediaEntity[index].id,index:index,);
    }
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

  void repGetListItemCategory() async {
    baseStatusListItemCategory = const BaseLoading();
    update();
    await listItemCategoryUseCase(NoParam()).then(
      (value) {
        value.fold(
          (data) {
            baseStatusListItemCategory = BaseComplete<dynamic>(data);
            listItemCategoryEntity = data;
            for (int index = 0;
                index < listItemCategoryEntity.length;
                index++) {
              repGetListItemMedia(
                  category: listItemCategoryEntity[index].id, index: index);
            }
            update();
          },
          (error) {
            baseStatusListItemCategory = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repGetListItemMedia({String? category, int? index}) async {
    baseStatusListItemMedia = const BaseLoading();
    update();
    await listItemMediaUseCase(
            GetPagesParam(page: "1", pageSize: "5", category: category))
        .then(
      (value) {
        value.fold(
          (data) {
            baseStatusListItemMedia = BaseComplete<dynamic>(data);
            listItemCategoryEntity[index!].list = data;
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
  void repGetMediaById({String? id,int? index}) async {
    baseStatusMediaBYId = const BaseLoading();
    update();
    await mediaByIdUseCase(id!)
        .then(
      (value) {
        value.fold(
          (data) {
            baseStatusMediaBYId = BaseComplete<dynamic>(data);
            listItemMediaEntity[index!]=listItemMediaEntity[index].copyWith(
              id: data.id,
              imageId: data.imageId,
              title: data.title,
              minAge: data.minAge,
              year: data.year,
              likes: data.likes,
              mediaType: data.mediaType,
              coverId: data.coverId,
              disLikes: data.disLikes,
              categoryId: data.categoryId,
              country: data.country,
              description: data.description,
              mediaUrl: data.mediaUrl
            );
            update();
          },
          (error) {
            baseStatusMediaBYId = BaseError(error.message);
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
    profileParam = ProfileParam(
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

  setUserEntity({UserEntity? userEntity}) {
    profileEntity = profileEntity!.copyWith(user: userEntity);
    update();
    profileModalBottomSheet();
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

  void goToExit() {
    myShowMyDialogs(
        child: MyDialogConfirm(
      onTap: () async {
        Get.back();
        await Future.wait([
          AuthStorage.deleteData(),
          Get.delete<HomeController>(force: true)
        ]);
        Get.offAllNamed(Routes.loginPage);
      },
      title: 'confirm_exit_account'.tr,
    ));
  }
}
