class VerifyEntity {
  final String token;
  final bool isRegistered;

  const VerifyEntity({
    this.token = '',
    this.isRegistered = false,
  });

  VerifyEntity copyWith({
    String? token,
    bool? isRegistered,
  }) {
    return VerifyEntity(
      token: token ?? this.token,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}
