import 'package:competition/feature_verification/domain/entity/verify_entity.dart';

class VerifyModel extends VerifyEntity {
  VerifyModel({
    super.token,
    super.isRegistered,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(
      token: json['token'],
      isRegistered: json['isRegistered'],
    );
  }
}
