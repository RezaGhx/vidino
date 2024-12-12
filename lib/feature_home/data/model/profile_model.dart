
import '../../domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity{

  ProfileModel({
    super.user,
    super.hasProfile,
    super.token,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
    hasProfile: json["hasProfile"],
  );

}
class UserModel extends UserEntity{


  UserModel({
    super.userId,
    super.fullName,
    super.phoneNumber,
    super.roles,
    super.birthDate,
  });



  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"]??"",
    fullName: json["fullName"]??"",
    phoneNumber: json["phoneNumber"]??"",
    birthDate: json["birthDate"]==null?null:DateTime.parse(json["birthDate"]),
  );

}