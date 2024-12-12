import 'dart:ui';

import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/extensions/device_size.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';

class MyModalBottomSheet extends StatefulWidget {
  final String? title;
  final TextStyle? styleTitle;
  final Color? backGround;
  final EdgeInsetsGeometry? margin;
  final Widget? child;


  const MyModalBottomSheet(
      {super.key, this.title, this.styleTitle, this.child, this.backGround, this.margin});

  @override
  State<MyModalBottomSheet> createState() => _MyModalBottomSheetState();
}

class _MyModalBottomSheetState extends State<MyModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: MyContainerPublic(
        backgroundColor: widget.backGround ?? context.theme.backgroundColor.withOpacity(0.86),
        padding: EdgeInsets.zero,
        width: context.widthDevice,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),),
        margin:widget.margin ?? EdgeInsets.zero,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: context.widthDevice,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: MyColor.transparent,),
          
                child: Column(
                  children: [
                    const MyContainerPublic(
                      backgroundColor: MyColor.nearShadeLight,
                      height: 6,
                      width: 90,
                    ),
                    20.responseHeight.heightSpace,
                    Text(
                      widget.title ?? "",
                      style: widget.styleTitle ?? MyTextStyle.style(context: context,size: MyFontSize.medium, weight: MyFontWeight.bold),
                    ),
                  ],
                ),
              ),
              widget.child??const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
