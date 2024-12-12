import 'package:flutter/cupertino.dart';

extension Space on double {
  SizedBox get heightSpace => SizedBox(height: this);

  SizedBox get widthSpace => SizedBox(width: this);
}
