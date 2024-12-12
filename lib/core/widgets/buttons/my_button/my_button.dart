import 'package:flutter/material.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_type.dart';
import 'package:competition/core/widgets/buttons/my_button/styles/cal_btn.dart';
import 'package:competition/core/widgets/buttons/my_button/styles/common_btn.dart';
import 'package:competition/core/widgets/buttons/my_button/styles/square_btn.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onTap,
    this.type = MyButtonType.btnDefault,
    this.expanded = false,
    this.size = MyButtonSize.medium,
    this.icon,
    this.title = '',
    this.isLoading = false,
  });

  final MyButtonType type;
  final MyButtonSize size;
  final IconData? icon;
  final void Function()? onTap;
  final String title;
  final bool expanded;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? 0.7 : 1,
      child: switch (type) {
        MyButtonType.btnCalDefault || MyButtonType.btnCalOutline => CalBtn(
            onTap: onTap,
            type: type,
            expanded: expanded,
            title: title,
            isLoading: isLoading,
          ),
        MyButtonType.btnSquareOutline => SquareBtn(
            onTap: onTap,
            type: type,
            icon: icon,
            title: title,
            isLoading: isLoading,
          ),
        _ => CommonBtn(
            onTap: onTap,
            type: type,
            expanded: expanded,
            size: size,
            icon: icon,
            title: title,
            isLoading: isLoading,
          ),
      },
    );
  }
}
