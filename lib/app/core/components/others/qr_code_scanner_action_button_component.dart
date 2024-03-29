import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class QrCodeScannerActionButtonComponent extends StatelessWidget {
  const QrCodeScannerActionButtonComponent(
      {super.key, required this.iconPath, this.onTap});

  final String iconPath;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onTap != null)
          ? () {
              if (onTap != null) {
                onTap!();
              }
            }
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.r, sigmaY: 10.r),
          child: Container(
            height: 55.r,
            width: 55.r,
            decoration: BoxDecoration(
              color: MainColors.whiteColor.withOpacity(0.3),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 30.r,
                color: MainColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
