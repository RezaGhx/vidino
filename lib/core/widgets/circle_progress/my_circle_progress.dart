import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:flutter/material.dart';
class MyCustomCircularProgressBar extends StatelessWidget {
  final double? value; // مقدار پراگرس بار (۰ تا ۱۰۰)

  const MyCustomCircularProgressBar({ this.value, super.key});

  @override
  Widget build(BuildContext context) {
    final percentage = (value! / 100).clamp(0.0, 1.0); // درصد بین ۰ و ۱
    final color = _getColorForValue(percentage); // رنگ بر اساس درصد

    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: percentage,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            backgroundColor: Colors.grey.shade300,
          ),
          Text(
            '${(percentage * 100).toInt()}%', // نمایش مقدار درصد
            style: MyTextStyle.style(context: context, size: MyFontSize.xSmall, weight: MyFontWeight.bold),
          ),
        ],
      ),
    );
  }

  // متد برای تغییر رنگ بر اساس مقدار
  Color _getColorForValue(double percentage) {
    if (percentage <= 0.5) {
      return Color.lerp(Colors.red, Colors.yellow, percentage * 2)!;
    } else {
      return Color.lerp(Colors.yellow, MyColor.primary, (percentage - 0.5) * 2)!;
    }
  }
}