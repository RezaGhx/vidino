import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyPopMenu extends StatelessWidget {
  List<String>? choices;
  void Function(String)? onSelected;

  MyPopMenu({this.onSelected, this.choices});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: context.theme.backgroundColor.withOpacity(1),
      onSelected: onSelected,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context) {
        return choices!.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice,
              style: MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.bold, ),
            ),
          );
        }).toList();
      },
    );
  }
}