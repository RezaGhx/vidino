import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/utils/my_check_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDropDown extends StatefulWidget {
  final String? dropdownValue;

  final List<String>? items;
  final Function(String)? onTapSelect;

  const MyDropDown(
      {super.key, this.dropdownValue, this.items, this.onTapSelect});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String dropdownValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = widget.dropdownValue ?? '';
  }
   _handleDropDownTap() {
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      return true;
    }

  }
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: MyColor.transparent, width: 1.0), // رنگ بوردِر عادی
          ),
        filled: true,
        fillColor: MyColor.nearShadeLightFb
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 5,
          underline: const SizedBox(),
          dropdownColor: MyColor.nearShadeLightFb,
          style: MyTextStyle.style(context: context,
              mode: myCheckTheme(context,MyColor.white, MyColor.black),
              size: MyFontSize.medium,
              weight: MyFontWeight.normal),
          onChanged:_handleDropDownTap()==true?null: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              widget.onTapSelect!(newValue);
            });
          },
          items: widget.items!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: MyTextStyle.style(context: context,
                    mode: myCheckTheme(context,MyColor.white, MyColor.black),
                    size: MyFontSize.medium,
                    weight: MyFontWeight.normal),
              ),
            );
          }).toList(),
        ),
      ),
    );

  }
}
