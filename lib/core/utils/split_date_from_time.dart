import 'package:competition/core/extensions/format_digital.dart';
import 'package:shamsi_date/shamsi_date.dart';

String extractDateTime(String input,) {
  // حذف "Jalali(" و ")" از رشته
  String cleanedString = input.replaceAll("Jalali(", "").replaceAll(")", "");

  // تقسیم کردن رشته به بخش‌های مختلف
  List<String> parts = cleanedString.split(", ");
  Jalali jalali=Jalali(int.parse(parts[0]),int.parse(parts[1]),int.parse(parts[2]));
  // اطمینان از وجود اطلاعات کافی
  if (parts.length >= 6) {
    String date = "${parts[0]}/${parts[1]}/${parts[2]}"; // تاریخ
    String time = "${parts[3]}:${parts[4]}:${parts[5]}"; // ساعت
    return "${jalali.formatJalaliToPersianYearMonthDayName} \t $time";
  } else {
    throw Exception("Invalid input format");
  }
}