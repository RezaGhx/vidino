import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/drop_down/my_drop_down.dart';
import 'package:competition/feature_home/domain/entity/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../buttons/my_button/my_button.dart';
import '../my_modal_bottom_sheet.dart';

class MyModalBottomSheetFilter extends StatefulWidget {
  final Function(String)? onTap;

  const MyModalBottomSheetFilter({
    super.key,
    this.onTap,
  });

  @override
  State<MyModalBottomSheetFilter> createState() =>
      _MyModalBottomSheetFilterState();
}

class _MyModalBottomSheetFilterState extends State<MyModalBottomSheetFilter> {
  Jalali? birthDate = Jalali.now();
  String dropdownValueCategory = 'دفاع مقدس';
  String dropdownValueYear = '1403';
  String dropdownValueCountry = 'ایران';
  UserEntity userEntity = UserEntity();
  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyModalBottomSheet(
      title: '',
      child: Form(
        key: keyForm,
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
            backgroundColor: context.theme.backgroundColor,
            child: Column(
              children: [
                MyDropDown(
                  dropdownValue: dropdownValueCategory,
                  onTapSelect: (value) {
                    dropdownValueCategory = value;
                  },
                  items: ["دفاع مقدس","فرهنگی","اجتماعی","آموزشی", "تاریخ انقلاب"],
                ),
                24.responseHeight.heightSpace,
                MyDropDown(
                  dropdownValue: dropdownValueYear,
                  onTapSelect: (value) {
                    dropdownValueYear = value;
                  },
                  items: ["1402", "1403"],
                ),
                24.responseHeight.heightSpace,
                MyDropDown(
                  dropdownValue: dropdownValueCountry,
                  onTapSelect: (value) {
                    dropdownValueCountry = value;
                  },
                  items: ["فرانسه", "ایران"],
                ),
                30.responseHeight.heightSpace,
                MyButton(
                  title: 'save_change'.tr,
                  expanded: true,
                  size: MyButtonSize.small,
                  onTap: () {
                    if (keyForm.currentState!.validate()) {
                      Get.back();

                      widget.onTap!("");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
