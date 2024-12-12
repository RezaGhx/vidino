extension StringExtension on String {
  String myCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}