import '../constants/app/application_contants.dart';

extension StringExtension on String {
  bool get isValidEmail => RegExp(ApplicationConstants.emailRegex).hasMatch(this);
}
