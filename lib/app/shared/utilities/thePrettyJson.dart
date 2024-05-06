import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class ThePrettyJson {
  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('   ');

  static String convertKeyColor(Color color) {
    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;
    return '\u001b[38;2;$r;$g;$b;1m';
  }

  /// Pretty print JSON string with customizable indentation
  static void prettyPrintJson(
    String jsonString, {
    String indent = '   ',
    Color keyColor = Colors.blue,
  }) {
    try {
      final dynamic parsedJson = _decoder.convert(jsonString);

      log(_encoder.convert(parsedJson));
    } catch (e) {
      log('Error: Invalid JSON format');
    }
  }

  /// Pretty print JSON map with customizable indentation
  static void prettyPrintJsonMap(
    Map<String, dynamic> jsonMap, {
    String indent = '   ',
  }) {
    log(_encoder.convert(jsonMap));
  }

  /// Pretty print JSON dynamic with customizable indentation based on the type of input
  static void prettyPrintJsonDynamic(
    dynamic input, {
    String indent = '   ',
    Color keyColor = Colors.blue,
  }) {
    if (input is String) {
      prettyPrintJson(input, indent: indent);
    } else if (input is Map<String, dynamic>) {
      prettyPrintJsonMap(input, indent: indent);
    } else {
      log('Error: Input must be a JSON string or map');
    }
  }
}
