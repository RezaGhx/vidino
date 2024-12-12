import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/extensions/validator.dart';
import 'package:competition/core/widgets/back_ground/my_background.dart';
import 'package:competition/feature_filter/presentation/controller/filter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/resoureces/my_color.dart';
import '../../../config/resoureces/my_text_styles.dart';
import '../../../core/widgets/app_bar/my_app_bar.dart';
import '../../../core/widgets/buttons/my_icon_button.dart';
import '../../../core/widgets/containers/my_container_public.dart';
import '../../../core/widgets/imaes/my_poster_films.dart';
import '../../../core/widgets/text/my_text_field.dart';

class FilterScreen extends GetView<FilterController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (_) {
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
            color: MyColor.nearShadeDarkFb,
            child: Column(
              children: [
                ///Filter
                MyContainerPublic(
                  backgroundColor: MyColor.slightlyDarker,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContainerPublic(
                        backgroundColor: MyColor.primary,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        onTap: () {
                          controller.filterModalBottomSheet();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.filter_list_alt),
                            Text(
                              "فیلتر",
                              style: MyTextStyle.style(
                                context: context,
                                size: MyFontSize.small,
                                weight: MyFontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      10.responseHeight.heightSpace,
                      MyContainerPublic(
                        backgroundColor: MyColor.nearShadeLightFb,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: context.width,
                        onTap: () {},
                        alignment: Alignment.center,
                        child: Text(
                          "حذف فیلتر",
                          style: MyTextStyle.style(
                            context: context,
                            size: MyFontSize.small,
                            weight: MyFontWeight.bold,
                          ),
                        ),
                      ),
                      10.responseHeight.heightSpace,
                      MyTextField(
                        controller: controller.searchController,
                        keyboardType: TextInputType.text,
                        hintText: '',
                        textAlign: TextAlign.right,
                        validator: (value) => value?.publicValidate(),
                        suffixIcon: const Icon(Icons.search),
                      ),
                      10.responseHeight.heightSpace,
                      MyContainerPublic(
                        backgroundColor: MyColor.nearShadeLightFb,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "فیلم",
                              style: MyTextStyle.style(
                                context: context,
                                size: MyFontSize.small,
                                weight: MyFontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.close),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.responseHeight.heightSpace,
                ///Grid List view
                GridView.builder(
                  itemCount: 12,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return  MyPosterFilms(
                      imageAssets: 'assets/images/poster2.jpg',
                      nameFilms: "پوستر فیلم",
                      textDirection: TextDirection.rtl,
                      style:MyTextStyle.style(
                          context: context,
                          size: MyFontSize.xSmall,
                          weight: MyFontWeight.normal),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
