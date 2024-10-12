import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension LocaledDataExtension on LocaledData {
  String get toLocale {
    Get.locale ??= const Locale('en');
    bool isEnglish = Get.locale!.languageCode == 'en';
    return (isEnglish ? english : arabic);
  }

  String get toArabic {
    return arabic;
  }

  String get toEnglish {
    return english;
  }
}

class LocaledData {
  final String arabic;
  final String english;

  LocaledData({
    required this.arabic,
    required this.english,
  });

  Map<String, dynamic> toMap() {
    return {
      'arabic': arabic,
      'english': english,
    };
  }

  factory LocaledData.fromMap(Map<String, dynamic> map) {
    return LocaledData(
      arabic: map['arabic'],
      english: map['english'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocaledData.fromJson(String source) {
    return LocaledData.fromMap(json.decode(source));
  }

  LocaledData copyWith({String? arabic, String? english}) {
    return LocaledData(
      arabic: arabic ?? this.arabic,
      english: english ?? this.english,
    );
  }

  @override
  String toString() => 'LocaledData(arabic: $arabic, english: $english)';
}
