import 'package:flutter/cupertino.dart';

extension DeviceSize on BuildContext {
  double get heightDevice => MediaQuery.sizeOf(this).height;

  double get widthDevice => MediaQuery.sizeOf(this).width;
}
