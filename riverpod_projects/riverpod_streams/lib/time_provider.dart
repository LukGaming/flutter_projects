import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StreamProvider<HourMinute>((ref) async* {
  var dateTime = DateTime.now();

  yield HourMinute(dateTime.hour.toString(), dateTime.second.toString(),
      dateTime.second.toString());

  final controller = StreamController<HourMinute>();
  Timer.periodic(const Duration(seconds: 1), (timer) {
    dateTime = DateTime.now();
    controller.add(HourMinute(dateTime.hour.toString(),
        dateTime.minute.toString(), dateTime.second.toString()));
  });

  await for (final value in controller.stream) {
    yield value;
  }
});

class HourMinute {
  final String hours;
  final String minutes;
  final String seconds;

  HourMinute(this.hours, this.minutes, this.seconds);

  @override
  String toString() {
    return "$hours:$minutes::$seconds";
  }
}
