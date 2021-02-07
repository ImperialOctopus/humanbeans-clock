import 'package:flutter/material.dart';

/// Screen shown while app is loading.
class LoadingScreen extends StatelessWidget {
  /// Screen shown while app is loading.
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('assets/images/Loading_Screen.png',
            fit: BoxFit.contain));
  }
}
