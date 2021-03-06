import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

import 'branch_animation.dart';
import 'clock_ui_inherited_model.dart';
import 'leaf.dart';

/// Widget that holds the elements for the bottom left "branch"
///
/// All the widgets in the class are aligned to the bottom left
/// and are scaled
class BottomLeftBranch extends StatelessWidget {
  /// Widget that holds the elements for the bottom left "branch"
  const BottomLeftBranch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// We get the model here to avoid going up the three in each of the widget
    ///
    /// We use the model for the [Utils] class, which scales the widgets with absolute
    /// dimentions. The size aspect of the model should change only on screen resize,
    /// so the widget should not rebuild
    final model = ClockUiInheritedModel.of(context, 'size');

    return SizedBox(
      width: model.utils.scaleDimensions(320),
      height: model.utils.scaleDimensions(270),
      child: BranchAnimation(
        animationController: model.idleAnimation,
        keyframes: <Keyframe<double>>[
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.9, value: 0.09),
          Keyframe<double>(fraction: 1, value: 0)
        ],
        interval: const Interval(0, 1, curve: Curves.easeOutQuad),
        transformOrigin: const FractionalOffset(0, 0.3),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Positioned(
            left: model.utils.scaleDimensions(216),
            bottom: model.utils.scaleDimensions(45),
            child: BranchAnimation(
              animationController: model.idleAnimation,
              keyframes: <Keyframe<double>>[
                Keyframe<double>(fraction: 0, value: 0),
                Keyframe<double>(fraction: 0.9, value: -0.03),
                Keyframe<double>(fraction: 1, value: 0)
              ],
              interval: const Interval(0, 1, curve: Curves.easeOutQuad),
              transformOrigin: const FractionalOffset(0.2, 1),
              child: Container(
                width: model.utils.scaleDimensions(87),
                height: model.utils.scaleDimensions(114),
                child: Image.asset(
                  'assets/images/Pngs_Flat_0008_F_B_Left_2.png',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: model.utils.scaleDimensions(301),
              height: model.utils.scaleDimensions(171),
              color: Colors.transparent,
              child: Image.asset('assets/images/Pngs_Flat_0007_F_B_Left.png',
                  fit: BoxFit.contain),
            ),
          ),
          Leaf(
            index: 0,
            bottom: 11,
            left: 163,
            width: 56,
            height: 79,
            offset: const FractionalOffset(0.3, 0),
            imageUri: 'assets/images/Pngs_Flat_0006_F_Leaf_L_3.png',
            keyframes: <Keyframe<double>>[
              Keyframe<double>(fraction: 0, value: 0),
              Keyframe<double>(fraction: 0.9, value: -0.09),
              Keyframe<double>(fraction: 1, value: 0)
            ],
          ),
          Leaf(
            index: 1,
            bottom: 27,
            left: 20,
            width: 86,
            height: 91,
            offset: const FractionalOffset(0.3, 0),
            imageUri: 'assets/images/Pngs_Flat_0005_F_Leaf_L_2.png',
            keyframes: <Keyframe<double>>[
              Keyframe<double>(fraction: 0, value: 0),
              Keyframe<double>(fraction: 0.9, value: -0.09),
              Keyframe<double>(fraction: 1, value: 0)
            ],
          ),
          Leaf(
            index: 2,
            left: 73,
            bottom: 165,
            width: 86,
            height: 88,
            offset: const FractionalOffset(0.09, 0.95),
            imageUri: 'assets/images/Pngs_Flat_0004_F_Leaf_L_1.png',
            keyframes: <Keyframe<double>>[
              Keyframe<double>(fraction: 0, value: 0),
              Keyframe<double>(fraction: 0.9, value: -0.09),
              Keyframe<double>(fraction: 1, value: 0)
            ],
          ),
        ]),
      ),
    );
  }
}
