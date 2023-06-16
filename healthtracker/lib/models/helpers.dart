import 'dart:math';

enum DateTime {
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
}

class DateTimes {
  final String name;
  final DateTime type;

  DateTimes({
    required this.name,
    required this.type,
  });
}

final List<DateTimes> datetime = [
  DateTimes(
    name: 'Mon',
    type: DateTime.mon,
  ),
  DateTimes(
    name: 'Tue',
    type: DateTime.tue,
  ),
  DateTimes(
    name: 'Wed',
    type: DateTime.wed,
  ),
  DateTimes(
    name: 'Thu',
    type: DateTime.thu,
  ),
  DateTimes(
    name: 'Fri',
    type: DateTime.fri,
  ),
  DateTimes(
    name: 'Sat',
    type: DateTime.sat,
  ),
];

int randBetween(int min, int max) {
  return Random().nextInt(max - min) + min;
}

String formatNumber(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}
