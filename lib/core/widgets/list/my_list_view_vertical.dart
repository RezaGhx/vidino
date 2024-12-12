import 'package:competition/core/extensions/device_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/resoureces/my_color.dart';
import '../containers/my_container_public.dart';

class MyListViewVertical extends StatelessWidget {
  final Color? backgroundColor;
  final int? itemCount;
  final Widget? child;
  final double? width;
  final double? height;

  const MyListViewVertical(
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
      child: Expanded(
        child: ListView.builder(
          itemCount: itemCount ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return child;
          },
        ),
      ),
    );
  }
}
