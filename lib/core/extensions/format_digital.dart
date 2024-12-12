import 'package:shamsi_date/shamsi_date.dart';

extension IntegerExtensions on int {
  String get formatToDoubleDigit {
    return this < 2 ? '0$this' : '$this';
  }
}

extension StringExtensions on String {
  String get formatToDoubleDigit {
    return this.length < 2 ? '0$this' : '$this';
  }
}

extension JalaliToGregorian on Gregorian {
  String get formatJalaliToGregorian {
    return '${formatter.yyyy}-${formatter.mm}-${formatter.dd}';
  }
}

extension JalaliToDateString on Jalali {
  String get formatJalaliToDateString{
    return '${formatter.yyyy}/${formatter.mm}/${formatter.dd}';
  }
  String get formatJalaliToDateNotDayString{
    return '${formatter.yyyy}/${formatter.mm}';
  }
  String get formatJalaliToPersianMothDay{
    return '${formatter.dd} ${formatter.mN}';
  }
  String get formatJalaliToPersianYearMonth{
    return '${formatter.mN} ${formatter.yyyy}';
  }
  String get formatJalaliToPersianYearMonthDayName{
    return '${formatter.wN} ${formatter.mN} ${formatter.yyyy}';
  }
}
