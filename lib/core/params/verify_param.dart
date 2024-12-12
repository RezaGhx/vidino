class VerifyParam {
  final String userId;
  final String verifyCode;

  const VerifyParam({
    this.userId = '',
    this.verifyCode = '',
  });

  Map<String, String> get toJson => {
        "userId": userId,
        "verifyCode": verifyCode,
      };
}