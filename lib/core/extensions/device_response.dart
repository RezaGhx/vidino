import 'package:flutter/material.dart';
import 'package:get/get.dart';
extension DeviceDimensions on int {
  double get responseHeight {
    return (this/MediaQuery.of(Get.context!).size.height)*MediaQuery.of(Get.context!).size.height;
  }

  double get responseWidth {
    return (this/MediaQuery.of(Get.context!).size.width)*MediaQuery.of(Get.context!).size.width;
  }

}
