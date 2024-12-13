import 'package:competition/core/params/comments_param.dart';
import 'package:competition/feature_detail/domin/entity/comments_entity.dart';
import 'package:competition/feature_detail/domin/usecase/dislike_usecase.dart';
import 'package:competition/feature_detail/domin/usecase/like_usecase.dart';
import 'package:competition/feature_home/domain/entity/list_item_media_entity.dart';
import 'package:get/get.dart';

import '../../../config/routes/routes.dart';
import '../../../core/params/profile_param.dart';
import '../../../core/usecase/usecase_param.dart';
import '../../../core/utils/base_status.dart';
import '../../../core/widgets/modals/my_show_modal_bottom_sheets.dart';
import '../../../core/widgets/modals/profile/my_modal_bottom_sheet_profile.dart';
import '../../../core/widgets/snackbar/my_snack_bar.dart';
import '../../../feature_home/domain/entity/profile_entity.dart';
import '../../../feature_home/domain/usecase/get_profile_usecase.dart';
import '../../../feature_home/domain/usecase/list_item_media_usecase.dart';
import '../../../feature_home/domain/usecase/media_by_id_usecase.dart';
import '../../../feature_home/domain/usecase/profile_update_usecase.dart';
import 'package:flutter/material.dart';

import '../../domin/entity/media_suggest_entity.dart';
import '../../domin/usecase/comments_send_usecase.dart';
import '../../domin/usecase/comments_summary_usecase.dart';
import '../../domin/usecase/comments_usecase.dart';
import '../../domin/usecase/media_suggest_usecase.dart';

class DetailController extends GetxController {
  final TextEditingController commentController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  ProfileEntity? profileEntity;
  ProfileParam? profileParam;
  ListItemMediaEntity? listItemMediaEntity;
  List<MediaSuggestEntity> listMediaSuggestEntity = [];
  List<CommentsEntity> listCommentsEntity = [];
  String commentSummary = '';

  ///Status
  BaseStatus baseStatusProfile = const BaseInit();
  BaseStatus baseStatusMediaSuggest = const BaseInit();
  BaseStatus baseStatusComment = const BaseInit();
  BaseStatus baseStatusCommentSend = const BaseInit();
  BaseStatus baseStatusMediaBYId = const BaseInit();
  BaseStatus baseStatusCommentSummary = const BaseInit();
  BaseStatus baseStatusLike = const BaseInit();
  BaseStatus baseStatusDisLike = const BaseInit();

  ///UseCase
  GetProfileUseCase getProfileUseCase;
  ProfileUpdateUseCase profileUpdateUseCase;
  MediaSuggestUseCase mediaSuggestUseCase;
  ListItemMediaUseCase listItemMediaUseCase;
  MediaByIdUseCase mediaByIdUseCase;
  CommentsUseCase commentsUseCase;
  CommentsSendUseCase commentsSendUseCase;
  CommentsSummaryUseCase commentsSummaryUseCase;
  LikeUseCase likeUseCase;
  DislikeUseCase dislikeUseCase;

  DetailController(
      this.likeUseCase,
      this.listItemMediaUseCase,
      this.dislikeUseCase,
      this.commentsUseCase,
      this.getProfileUseCase,
      this.commentsSendUseCase,
      this.mediaByIdUseCase,
      this.mediaSuggestUseCase,
      this.commentsSummaryUseCase,
      this.profileUpdateUseCase);

  @override
  void onInit() {
    super.onInit();
    profileEntity = ProfileEntity();
    listItemMediaEntity = Get.arguments["mediaById"] ?? ListItemMediaEntity();
    repGetMediaById(id: listItemMediaEntity!.id);
    repMediaSuggest();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    commentController.dispose();
    focusNode.dispose();
  }

  void repGetMediaById({String? id, int? index}) async {
    baseStatusMediaBYId = const BaseLoading();
    if (index != null) {
      listMediaSuggestEntity[index] =
          listMediaSuggestEntity[index].copyWith(status: baseStatusMediaBYId);
    }
    update();
    await mediaByIdUseCase(id!).then(
      (value) {
        value.fold(
          (data) async{
            baseStatusMediaBYId = BaseComplete<dynamic>(data);

            if (index != null) {
              listMediaSuggestEntity[index] = listMediaSuggestEntity[index]
                  .copyWith(status: baseStatusMediaBYId);

              update();
              ListItemMediaEntity listItemMediaEntity = ListItemMediaEntity(
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
                  mediaUrl: data.mediaUrl);

              Get.back();
              await Future.delayed(
                const Duration(milliseconds: 300),
                    () {
                      Get.toNamed(
                        Routes.detailPage,
                        arguments: {"mediaById": listItemMediaEntity},);
                },
              );

              update();
            } else {
              listItemMediaEntity = data;
              print("object");
              update();
            }
          },
          (error) {
            baseStatusMediaBYId = BaseError(error.message);

            listMediaSuggestEntity[index!] = listMediaSuggestEntity[index]
                .copyWith(status: baseStatusMediaBYId);
            update();
            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
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
    await mediaSuggestUseCase(listItemMediaEntity!.id!).then(
      (value) {
        value.fold(
          (data) {
            baseStatusMediaSuggest = BaseComplete<dynamic>(data);
            listMediaSuggestEntity = data;
            update();
            repComment();
            repCommentSummary();
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

  void repComment() async {
    baseStatusComment = const BaseLoading();

    update();
    await commentsUseCase(listItemMediaEntity!.id!).then(
      (value) {
        value.fold(
          (data) {
            baseStatusComment = BaseComplete<dynamic>(data);
            listCommentsEntity = data;
            update();
          },
          (error) {
            baseStatusComment = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repCommentSummary() async {
    baseStatusCommentSummary = const BaseLoading();

    update();
    await commentsSummaryUseCase(listItemMediaEntity!.id!).then(
      (value) {
        value.fold(
          (data) {
            baseStatusCommentSummary = BaseComplete<String>(data);
            commentSummary = data;
            update();
          },
          (error) {
            baseStatusCommentSummary = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repCommentSend() async {
    Get.focusScope!.unfocus();
    baseStatusCommentSend = const BaseLoading();

    update();
    await commentsSendUseCase(CommentsParam(
            id: listItemMediaEntity!.id!,
            userId: "",
            mediaId: listItemMediaEntity!.id,
            text: commentController.text))
        .then(
      (value) {
        value.fold(
          (data) {
            baseStatusCommentSend = BaseComplete<dynamic>(data);
            commentController.clear();
            repComment();
            update();
          },
          (error) {
            baseStatusCommentSend = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repLike() async {
    baseStatusLike = const BaseLoading();

    update();
    await likeUseCase(listItemMediaEntity!.id!).then(
      (value) {
        value.fold(
          (data) {
            baseStatusLike = BaseComplete<dynamic>(data);
            repGetMediaById(id: listItemMediaEntity!.id);
            update();
          },
          (error) {
            baseStatusLike = BaseError(error.message);
            update();

            mySnackBar(
                title: error.title, content: error.message, isSuccess: false);
          },
        );
      },
    );
  }

  void repDisLike() async {
    baseStatusDisLike = const BaseLoading();

    update();
    await dislikeUseCase(listItemMediaEntity!.id!).then(
      (value) {
        value.fold(
          (data) {
            baseStatusDisLike = BaseComplete<dynamic>(data);
            repGetMediaById(id: listItemMediaEntity!.id);
            update();
          },
          (error) {
            baseStatusDisLike = BaseError(error.message);
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

  void updateController() {
    update();
  }
}
