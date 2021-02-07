import 'dart:math';

/// Class that holds the values for the [_birdControl] animations and provides functionality to choose random animaiton.
///
/// The class has methods to return the enter and exit animations as well as one that choses
/// animation from the list of animations that can fit in in a time frame.
class BirdAnimations {
  /// The hame of the enter animation.
  final String _flyInAnimation = 'Flying_in';

  /// The name of the exit animation.
  final String _flyOutAnimation = 'Flying_Away';

  /// List with the the rest of the animations that are going to play a random.
  ///
  /// The durations of the animations are given in milliseconds.
  final List<AnimationReference> _transitAnimations = const [
    AnimationReference(name: 'Nap', duration: 20000),
    AnimationReference(name: 'Grooming', duration: 3150),
    AnimationReference(name: 'Wing_span', duration: 1520),
    AnimationReference(name: 'Wings_Move', duration: 2400),
    AnimationReference(name: 'Head_move', duration: 4130),
  ];

  /// Get the name of the enter animation.
  String getFlyIn() {
    return _flyInAnimation;
  }

  /// Get the name of the exit animation.
  String getFlyOut() {
    return _flyOutAnimation;
  }

  /// Get the name of a random animation that can fit in the [timeLeft] argument.
  ///
  /// If there's no animations that can fit, return null.
  String? getRandom(int timeLeft) {
    // Filter the animatons on animation duration < [timeLeft] argument.
    final possibleAnimations = _transitAnimations
        .where((animation) => animation.duration < timeLeft)
        .toList();

    if (possibleAnimations.isEmpty) {
      return null;
    }

    // Return random animation form the filtered list
    return possibleAnimations[Random().nextInt(possibleAnimations.length)].name;
  }
}

/// Reference to an animation by name and duration.
class AnimationReference {
  /// Name of the animation.
  final String name;

  /// Duration of the animation in milliseconds.
  final int duration;

  /// Reference to an animation by name and duration.
  const AnimationReference({required this.name, required this.duration});
}
