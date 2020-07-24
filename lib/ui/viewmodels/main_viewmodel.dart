import 'package:flutter_modern_clock/app/locator.dart';
import 'package:flutter_modern_clock/services/clock_service.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends ReactiveViewModel {
  //Services Used
  final ClockService _clockService = locator<ClockService>();

  //Getters
  double get second => _clockService.second;
  double get minute => _clockService.minute;
  double get hour => _clockService.hour;
  String get time => _clockService.timeString;
  String get period => _clockService.timePeriod;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_clockService];
}
