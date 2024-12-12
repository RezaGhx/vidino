import 'package:shamsi_date/shamsi_date.dart';
import 'package:get/get.dart';
class DatePersian {
  static toDay() {
    return Jalali.now().day;
  }

  static month() {
    return Jalali.now().month;
  }

  static year() {
    return Jalali.now().year;
  }

  static listYear(int type) {
    Jalali jalali = Jalali.now();
    List<String> list = [];
    int year=0,start=0;
    if(type==0){
      start=jalali.year-51;
      year=jalali.year-17;
    }else{
      start=1300;
      year=jalali.year;
    }
    for (; start <= year; start++) {
      list.add(start.toString());
    }
    return list;
  }

  static listMonth() {
    List<String> list = [
      "farvardin".tr,
      "ordibehesht".tr,
      "khordad".tr,
      "tir".tr,
      "mordad".tr,
      "shahrivar".tr,
      "mehr".tr,
      "aban".tr,
      "azar".tr,
      "dey".tr,
      "bahman".tr,
      "esfand".tr,
    ];

    return list;
  }

  static listDay(int year, int month) {
    Jalali jalali = Jalali(year, month);
    List<String> list = [];
    for (int i = 1; i <= jalali.monthLength; i++) {
      list.add(i.toString());
    }
    return list;
  }
}