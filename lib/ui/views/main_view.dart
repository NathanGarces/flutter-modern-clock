import 'package:flutter/material.dart';
import 'package:flutter_modern_clock/ui/viewmodels/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(),
        viewModelBuilder: () => MainViewModel());
  }
}
