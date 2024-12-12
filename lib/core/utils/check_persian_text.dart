bool isTextPersian(String input) {
  // بررسی وجود کاراکتر فارسی
  final RegExp persianRegex = RegExp(r'[\u0600-\u06FF]');
  return persianRegex.hasMatch(input);
}