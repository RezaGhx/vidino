import 'package:competition/feature_home/domain/entity/list_item_media_entity.dart';
import 'package:get/get.dart';

import '../../../core/params/profile_param.dart';
import '../../../core/usecase/usecase_param.dart';
import '../../../core/utils/base_status.dart';
import '../../../core/widgets/modals/my_show_modal_bottom_sheets.dart';
import '../../../core/widgets/modals/profile/my_modal_bottom_sheet_profile.dart';
import '../../../core/widgets/snackbar/my_snack_bar.dart';
import '../../../feature_home/domain/entity/profile_entity.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';
import 'package:flutter/material.dart';

import '../../domin/entity/media_suggest_entity.dart';
import '../../domin/usecase/media_suggest_usecase.dart';

class DetailController extends GetxController{
  final TextEditingController commentController = TextEditingController();

  ProfileEntity? profileEntity;
  ProfileParam? profileParam;
  ListItemMediaEntity? listItemMediaEntity;
  List<MediaSuggestEntity> listMediaSuggestEntity = [];

  ///Status
  BaseStatus baseStatusProfile = const BaseInit();
  BaseStatus baseStatusMediaSuggest = const BaseInit();

  ///UseCase
  GetProfileUseCase getProfileUseCase;
  ProfileUpdateUseCase profileUpdateUseCase;
  MediaSuggestUseCase mediaSuggestUseCase;


  DetailController(this.getProfileUseCase,this.mediaSuggestUseCase, this.profileUpdateUseCase);

  @override
  void onInit() {
    super.onInit();
    profileEntity=ProfileEntity();
    listItemMediaEntity=Get.arguments["mediaById"]??ListItemMediaEntity();
    repGetProfile();
    repMediaSuggest();
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

  void repMediaSuggest() async {
    baseStatusMediaSuggest = const BaseLoading();

    update();
    await mediaSuggestUseCase(listItemMediaEntity!.categoryId!).then(
          (value) {
        value.fold(
              (data) {
                baseStatusMediaSuggest = BaseComplete<dynamic>(data);
                listMediaSuggestEntity = data;
            update();

          },
              (error) {
                baseStatusMediaSuggest = BaseError(error.message);
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

  void updateController() {
    update();
  }
}