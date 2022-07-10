import 'package:get/get.dart';

mixin FormValidator {
  String? fieldCantEmpty(
    String? input, {
    String fieldName = 'Field',
    String? overrideErrorText,
  }) {
    if (input?.isNotEmpty == true) {
      return null;
    }
    return overrideErrorText ?? '$fieldName not empty';
  }

  String? validatePhoneNumber(
    String? input, {
    String fieldName = 'Phone number',
  }) {
    if (input == null || input.isEmpty)
      return fieldCantEmpty(input, fieldName: fieldName);
    if (GetUtils.isPhoneNumber(input)) {
      return null;
    }
    return 'Please enter a valid phone number.';
  }

  String? validateEmail(
    String? input, {
    String fieldName = 'Email',
  }) {
    if (input == null || input.isEmpty)
      return fieldCantEmpty(input, fieldName: fieldName);
    if (GetUtils.isEmail(input)) {
      return null;
    }
    return 'Please enter a valid email.';
  }

  String? validatePass(
    String? input, {
    String fieldName = 'Password',
  }) {
    return null;
    // if (input == null || input.isEmpty) return fieldCantEmpty(input, fieldName: fieldName);
    // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    // if (regex.hasMatch(input)) {
    //   return null;
    // }
    // return 'Please enter a valid $fieldName.';
  }
}
