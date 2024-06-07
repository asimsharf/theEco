import 'package:intl/intl.dart';

extension DateExtension on String {
  String get toReadableDate {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  String get toReadableDateTime {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('dd MMM yyyy, HH:mm');
    return formatter.format(date);
  }

  String get toReadableTime {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  String get toReadableMonth {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('MMMM yyyy');
    return formatter.format(date);
  }

  String get toReadableYear {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('yyyy');
    return formatter.format(date);
  }

  String get toReadableDay {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('EEEE');
    return formatter.format(date);
  }

  String get toReadableShortDay {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('E');
    return formatter.format(date);
  }

  String get toReadableShortMonth {
    final DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat('MMM');
    return formatter.format(date);
  }
}
