import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class GlassMorphismComponent extends StatelessWidget {
  const GlassMorphismComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MainColors.backgroundColor(context)!.withOpacity(0.2),
                MainColors.backgroundColor(context)!.withOpacity(0.1),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
        ),
      ),
    );
  }
}
