import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/others/shimmer_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class TransactionShimmerComponent extends StatelessWidget {
  const TransactionShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(
          start: 25.w, top: 15.h, bottom: 15.h, end: 20.w),
      decoration: BoxDecoration(
        color: MainColors.backgroundColor(context),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: MainColors.shadowColor(context)!.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: ShimmerComponent(
                    child: Container(
                      width: 35.r,
                      height: 35.r,
                      color: MainColors.backgroundColor(context),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: ShimmerComponent(
                            child: Container(
                              width: 140.r,
                              height: 16.r,
                              color: MainColors.backgroundColor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: ShimmerComponent(
                            child: Container(
                              width: 110.r,
                              height: 11.r,
                              color: MainColors.backgroundColor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: ShimmerComponent(
                            child: Container(
                              width: 80.r,
                              height: 15.r,
                              color: MainColors.backgroundColor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 5.w),
                  child: ShimmerComponent(
                    child: SvgPicture.asset(
                      Get.locale?.languageCode == 'ar'
                          ? IconsAssetsConstants.arrowLeftIcon
                          : IconsAssetsConstants.arrowRightIcon,
                      width: 30.r,
                      color: MainColors.textColor(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
