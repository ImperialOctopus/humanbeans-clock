import 'dart:ui';

import 'package:flutter/material.dart' hide Image;

import 'clock_ui_inherited_model.dart';
import 'layers_layout.dart';
import 'loading_screen.dart';
import 'texture_painter.dart';

/// Class to wrap all the display widgets in [AspectRatio] and hold the [FutureBuilder].
///
/// The [FutureBuilder] resolves when the [dart:ui.Image] load and dispalys the clock face.
/// Before that shows a loading screen
class SceneLayout extends StatelessWidget {
  /// Class to wrap all the display widgets in [AspectRatio] and hold the [FutureBuilder].
  const SceneLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AspectRatio(
            aspectRatio: 5 / 3,
            child: FutureBuilder(
                // Subscibes to the 'iamgesFuture' to the [ClockUiInheritedModel]. Should't trigger
                // rebuild.
                future: ClockUiInheritedModel.of(context, 'imagesFuture')
                    .imagesFuture,
                // Resolves when the [dart:ui.Image] load
                builder: (BuildContext c, AsyncSnapshot<List<Image>> snapshot) {
                  // If the future has resolved
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return
                        // Paint the textures over all the ui widgets
                        // We use [CustomPaint] to get the [ColorBlend] mode for
                        // the textures
                        CustomPaint(
                      foregroundPainter: TexturePainter(
                        screenTexture: snapshot.data![0],
                        multiplyTexture: snapshot.data![1],
                      ),
                      child: const LayersLayout(),
                    );
                    // If still loading
                  } else {
                    // Display the loading screen
                    return const LoadingScreen();
                  }
                })));
  }
}
