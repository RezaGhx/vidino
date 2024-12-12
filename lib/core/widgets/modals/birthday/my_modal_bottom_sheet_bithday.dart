import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/buttons/my_button/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../../utils/date_persian.dart';
import '../my_modal_bottom_sheet.dart';

class MyModalBottomSheetBirthday extends StatefulWidget {
  final Function(Jalali)? onTap;
  String? datePicker;
  Jalali? selectDate;

  MyModalBottomSheetBirthday({super.key, this.onTap, this.selectDate});

  @override
  State<MyModalBottomSheetBirthday> createState() =>
      _MyModalBottomSheetBirthdayState();
}

class _MyModalBottomSheetBirthdayState
    extends State<MyModalBottomSheetBirthday> {

  @override
  Widget build(BuildContext context) {
    return MyModalBottomSheet(
      title: 'select_birthdate'.tr,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 14.responseHeight,
          horizontal: 16.responseWidth,
        ),
        child: MyContainerPublic(
          padding: EdgeInsets.symmetric(
            vertical: 15.responseHeight,
            horizontal: 15.responseWidth,
          ),
          backgroundColor: Get.theme.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 300,
                child: CupertinoPersionDatePicker(
                  type: 1,
                  selectDate: widget.selectDate,
                  onChange: (value) {
                    setState(() {
                      widget.datePicker = value;
                    });
                  },
                ),
              ),
              MyButton(
                title: "save_and_return".tr,
                expanded: true,
                size: MyButtonSize.small,
                onTap: () {
                  print(widget.datePicker);
                  widget.selectDate = widget.selectDate!.copy(
                    year: int.parse(widget.datePicker!.split("/")[0]),
                    month: int.parse(widget.datePicker!.split("/")[1]),
                    day: int.parse(widget.datePicker!.split("/")[2]),
                  );
                  widget.onTap!(widget.selectDate!);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoPersionDatePicker extends StatefulWidget {
  Function(String)? onChange;
  int? type;
  Jalali? selectDate;

  CupertinoPersionDatePicker(
      {super.key, this.onChange, this.type, this.selectDate});

  @override
  _CupertinoPersionDatePickerState createState() =>
      _CupertinoPersionDatePickerState();
}

class _CupertinoPersionDatePickerState
    extends State<CupertinoPersionDatePicker> {
  List<String> year = [];
  List<String> month = [];
  List<String> day = [];
  int selectedDay = 0;
  int selectedMonth = 0;
  int selectedYear = 0;

  @override
  void initState() {
    selectedYear = DatePersian.listYear(widget.type!).length;
    selectedMonth = DatePersian.month() - 1;
    year = DatePersian.listYear(widget.type!);
    month = DatePersian.listMonth();
    day = DatePersian.listDay(DatePersian.year(), DatePersian.month());
    selectedDay = DatePersian.toDay() - 1;

    setState(() {
      selectedYear = widget.selectDate!.year - 1300;
      selectedMonth = widget.selectDate!.month - 1;
      selectedDay = widget.selectDate!.day > 30
          ? widget.selectDate!.day
          : widget.selectDate!.day - 1;
    });
    super.initState();
  }

  changeDay() {
    int y = int.parse(year[selectedYear]);

    int m = selectedMonth + 1;
    day = DatePersian.listDay(y, m);
    if (day.length < selectedDay) {
      selectedDay = 0;
    }
    setState(() {});
    widget.onChange!('$y/${m.toString()}/${selectedDay + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.responseHeight,
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          CupertinoWidgetPicker(
            list: day,
            title: "day".tr,
            selected: selectedDay,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedDay = index;
                changeDay();
              });
            },
          ),
          const SizedBox(
            width: 40.0,
          ),
          CupertinoWidgetPicker(
            list: month,
            title: "month".tr,
            selected: selectedMonth,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedMonth = index;
                changeDay();
              });
            },
          ),
          const SizedBox(
            width: 40.0,
          ),
          CupertinoWidgetPicker(
            list: year,
            title: "year".tr,
            selected: selectedYear,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedYear = index;
                changeDay();
              });
            },
          ),
        ],
      ),
    );
  }
}

class CupertinoWidgetPicker extends StatelessWidget {
  List<String> list = [];
  int selected;
  void Function(int) onSelectedItemChanged;
  String? title;

  CupertinoWidgetPicker({
    required this.list,
    required this.title,
    required this.selected,
    required this.onSelectedItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title!,
            style: MyTextStyle.style(context: context,
                size: MyFontSize.medium, weight: MyFontWeight.bold),
          ),
          Expanded(
            child: CupertinoPicker.builder(
              itemExtent: 40,
              // useMagnifier: true,
              childCount: list.length,
              scrollController:
                  FixedExtentScrollController(initialItem: selected),
              onSelectedItemChanged: onSelectedItemChanged,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    list[index].toPersianDigit(),
                    style: MyTextStyle.style(context: context,
                        size: MyFontSize.medium, weight: MyFontWeight.normal),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
