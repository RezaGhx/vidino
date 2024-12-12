import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/space.dart';
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
  const MyPosterFilms(
      {super.key,
      this.url,
      this.imageAssets,
      this.nameFilms,
      this.background,
      this.textDirection,
      this.style,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyContainerPublic(
      onTap: onTap,
      margin: EdgeInsets.symmetric(horizontal: 3.responseWidth),
      backgroundColor: background ?? MyColor.transparent,
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CacheImage(
            url: url,
            height: 80,
            imageAssets: imageAssets,
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
