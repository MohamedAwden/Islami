import 'package:flutter/material.dart';

extension fontext on BuildContext{
  TextTheme get appFonts => Theme.of(this).textTheme;
}
extension textFactor on num {
  get tx => WidgetsBinding.instance.platformDispatcher.textScaleFactor* this;

}