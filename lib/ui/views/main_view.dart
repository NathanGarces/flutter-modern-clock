//Package Imports
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

//View Model Import
import 'package:flutter_modern_clock/ui/viewmodels/main_viewmodel.dart';

//Widget Imports
import 'package:flutter_modern_clock/widgets/clock/clock.dart';

class MainView extends StatelessWidget {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(
              body: Container(
                  width: size.width,
                  height: size.height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Clock()],
                  )),
            ),
        viewModelBuilder: () => MainViewModel());
  }
}
