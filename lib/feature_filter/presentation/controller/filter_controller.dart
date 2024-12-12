import 'package:get/get.dart';

import '../../../core/params/profile_param.dart';
import '../../../core/usecase/usecase_param.dart';
import '../../../core/utils/base_status.dart';
import '../../../core/widgets/modals/filter/my_modal_bottom_sheet_filter.dart';
import '../../../core/widgets/modals/my_show_modal_bottom_sheets.dart';
import '../../../core/widgets/modals/profile/my_modal_bottom_sheet_profile.dart';
import '../../../core/widgets/snackbar/my_snack_bar.dart';
import '../../../feature_home/domain/entity/profile_entity.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';
import 'package:flutter/material.dart';

class FilterController extends GetxController{
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  ProfileEntity? profileEntity;
  ProfileParam? profileParam;

  ///Status
  BaseStatus baseStatusProfile = const BaseInit();

  ///UseCase
  GetProfileUseCase getProfileUseCase;
  ProfileUpdateUseCase profileUpdateUseCase;


  FilterController(this.getProfileUseCase, this.profileUpdateUseCase);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    profileEntity=ProfileEntity();
    repGetProfile();
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

  void filterModalBottomSheet() {
    showMyModalBottomSheet(
      childModal: MyModalBottomSheetFilter(
        onTap: (value) {
        },
      ),
    );
  }
}