import 'package:flutter/foundation.dart';

dynamic myCheckPlatform(dynamic isAndroid, dynamic isIos) {
  return defaultTargetPlatform == TargetPlatform.android ? isAndroid : isIos;
}
