import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

/// Function creating the exit end enter aniamtions for the [ClockCounter] widgets
///
/// [controller] is the controller that plays the animations,
/// [keyframes] is the breakpoints for the animation,
/// [interval] is the [Interval] used to delay sequential number animations
Animation<double> setupTranslationY(AnimationController controller,
    List<Keyframe<double>> keyframes, Interval interval) {
  return Interpolation(keyframes: keyframes)
      .animate(CurvedAnimation(parent: controller, curve: interval));
}

/// Widget building the [AnimatedBuilder] for the clock face numbers.
class NumbersAnimation extends StatelessWidget {
  /// Widget building the [AnimatedBuilder] for the clock face numbers.
  NumbersAnimation({
    Key? key,
    this.child,
    required this.animationController,
    required this.keyframes,
    required Interval interval,
  })   : translationY =
            setupTranslationY(animationController, keyframes, interval),
        super(key: key);

  /// Animation for y translation.
  final Animation<double> translationY;

  /// Animation controller for the number animation.
  final AnimationController animationController;

  /// Child of this animation.
  final Widget? child;

  /// List of keyframes.
  final List<Keyframe<double>> keyframes;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([translationY]),
      child: child,
      builder: (context, widget) {
        return Transform.translate(
          offset: Offset(0, translationY.value),
          child: widget,
        );
      },
    );
  }
}
