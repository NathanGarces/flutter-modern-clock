import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  //View Variables
  double _second = DateTime.now().second as double;
  double _minute = DateTime.now().minute as double;
  double _hour = 10.0;
  String _time = "10:00";

  //Getters
  double get second => _second;
  double get minute => _minute;
  double get hour => _hour;
  String get time => _time;
}
