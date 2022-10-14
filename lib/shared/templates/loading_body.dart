import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app_assets.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
          color: AppAssets.magenta, size: 200),
    );
  }
}
