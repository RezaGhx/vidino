import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../extensions/device_response.dart';

class MyIconAppBar extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;

  const MyIconAppBar({super.key, this.onTap, this.icon, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.only(left: 17.responseWidth),
          child: Icon(
            icon,
            size: 27,
          ),
        ));
  }
}
