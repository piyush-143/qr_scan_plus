import 'package:flutter/widgets.dart';
import 'dart:math';

class SizeConfig {
  static double screenWidth = 360;
  static double screenHeight = 800;
  static late Orientation orientation;

  static const double designWidth = 360;
  static const double designHeight = 800;

  /// Initializes the screen size parameters.
  static void init(BoxConstraints constraints, Orientation currentOrientation) {
    if (currentOrientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
    }
    orientation = currentOrientation;
  }
}

class AppSizer extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints, Orientation) builder;

  const AppSizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig.init(constraints, orientation);
        return builder(context, constraints, orientation);
      });
    });
  }
}

extension ResponsiveSize on num {
  /// Responsive Height: Scaled based on screen height
  double get h => (this / SizeConfig.designHeight) * SizeConfig.screenHeight;

  /// Responsive Width: Scaled based on screen width
  double get w => (this / SizeConfig.designWidth) * SizeConfig.screenWidth;

  /// Responsive Radius/FontSize: Scaled based on the smaller scale factor
  double get r {
    double scaleWidth = SizeConfig.screenWidth / SizeConfig.designWidth;
    double scaleHeight = SizeConfig.screenHeight / SizeConfig.designHeight;
    return this * min(scaleWidth, scaleHeight);
  }
}
