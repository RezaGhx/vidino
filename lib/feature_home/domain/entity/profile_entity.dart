class ProfileEntity {
  final UserEntity? user;
  final String? token;
  final bool? hasProfile;

  ProfileEntity({
    this.user,
    this.token,
    this.hasProfile,
  });

  ProfileEntity copyWith({
    UserEntity? user,
    String? token,
    bool? hasProfile,
  }) =>
      ProfileEntity(
        user: user ?? this.user,
        token: token ?? this.token,
        hasProfile: hasProfile ?? this.hasProfile,
      );

}

class UserEntity {
  final String? userId;
  final String? fullName;
  final String? phoneNumber;
  final List<String>? roles;
  final DateTime? birthDate;
  final String? gender;

  UserEntity({
     this.userId,
     this.fullName,
     this.phoneNumber,
     this.roles,
     this.birthDate,
     this.gender,
  });

  UserEntity copyWith({
    String? userId,
    String? fullName,
    String? phoneNumber,
    String? gender,
    List<String>? roles,
    DateTime? birthDate,
  }) =>
      UserEntity(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        roles: roles ?? this.roles,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
      );

}