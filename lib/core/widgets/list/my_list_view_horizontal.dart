import 'package:competition/core/extensions/device_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/resoureces/my_color.dart';
import '../containers/my_container_public.dart';

class MyListViewHorizontal extends StatelessWidget {
  final Color? backgroundColor;
  final int? itemCount;
  final Widget? child;
  final double? width;
  final double? height;

  const MyListViewHorizontal(
      {super.key,
      this.backgroundColor,
      this.itemCount,
      this.child,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return MyContainerPublic(
      backgroundColor: backgroundColor ?? MyColor.transparent,
      width: width ?? context.width,
      height: height,
      child: ListView.builder(
        itemCount: itemCount ?? 0,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return child;
        },
      ),
    );
  }
}
