import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(color: context.theme.primaryColor);
  }
}
