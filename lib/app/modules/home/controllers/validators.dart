import 'package:get/utils.dart';

/// Validate email address
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return '';
  }

  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return '';
  }

  if (!value.isEmail) {
    return '';
  }
  return null;
}

/// Validate password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return '';
  }

  if (value.length < 6) {
    return '';
  }

  return null;
}

/// Validate name
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return '';
  }

  if (value.length < 3) {
    return '';
  }

  return null;
}

/// Validate phone number
String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return '';
  }

  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return '';
  }

  return null;
}
