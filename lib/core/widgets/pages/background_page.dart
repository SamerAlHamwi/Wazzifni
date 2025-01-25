

import 'package:flutter/material.dart';
import 'package:wazzifni/core/constants/app_assets.dart';

class BackgroundPage extends StatelessWidget {
  final Widget body;

  const BackgroundPage({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: IgnorePointer( // Ensures the image doesn't interact with inputs
              child: Image.asset(
                AppAssets.background,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Body content
          Positioned.fill(
            child: body
          ),
        ],
      ),
    );
  }
}
