import 'dart:convert';

class ThePrettyJson {
  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('   ');

  // ANSI escape codes for colors
  static const String _resetColor = '\u001b[0m';
  static const String _blueColor = '\u001b[34m'; // Blue color for keys

  /// Pretty print JSON string with customizable indentation
  static void prettyPrintJson(String jsonString, {String indent = '   '}) {
    try {
      final dynamic parsedJson = _decoder.convert(jsonString);
      final coloredJson = _colorizeKeys(_encoder.convert(parsedJson));
      print(coloredJson);
    } catch (e) {
      print('Error: Invalid JSON format');
    }
  }

  /// Pretty print JSON map with customizable indentation
  static void prettyPrintJsonMap(Map<String, dynamic> jsonMap,
      {String indent = '   '}) {
    final coloredJson = _colorizeKeys(_encoder.convert(jsonMap));
    print(coloredJson);
  }

  /// Colorizes JSON keys with blue color
  static String _colorizeKeys(String json) {
    final RegExp exp = RegExp(r'"(\w+)":');
    return json.replaceAllMapped(exp, (match) {
      return '$_blueColor${match.group(1)}$_resetColor:';
    });
  }

  /// Pretty print JSON dynamic with customizable indentation based on the type of input
  static void prettyPrintJsonDynamic(dynamic input, {String indent = '   '}) {
    if (input is String) {
      prettyPrintJson(input, indent: indent);
    } else if (input is Map<String, dynamic>) {
      prettyPrintJsonMap(input, indent: indent);
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

  ThePrettyJson.prettyPrintJson(complexJsonString);
  ThePrettyJson.prettyPrintJsonMap(complexJsonMap);
  ThePrettyJson.prettyPrintJsonDynamic(complexJsonString);
  ThePrettyJson.prettyPrintJsonDynamic(complexJsonMap);
}
