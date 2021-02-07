import 'package:flutter/material.dart';

/// Class that provides functionality to scale the absolute sizes relative to an "ideal" screen
///
/// We use the 480x800 dp screen as baseline to calculate percentage ratio toa scale widgets that
/// need it.
/// It's possible because of the fixed aspect ratio of the app
class Utils {
  /// Ratio from baseline to scale by.
  final double ratio;

  /// Class that provides functionality to scale the absolute sizes relative to an "ideal" screen
  Utils({required BuildContext context}) : ratio = calculateRatio(context);

  /// Scale given [size] by [this.ratio]
  double scaleDimensions(double size) {
    return size * ratio;
  }
}

/// Function that calculates the ratio
double calculateRatio(BuildContext context) {
  // Get hold of the screen size
  final size = MediaQuery.of(context).size;

  // [preferredHeight] the height the device would have to have to fit the [AspectRatio] box full width
  final preferredHeight = size.width / 5 * 3;

  // if the [size.height] is smaller than the [prefferedHeight] then [size.height] is restricting the box otherwise it's the [size.width]
  if (preferredHeight > size.height) {
    return size.height / 480;
  } else {
    return size.width / 800;
  }
}
