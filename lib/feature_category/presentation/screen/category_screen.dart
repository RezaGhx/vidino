import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../config/resoureces/my_api.dart';
import '../../../config/resoureces/my_color.dart';
import '../../../config/resoureces/my_text_styles.dart';
import '../../../config/routes/routes.dart';
import '../../../core/widgets/app_bar/my_app_bar.dart';
import '../../../core/widgets/back_ground/my_background.dart';
import '../../../core/widgets/buttons/my_icon_back.dart';
import '../../../core/widgets/buttons/my_icon_button.dart';
import '../../../core/widgets/containers/my_container_public.dart';
import '../../../core/widgets/imaes/cache_image.dart';
import '../../../core/widgets/imaes/my_poster_films.dart';
import '../controller/category_controller.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (_) {
      return Scaffold(
        appBar: MyAppBar(
          leading: const MyIconBack(),
          actions: [
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: controller.baseStatusProfile is BaseLoading
                    ? const MyLoading()
                    : MyContainerPublic(
                        onTap: () {
                          controller.repGetProfile();
                        },
                        backgroundColor: MyColor.transparent,
                        child: Image.asset(
                          "assets/images/profile.png",
                          scale: 6,
                        ),
                      )),
          ],
        ),
        body: SingleChildScrollView(
          child: MyBackground(
            isExpanded: false,
            margin: EdgeInsets.zero,
            color: MyColor.nearShadeDarkFb,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.responseHeight.heightSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.listItemCategoryEntity!.title ?? "",
                          style: MyTextStyle.style(
                              context: context,
                              size: MyFontSize.medium,
                              weight: MyFontWeight.bold),
                        ),
                        10.responseHeight.heightSpace,
                        Text(
                          controller.listItemCategoryEntity!.description ?? "",
                          style: MyTextStyle.style(
                              context: context,
                              mode: MyColor.neaDarkGrey,
                              size: MyFontSize.small,
                              weight: MyFontWeight.bold),
                        ),
                      ],
                    ),
                    15.responseHeight.heightSpace,
                    controller.baseStatusListItemMedia is BaseLoading
                        ? const MyLoading()
                        : MyContainerPublic(
                            backgroundColor: MyColor.transparent,
                            onTap: () {
                              Get.toNamed(Routes.detailPage, arguments: {
                                "mediaById": controller.listItemMediaEntity[3]
                              });
                            },
                            child: CacheImage(
                              height: 160,
                              url:
                                  "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[3].imageId!}",
                            ),
                          ),
                    15.responseHeight.heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.baseStatusListItemMedia is BaseLoading
                            ? const MyLoading()
                            : MyContainerPublic(
                                backgroundColor: MyColor.transparent,
                                onTap: () {
                                  Get.toNamed(Routes.detailPage, arguments: {
                                    "mediaById":
                                        controller.listItemMediaEntity[3]
                                  });
                                },
                                child: CacheImage(
                                  height: 90,
                                  width: context.width/2.3,
                                  url:
                                      "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[3].imageId!}",
                                ),
                              ),
                        15.responseWidth.widthSpace,
                        controller.baseStatusListItemMedia is BaseLoading
                            ? const MyLoading()
                            : MyContainerPublic(
                                backgroundColor: MyColor.transparent,
                                onTap: () {
                                  Get.toNamed(Routes.detailPage, arguments: {
                                    "mediaById":
                                        controller.listItemMediaEntity[2]
                                  });
                                },
                                child: CacheImage(
                                  height: 90,
                                  width: context.width/2.3,
                                  url:
                                      "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[2].imageId!}",
                                ),
                              ),
                      ],
                    )
                  ],
                ),
                30.responseHeight.heightSpace,
                Text(
                  "بیشتر ببینید",
                  style: MyTextStyle.style(
                      context: context,
                      size: MyFontSize.small,
                      weight: MyFontWeight.bold),
                ),
                10.responseHeight.heightSpace,
                MyContainerPublic(
                  backgroundColor: MyColor.transparent,
                  height: 130,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3.responseWidth),
                        child: MyPosterFilms(
                          onTap: () {
                            Get.toNamed(Routes.detailPage, arguments: {
                              "mediaById": controller.listItemMediaEntity[index]
                            });
                          },
                          url:
                              "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[index].imageId!}",
                          nameFilms:
                              controller.listItemMediaEntity[index].title,
                        ),
                      );
                    },
                    itemCount: controller.listItemMediaEntity.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
