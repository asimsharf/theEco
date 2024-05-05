import 'dart:convert';

import 'package:flutter/material.dart';

class ThePrettyJson {
  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('   ');

  // ANSI escape codes for colors
  static const String _resetColor = '\u001b[0m';

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
      final coloredJson = _colorizeKeys(
          _encoder.convert(parsedJson), convertKeyColor(keyColor));
      print(coloredJson);
    } catch (e) {
      print('Error: Invalid JSON format');
    }
  }

  /// Pretty print JSON map with customizable indentation
  static void prettyPrintJsonMap(
    Map<String, dynamic> jsonMap, {
    String indent = '   ',
    Color keyColor = Colors.blue,
  }) {
    final coloredJson =
        _colorizeKeys(_encoder.convert(jsonMap), convertKeyColor(keyColor));
    print(coloredJson);
  }

  /// Colorizes JSON keys with blue color
  static String _colorizeKeys(String json, String color) {
    final RegExp exp = RegExp(r'"(\w+)":');
    return json.replaceAllMapped(exp, (match) {
      return '$color{match.group(1)}$_resetColor:';
    });
  }

  /// Pretty print JSON dynamic with customizable indentation based on the type of input
  static void prettyPrintJsonDynamic(
    dynamic input, {
    String indent = '   ',
    Color keyColor = Colors.blue,
  }) {
    if (input is String) {
      prettyPrintJson(input, indent: indent, keyColor: keyColor);
    } else if (input is Map<String, dynamic>) {
      prettyPrintJsonMap(input, indent: indent, keyColor: keyColor);
    } else {
      print('Error: Input must be a JSON string or map');
    }
  }
}

void main() {
  const complexJsonString = '''
  {
    "name": "John",
    "age": 30,
    "cars": {
      "car1": {
        "model": "BMW",
        "year": 2018
      },
      "car2": {
        "model": "Audi",
        "year": 2016
      }
    }
  }
  ''';

  final complexJsonMap = {
    "name": "John",
    "age": 30,
    "cars": {
      "car1": {"model": "BMW", "year": 2018},
      "car2": {"model": "Audi", "year": 2016}
    }
  };

  ThePrettyJson.prettyPrintJson(complexJsonString, keyColor: Colors.blue);
  ThePrettyJson.prettyPrintJsonMap(complexJsonMap, keyColor: Colors.green);
  ThePrettyJson.prettyPrintJsonDynamic(complexJsonString, keyColor: Colors.red);
  ThePrettyJson.prettyPrintJsonDynamic(complexJsonMap, keyColor: Colors.yellow);
}
