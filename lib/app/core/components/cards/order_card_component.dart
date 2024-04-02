import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/relative_date_util.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrderCardComponent extends StatelessWidget {
  const OrderCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.backgroundColor(context),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: MainColors.shadowColor(context)!.withOpacity(0.5),
            blurRadius: 6.r,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          TagComponent(
            title: 'Finished',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w, end: 15.w, top: 8.h, bottom: 0),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${StringsAssetsConstants.orderNumber}: ',
                          style: TextStyles.largeBodyTextStyle(context),
                        ),
                        TextSpan(
                          text: '17',
                          style: TextStyles.smallLabelTextStyle(context).copyWith(
                            color: MainColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  RelativeDateUtil.getRelativeDateSinceNow(
                      relativeDateInUnix: DateTime.now().add(const Duration(days: -1)).millisecondsSinceEpoch),
                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                    color: MainColors.textColor(context)!.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                  child: LinearPercentIndicator(
                    lineHeight: 15.r,
                    percent: 0.7,
                    animateFromLastPercent: true,
                    animation: true,
                    barRadius: Radius.circular(1000.r),
                    backgroundColor: MainColors.disableColor(context)!.withOpacity(0.25),
                    progressColor: MainColors.primaryColor,
                    animationDuration: 300,
                    restartAnimation: false,
                    isRTL: Get.locale?.languageCode == 'ar',
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              children: [
                AnimatorComponent(
                  time: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      // SvgPicture.asset(
                      //   IconsAssetsConstants.pointIcon,
                      //   width: 22.r,
                      //   color: MainColors.textColor(context),
                      // ),
                      // SizedBox(
                      //   height: 40.h,
                      //   child: VerticalDivider(
                      //     color: MainColors.textColor(context),
                      //     thickness: 1.r,
                      //     indent: 0.r,
                      //     endIndent: 0.r,
                      //   ),
                      // ),
                      SvgPicture.asset(
                        IconsAssetsConstants.locationIcon,
                        width: 22.r,
                        color: MainColors.textColor(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                    child: Column(
                  children: [
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Expanded(
                    //           child: AnimatedTypeTextComponent(
                    //             text: StringsAssetsConstants.pickUpLocation,
                    //             textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                    //               color: MainColors.textColor(context)!.withOpacity(0.6),
                    //             ),
                    //             textAlign: TextAlign.start,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Expanded(
                    //           child: Text(
                    //             'Cairo, Nasr City, 5th Settlement, 90th Street, Building 17, Apartment 17',
                    //             style: TextStyles.mediumBodyTextStyle(context).copyWith(
                    //               fontFamily: FontsFamilyAssetsConstants.bold,
                    //             ),
                    //             maxLines: 1,
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 15.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AnimatedTypeTextComponent(
                                  text: StringsAssetsConstants.deliveryLocation,
                                  textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                    color: MainColors.textColor(context)!.withOpacity(0.6),
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Cairo, Nasr City, 5th Settlement, 90th Street, Building 17, Apartment 17',
                                style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                  fontFamily: FontsFamilyAssetsConstants.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
          Divider(
            color: MainColors.textColor(context)!.withOpacity(0.1),
            endIndent: 20.w,
            indent: 20.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${StringsAssetsConstants.itemPrice}:',
                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                        color: MainColors.textColor(context)!.withOpacity(0.6),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '${5000} ${StringsAssetsConstants.currency}',
                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                        color: MainColors.primaryColor,
                        fontFamily: FontsFamilyAssetsConstants.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${StringsAssetsConstants.deliveryPrice}:',
                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                        color: MainColors.textColor(context)!.withOpacity(0.6),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '${600} ${StringsAssetsConstants.currency}',
                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                        color: MainColors.primaryColor,
                        fontFamily: FontsFamilyAssetsConstants.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${StringsAssetsConstants.totalPrice}:',
                      style: TextStyles.smallLabelTextStyle(context),
                    ),
                    Text(
                      '${600} ${StringsAssetsConstants.currency}',
                      style: TextStyles.smallLabelTextStyle(context).copyWith(
                        color: MainColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
