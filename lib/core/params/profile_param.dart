class ProfileParam {
  final String userId;
  final String phoneNumber;
  final String fullname;
  final String gender;
  final DateTime birthDate;

  ProfileParam({
    required this.userId,
    required this.phoneNumber,
    required this.fullname,
    required this.gender,
    required this.birthDate,
  });

  ProfileParam copyWith({
    String? userId,
    String? phoneNumber,
    String? fullname,
    String? gender,
    DateTime? birthDate,
  }) =>
      ProfileParam(
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        fullname: fullname ?? this.fullname,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
      );

  factory ProfileParam.fromJson(Map<String, dynamic> json) => ProfileParam(
    userId: json["userId"],
    phoneNumber: json["phoneNumber"],
    fullname: json["fullname"],
    gender: json["gender"],
    birthDate: DateTime.parse(json["birthDate"]),

  );

  Map<String, dynamic> get toJson => {
    "userId": userId,
    "phoneNumber": phoneNumber,
    "fullname": fullname,
    "gender": gender,
    "birthDate": "${birthDate.toIso8601String()}Z",
  };
}