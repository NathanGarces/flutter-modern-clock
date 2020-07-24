import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

//Used to get the latest time and output it in specific formats.
@lazySingleton
class ClockService with ReactiveServiceMixin {
  RxValue<DateTime> _time = RxValue<DateTime>(initial: DateTime.now());
  double _second = DateTime.now().second as double;
  double _minute = DateTime.now().second as double;
  double _hour = DateTime.now().second as double;
  String _timeString = "00:00";
  String _timePeriod = "AM";

  ClockService() {
    listenToReactiveValues([_time]);

    Timer.periodic(Duration(seconds: 1), (timer) {
      _time.value = DateTime.now();
      updateTimes();
      updateStrings();
    });
  }

  void updateTimes() {
    _second = _time.value.second as double;
    _minute = _time.value.minute as double;
    _hour = _time.value.hour as double;
  }

  void updateStrings() {
    updateTimeString();
    updateTimePeriod();
  }

  //Getters
  double get second => _second;
  double get minute => _minute;
  double get hour => _hour;
  String get timeString => _timeString;
  String get timePeriod => _timePeriod;

  void updateTimeString() {
    _timeString = "${_getCurrentHour()}:${_getCurrentMinute()}";
  }

  void updateTimePeriod() {
    if (_hour < 12 || _hour == 24) {
      _timePeriod = "AM";
    } else {
      _timePeriod = "PM";
    }
  }

  String _getCurrentMinute() {
    if (_minute < 10) {
      return _minute.toString() + '0';
    }
    return _minute.toString();
  }

  String _getCurrentHour() {
    int temp = _time.value.hour;
    if (temp > 12) {
      temp %= 12;
    }

    if (temp == 0) {
      temp = 12;
    }

    if (temp < 10) {
      return '0$temp';
    } else {
      return temp.toString();
    }
  }
}
