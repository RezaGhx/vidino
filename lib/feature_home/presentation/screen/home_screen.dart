import 'dart:ui';

import 'package:competition/config/resoureces/my_api.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/config/routes/routes.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/app_bar/my_app_bar.dart';
import 'package:competition/core/widgets/back_ground/my_background.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_type.dart';
import 'package:competition/core/widgets/buttons/my_button/my_button.dart';
import 'package:competition/core/widgets/buttons/my_icon_button.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:competition/feature_home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/imaes/cache_image.dart';
import '../../../core/widgets/imaes/my_poster_films.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: MyAppBar(
          leading: MyIconButton(
            icon: Icons.filter_list,
            onTap: () {
              Get.toNamed(Routes.filterPage);
            },
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: controller.baseStatusProfile is BaseLoading
                    ? const MyLoading()
                    : MyContainerPublic(
                        backgroundColor: MyColor.transparent,
                        onTap: () {
                          controller.repGetProfile();
                        },
                        child: Image.asset(
                          "assets/images/profile.png",
                          scale: 6,
                        ),
                      )),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyIconButton(
                onTap: () {
                  controller.goToExit();
                },
                icon: Icons.logout_outlined,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: MyBackground(
            isExpanded: false,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: MyColor.nearShadeDarkFb,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 280,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  stops: [0.6, 1.0], // تنظیم درصد محو شدن
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[index].imageId ?? ""}",
                                      ),
                                      fit: BoxFit.fill // Updated image path
                                      ),
                                ),
                              ),
                            ),
                          ),
                          10.responseHeight.heightSpace,
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: MyButton(
                                      title: 'تماشا کنید',
                                      onTap: () {
                                        Get.toNamed(Routes.videoPlayerPage,
                                            parameters: {
                                              "urlVideo": '${MyApi.baseUrlPlayer}${controller.listItemMediaEntity[index].mediaUrl}'
                                            });
                                      },
                                      size: MyButtonSize.small,
                                    ),
                                  ),
                                  10.responseWidth.widthSpace,
                                  SizedBox(
                                    width: 100,
                                    child: MyButton(
                                      title: 'اطلاعات بیشتر',
                                      onTap: () {
                                        Get.toNamed(Routes.detailPage,
                                            arguments: {
                                              "mediaById": controller
                                                  .listItemMediaEntity[index]
                                            });
                                      },
                                      type: MyButtonType.btnDefaultNonLine,
                                      size: MyButtonSize.small,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.responseWidth,
                      vertical: 10.responseHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.responseHeight.heightSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "پیشنهاد ",
                                style: MyTextStyle.style(
                                    context: context,
                                    size: MyFontSize.medium,
                                    weight: MyFontWeight.normal),
                              ),
                              Text(
                                "ویدینو",
                                style: MyTextStyle.style(
                                    context: context,
                                    mode: MyColor.primary,
                                    size: MyFontSize.medium,
                                    weight: MyFontWeight.normal),
                              ),
                            ],
                          ),
                          15.responseHeight.heightSpace,
                          controller.baseStatusMediaBYId is BaseLoading
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
                                    height: 180,
                                    url:
                                        "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[3].imageId ?? ""}",
                                  ),
                                ),
                          15.responseHeight.heightSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.baseStatusMediaBYId is BaseLoading
                                  ? const MyLoading()
                                  : MyContainerPublic(
                                      backgroundColor: MyColor.transparent,
                                      onTap: () {
                                        Get.toNamed(Routes.detailPage,
                                            arguments: {
                                              "mediaById": controller
                                                  .listItemMediaEntity[4]
                                            });
                                      },
                                      child: Expanded(
                                        child: CacheImage(
                                          height: 90,
                                          url:
                                              "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[4].imageId ?? ""}",
                                        ),
                                      ),
                                    ),
                              15.responseWidth.widthSpace,
                              controller.baseStatusMediaBYId is BaseLoading
                                  ? const MyLoading()
                                  : MyContainerPublic(
                                      backgroundColor: MyColor.transparent,
                                      onTap: () {
                                        Get.toNamed(Routes.detailPage,
                                            arguments: {
                                              "mediaById": controller
                                                  .listItemMediaEntity[3]
                                            });
                                      },
                                      child: Expanded(
                                        child: CacheImage(
                                          height: 90,
                                          url:
                                              "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity[5].imageId ?? ""}",
                                        ),
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                      30.responseHeight.heightSpace,
                      controller.baseStatusListItemCategory is BaseLoading
                          ? const Center(child: MyLoading())
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.listItemCategoryEntity.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    MyContainerPublic(
                                      onTap: () {
                                        Get.toNamed(Routes.categoryPage,
                                            arguments: {
                                              "listItemCategoryEntity": controller
                                                      .listItemCategoryEntity[
                                                  index],
                                            });
                                      },
                                      backgroundColor: MyColor.transparent,
                                      child: Row(
                                        children: [
                                          Text(
                                            controller
                                                    .listItemCategoryEntity[
                                                        index]
                                                    .title ??
                                                "",
                                            style: MyTextStyle.style(
                                                context: context,
                                                size: MyFontSize.small,
                                                weight: MyFontWeight.bold),
                                          ),
                                          2.responseWidth.widthSpace,
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                    10.responseHeight.heightSpace,
                                    MyContainerPublic(
                                      backgroundColor: MyColor.transparent,
                                      height: 130,
                                      alignment: Alignment.centerRight,
                                      child: ListView.builder(
                                        itemBuilder:
                                            (BuildContext context, int pos) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.responseWidth),
                                            child: MyPosterFilms(
                                              onTap: () {
                                                Get.toNamed(Routes.detailPage,
                                                    arguments: {
                                                      "mediaById": controller
                                                          .listItemCategoryEntity[
                                                              index]
                                                          .list![pos]
                                                    });
                                              },
                                              url:
                                                  "${MyApi.baseUrl}/v1/file/store/${controller.listItemCategoryEntity[index].list![pos].imageId!}",
                                              nameFilms: controller
                                                  .listItemCategoryEntity[index]
                                                  .list![pos]
                                                  .title,
                                            ),
                                          );
                                        },
                                        itemCount: controller
                                                    .listItemCategoryEntity[
                                                        index]
                                                    .list ==
                                                null
                                            ? 0
                                            : controller
                                                .listItemCategoryEntity[index]
                                                .list!
                                                .length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
