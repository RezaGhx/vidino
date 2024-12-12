class GetProfileParam {
  final String userId;
  final String phoneNumber;
  final String fullname;
  final String gender;
  final DateTime birthDate;

  GetProfileParam({
    required this.userId,
    required this.phoneNumber,
    required this.fullname,
    required this.gender,
    required this.birthDate,
  });

  GetProfileParam copyWith({
    String? userId,
    String? phoneNumber,
    String? fullname,
    String? gender,
    DateTime? birthDate,
  }) =>
      GetProfileParam(
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        fullname: fullname ?? this.fullname,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
      );

  factory GetProfileParam.fromJson(Map<String, dynamic> json) => GetProfileParam(
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