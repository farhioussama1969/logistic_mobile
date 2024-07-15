import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/modules/home/controllers/home_controller.dart';

class SuccessOrderWindowComponent extends StatelessWidget {
  const SuccessOrderWindowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          width: 1.sw,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      StringsAssetsConstants.successOrderTitle,
                      style: TextStyles.mediumLabelTextStyle(context).copyWith(
                        color: MainColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                        .animate(delay: 200.ms)
                        .fadeIn(duration: 900.ms, delay: 300.ms)
                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                    SizedBox(height: 15.h),
                    Text(
                      StringsAssetsConstants.successOrderDescription,
                      style: TextStyles.largeBodyTextStyle(context),
                      textAlign: TextAlign.center,
                    )
                        .animate(delay: 200.ms)
                        .fadeIn(duration: 900.ms, delay: 300.ms)
                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                    SizedBox(height: 50.h),
                    SvgPicture.asset(
                      ImagesAssetsConstants.successOrderImage,
                      width: 0.9.sw,
                    )
                        .animate(delay: 400.ms)
                        .fadeIn(duration: 900.ms, delay: 300.ms)
                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButtonComponent(
                      onTap: () {
                        Get.back();
                        Get.back();
                        Get.back();
                        Get.find<HomeController>().refreshHome();
                      },
                      text: StringsAssetsConstants.done,
                    )
                        .animate(delay: 600.ms)
                        .fadeIn(duration: 900.ms, delay: 300.ms)
                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                    SizedBox(height: 50.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
