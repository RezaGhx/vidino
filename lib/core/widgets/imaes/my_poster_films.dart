import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/widgets/circle_progress/my_circle_progress.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:competition/core/widgets/imaes/cache_image.dart';
import 'package:flutter/material.dart';

class MyPosterFilms extends StatelessWidget {
  final String? url;
  final String? imageAssets;
  final String? nameFilms;
  final Color? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Function()? onTap;
  final int? value;
  const MyPosterFilms(
      {super.key,
      this.url,
      this.imageAssets,
      this.nameFilms,
      this.background,
      this.textDirection,
      this.style,
        this.value,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyContainerPublic(
      onTap: onTap,
      margin: EdgeInsets.symmetric(horizontal: 3.responseWidth),
      backgroundColor: background ?? MyColor.transparent,
      width: value==null?160:290,
      height: value==null?null:250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          value==null?CacheImage(
      url: url,
        height: 90,
        imageAssets: imageAssets,
      ): Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: CacheImage(
                  url: url,
                  height: 130,
                  imageAssets: imageAssets,
                ),
              ),
              15.responseWidth.widthSpace,
              MyCustomCircularProgressBar(value: value!/1.0,)
            ],
          ),
          10.responseHeight.heightSpace,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              nameFilms ?? "",
              textDirection: textDirection,
              style:style?? MyTextStyle.style(
                  context: context,
                  size: MyFontSize.small,
                  weight: MyFontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
