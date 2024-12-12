import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:competition/config/resoureces/my_color.dart';

import '../../../config/resoureces/my_color.dart';

class MyButtonLoading extends StatelessWidget {
  const MyButtonLoading({
    super.key,
    this.color = MyColor.white,
    this.size = 24,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: size,
    );
  }
}
