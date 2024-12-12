import 'package:competition/config/routes/routes.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/extensions/validator.dart';
import 'package:competition/core/utils/base_status.dart';
import 'package:competition/core/widgets/back_ground/my_background.dart';
import 'package:competition/core/widgets/list/my_list_view_vertical.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:competition/feature_detail/presentation/controller/detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/resoureces/my_api.dart';
import '../../../config/resoureces/my_color.dart';
import '../../../config/resoureces/my_text_styles.dart';
import '../../../core/widgets/app_bar/my_app_bar.dart';
import '../../../core/widgets/buttons/my_button/enum/my_button_size.dart';
import '../../../core/widgets/buttons/my_button/my_button.dart';
import '../../../core/widgets/buttons/my_icon_button.dart';
import '../../../core/widgets/containers/my_container_public.dart';
import '../../../core/widgets/imaes/my_poster_films.dart';
import '../../../core/widgets/list/my_list_view_horizontal.dart';
import '../../../core/widgets/text/my_text_field.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(

      builder: (_) {
        return Scaffold(
          appBar: MyAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: MyIconButton(
                  onTap: () {},
                  icon: Icons.search,
                  iconSize: 30,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: MyContainerPublic(
                    onTap: () {
                      controller.profileModalBottomSheet();
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
              padding: EdgeInsets.zero,
              color: MyColor.nearShadeDarkFb,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
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
                                stops: [0.4, 1.0], // تنظیم درصد محو شدن
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Container(
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "${MyApi.baseUrl}/v1/file/store/${controller.listItemMediaEntity!.imageId??""}",
                                    ),
                                    fit: BoxFit.fill // Updated image path
                                    ),
                              ),
                            ),
                          ),
                        ),
                        10.responseHeight.heightSpace,
                        Positioned(
                            bottom: 15,
                            right: 20,
                            child: Text(
                              controller.listItemMediaEntity!.title??"",
                              style: MyTextStyle.style(
                                  context: context,
                                  size: MyFontSize.medium,
                                  weight: MyFontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: context.height+250,
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.responseWidth, vertical: 10.responseHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(CupertinoIcons.heart),
                                Text(controller.listItemMediaEntity!.likes.toString(),
                                  style: MyTextStyle.style(
                                      context: context,

                                      size: MyFontSize.small,
                                      weight: MyFontWeight.bold),
                                ),
                              ],
                            ),
                            12.responseWidth.widthSpace,
                            Row(
                              children: [
                                const Icon(CupertinoIcons.heart),
                                Text(controller.listItemMediaEntity!.disLikes.toString(),
                                  style: MyTextStyle.style(
                                      context: context,

                                      size: MyFontSize.small,
                                      weight: MyFontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        15.responseHeight.heightSpace,
                        Row(
                          children: [
                            Text("سال: ",
                              style: MyTextStyle.style(
                                  context: context,
                                  mode: MyColor.neaDarkFc,
                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                            ),
                            Text(controller.listItemMediaEntity!.year.toString(),
                              style: MyTextStyle.style(
                                  context: context,

                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                            ),
                          ],
                        ),
                        15.responseHeight.heightSpace,
                        Row(
                          children: [
                            Text("رده سنی: ",
                              style: MyTextStyle.style(
                                  context: context,
                                  mode: MyColor.neaDarkFc,
                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                            ),
                            Text("${controller.listItemMediaEntity!.minAge}+",
                              style: MyTextStyle.style(
                                  context: context,

                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                            ),
                          ],
                        ),
                        15.responseHeight.heightSpace,
                        Row(
                          children: [
                            Text("کشور سازنده: ",
                              style: MyTextStyle.style(
                                  context: context,
                                  mode: MyColor.neaDarkFc,
                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                            ),
                            Text(controller.listItemMediaEntity!.country.toString(),
                              style: MyTextStyle.style(
                                  context: context,

                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),
                            ),
                          ],
                        ),

                        10.responseHeight.heightSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: MyContainerPublic(
                            alignment: Alignment.center,
                            width: 80,
                            height: 50,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6
                            ),
                            child: Text("فیلم کوتاه",
                              style: MyTextStyle.style(
                                  context: context,

                                  size: MyFontSize.xSmall,
                                  weight: MyFontWeight.bold),
                            ),
                          ),
                        ),
                        10.responseHeight.heightSpace,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: MyButton(
                                title: 'تماشا کنید',
                                onTap: () {
                                  Get.toNamed(Routes.videoPlayerPage,
                                  parameters: {
                                    "urlVideo": '${MyApi.baseUrlPlayer}${controller.listItemMediaEntity!.mediaUrl}'
                                  });
                                },
                                size: MyButtonSize.small,
                              ),
                            ),
                          ],
                        ),
                        25.responseHeight.heightSpace,
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text("چکیده داستان",
                              style: MyTextStyle.style(
                                  context: context,
                                  size: MyFontSize.small,
                                  weight: MyFontWeight.bold),)),
                        10.responseHeight.heightSpace,
                        Text(controller.listItemMediaEntity!.description??"",
                          style: MyTextStyle.style(
                              context: context,
                              size: MyFontSize.small,
                              weight: MyFontWeight.bold),),
                        40.responseHeight.heightSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "مشابه ها",
                            style: MyTextStyle.style(
                                context: context,
                                size: MyFontSize.medium,
                                weight: MyFontWeight.bold),
                          ),
                        ),
                        10.responseHeight.heightSpace,
                        controller.baseStatusMediaSuggest is BaseLoading?const MyLoading():MyContainerPublic(
                          backgroundColor: MyColor.transparent,
                          height: 130,
                          alignment: Alignment.centerRight,
                          child: ListView.builder(

                            itemBuilder: (BuildContext context, int index) {
                              print("${MyApi.baseUrl}/v1/file/store/${controller.listMediaSuggestEntity[index].imageUrl!}");
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.responseWidth),
                                child: MyPosterFilms(
                                  onTap: (){
                                    Get.toNamed(Routes.detailPage);
                                  },
                                  url: "${MyApi.baseUrl}/v1/file/store/${controller.listMediaSuggestEntity[index].imageUrl!}",
                                  nameFilms: controller.listMediaSuggestEntity[index].title,
                                ),
                              );
                            },

                            itemCount: controller.listMediaSuggestEntity.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        MyContainerPublic(
                          backgroundColor: MyColor.nearDarkFb,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15
                          ),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: MyContainerPublic(
                                    onTap: () {
                                      controller.profileModalBottomSheet();
                                    },
                                    backgroundColor: MyColor.transparent,
                                    child: Image.asset(
                                      "assets/images/profile.png",
                                      scale: 6,
                                    ),
                                  )),
                              Expanded(
                                child: MyTextField(
                                  controller: controller.commentController,
                                  keyboardType: TextInputType.text,
                                  hintText: '',
                                  textAlign: TextAlign.right,
                                  validator: (value) => value?.publicValidate(),
                                  style: MyTextStyle.style(context: context, size: MyFontSize.small,
                                      weight: MyFontWeight.normal),
                                  onChange: (value){
                                    controller.updateController();
                                  },
                                  suffixIcon: controller.commentController.text.isEmpty?
                                      const SizedBox(): MyIconButton(
                                    icon: Icons.send,
                                    iconSize: 26,
                                    onTap: (){

                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        15.responseHeight.heightSpace,
                        SizedBox(
                          height: 300,
                          child: MyListViewVertical(
                            itemCount: 3,
                            height: 40,
                            child: MyContainerPublic(
                              backgroundColor: MyColor.nearDarkFb,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15
                              ),
                              margin: const EdgeInsets.symmetric(
                                vertical: 10
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: MyContainerPublic(
                                            onTap: () {
                                              controller.profileModalBottomSheet();
                                            },
                                            backgroundColor: MyColor.transparent,
                                            child: Image.asset(
                                              "assets/images/profile.png",
                                              scale: 6,
                                            ),
                                          )),
                                      Text("09123456789",
                                        style: MyTextStyle.style(
                                            context: context,
                                            size: MyFontSize.small,
                                            weight: MyFontWeight.bold),),
                                    ],
                                  ),
                                  const Divider(),
                                  Text("خنده دار",
                                    style: MyTextStyle.style(
                                        context: context,
                                        size: MyFontSize.small,
                                        weight: MyFontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
