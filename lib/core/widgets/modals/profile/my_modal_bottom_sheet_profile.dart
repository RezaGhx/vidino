import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/extensions/format_digital.dart';
import 'package:competition/core/extensions/space.dart';
import 'package:competition/core/extensions/validator.dart';
import 'package:competition/core/widgets/buttons/my_button/enum/my_button_size.dart';
import 'package:competition/core/widgets/drop_down/my_drop_down.dart';
import 'package:competition/feature_home/domain/entity/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:competition/core/extensions/device_response.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../../../config/resoureces/my_text_styles.dart';
import '../birthday/my_modal_bottom_sheet_bithday.dart';
import '../../buttons/my_button/my_button.dart';
import '../../text/my_text_field.dart';
import '../my_modal_bottom_sheet.dart';
import '../my_show_modal_bottom_sheets.dart';

class MyModalBottomSheetProfile extends StatefulWidget {
  final Function(UserEntity)? onTap;
  final UserEntity? userEntity;

  const MyModalBottomSheetProfile({
    super.key,
    this.onTap,
    this.userEntity,
  });

  @override
  State<MyModalBottomSheetProfile> createState() =>
      _MyModalBottomSheetProfileState();
}

class _MyModalBottomSheetProfileState extends State<MyModalBottomSheetProfile> {
  TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  Jalali? birthDate = Jalali.now();
  String dropdownValue = 'مرد';
  UserEntity userEntity = UserEntity();
  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  void initState() {
    super.initState();
    getFieldsUser();
  }

  getFieldsUser() {
    fullNameController.text = widget.userEntity!.fullName!;
    birthDate = widget.userEntity!.birthDate==null?Jalali.now():widget.userEntity!.birthDate!.toJalali();
    if(widget.userEntity!.birthDate!=null){
      birthdayController.text = widget.userEntity!.birthDate!.toJalali().formatJalaliToDateString;

    }
    if(widget.userEntity!.gender=="Male"){
      dropdownValue="مرد";
    }else{
      dropdownValue="زن";
    }
    setState(() {});
  }

  void selectBirthdayModalBottomSheet() {
    showMyModalBottomSheet(
      childModal: MyModalBottomSheetBirthday(
          selectDate: birthDate,
          onTap: (value) {
            Get.back();
            birthDate = value;
            birthdayController.text = value
                .toDateTime()
                .toPersianDate()
                .toString()
                .split(" ")[0]
                .replaceAll("-", "/");
            setState(() {});
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyModalBottomSheet(
      title: 'complete_profile'.tr,
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
                MyTextField(
                  controller: fullNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: "${'enter_first_name'.tr} ${"surname_name".tr}",
                  textAlign: TextAlign.center,
                  maxLength: 20,
                  style: MyTextStyle.style(context: context, size: MyFontSize.small,
                      weight: MyFontWeight.normal),
                  validator: (value) {
                    return value!.publicValidate();
                  },
                ),
                24.responseHeight.heightSpace,
                MyTextField(
                  controller: birthdayController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  hintText: ' 30 / 08 / 1370',
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  readOnly: true,
                  style: MyTextStyle.style(context: context, size: MyFontSize.small,
                      weight: MyFontWeight.normal),
                  onTap: () {
                    selectBirthdayModalBottomSheet();
                  },
                ),
                24.responseHeight.heightSpace,
                MyDropDown(
                  dropdownValue: dropdownValue,
                  onTapSelect: (value) {
                    dropdownValue = value;
                  },
                  items: ["مرد", "زن"],
                ),
                30.responseHeight.heightSpace,
                MyButton(
                  title: 'save_change'.tr,
                  expanded: true,
                  size: MyButtonSize.small,
                  onTap: () {
                    if (keyForm.currentState!.validate()) {
                      Get.back();
                      userEntity = userEntity.copyWith(
                        userId: widget.userEntity!.userId,
                        fullName: fullNameController.text,
                        birthDate: birthDate!.toDateTime(),
                        roles: widget.userEntity!.roles,
                        gender: dropdownValue == 'مرد' ? "Male" : 'Female',
                        phoneNumber: widget.userEntity!.phoneNumber,
                      );

                      widget.onTap!(userEntity);
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
