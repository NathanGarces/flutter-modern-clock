import 'package:flutter/material.dart';
import 'package:flutter_modern_clock/ui/viewmodels/main_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'clock/clock.dart';

class ClockAndBackground extends ViewModelWidget<MainViewModel> {
  @override
  Widget build(BuildContext context, MainViewModel viewModel) {
    return Container(
        //Designed for 900 x 600
        width: 900,
        height: 600,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF24365A), Color(0xFF05060F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 30,
              child: BackgroundText(
                text: viewModel.time,
                fontSize:
                    (viewModel.hour % 12 <= 11.0 && viewModel.hour % 12 != 0)
                        ? 280
                        : 310,
                topPosition: 0,
                leftPosition: 30,
              )),
          Positioned(
              top: 300,
              left: 500,
              child: BackgroundText(
                text: viewModel.period,
                fontSize: 260,
                topPosition: 300,
                leftPosition: 500,
              )),
          Align(
            alignment: Alignment.center,
            child: Clock(
              second: viewModel.second,
              minute: viewModel.minute,
              hour: viewModel.hour,
            ),
          ),
        ]));
  }
}

class BackgroundText extends StatelessWidget {
  final String text;
  final double topPosition;
  final double leftPosition;
  final double fontSize;

  const BackgroundText(
      {Key key,
      @required this.text,
      this.topPosition,
      this.fontSize,
      this.leftPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Runtime Variable
    var textGradient = LinearGradient(
            colors: [Color(0xFFC4C4C4), Color(0xFFC4C4C4).withOpacity(0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
        .createShader(Rect.fromPoints(Offset(leftPosition, topPosition),
            Offset(leftPosition, this.topPosition + fontSize * 2)));

    return Container(
      width: 800,
      height: 400,
      child: Text(text,
          style: GoogleFonts.rubik(
              fontSize: fontSize, foreground: Paint()..shader = textGradient)),
    );
  }
}
