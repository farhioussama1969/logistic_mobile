import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class Step1Component extends StatelessWidget {
  const Step1Component({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: MainColors.backgroundColor(context),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: MainColors.shadowColor(context)!.withOpacity(0.5),
            blurRadius: 30.r,
            offset: Offset(0, 40.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  StringsAssetsConstants.pleasePickStartAndDestinationLocation,
                  style: TextStyles.largeBodyTextStyle(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          StringsAssetsConstants.from,
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        IconsAssetsConstants.locationIcon,
                        width: 22.r,
                        color: MainColors.textColor(context),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    height: 60.h,
                    child: VerticalDivider(
                      color: MainColors.textColor(context)!.withOpacity(0.3),
                      thickness: 2.w,
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          StringsAssetsConstants.to,
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        IconsAssetsConstants.locationIcon,
                        width: 22.r,
                        color: MainColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  children: [
                    TextInputComponent(
                      label: StringsAssetsConstants.pickUpLocation,
                      isLabelOutside: true,
                      borderColor: MainColors.textColor(context),
                      hint: '${StringsAssetsConstants.pickUpLocation}...',
                      suffix: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SvgPicture.asset(
                          IconsAssetsConstants.selectedLocationIcon,
                          width: 22.r,
                          color: MainColors.textColor(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextInputComponent(
                      label: StringsAssetsConstants.deliveryLocation,
                      isLabelOutside: true,
                      hint: '${StringsAssetsConstants.deliveryLocation}...',
                      borderColor: MainColors.textColor(context),
                      suffix: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SvgPicture.asset(
                          IconsAssetsConstants.selectedLocationIcon,
                          width: 22.r,
                          color: MainColors.textColor(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: '${StringsAssetsConstants.estimatedDistance}: ',
                    style: TextStyles.largeBodyTextStyle(context),
                    children: [
                      TextSpan(
                        text: '40 ${StringsAssetsConstants.km}',
                        style: TextStyles.mediumBodyTextStyle(context).copyWith(
                          color: MainColors.primaryColor,
                          fontFamily: FontsFamilyAssetsConstants.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SvgPicture.asset(
                Get.locale?.languageCode == 'ar' ? IconsAssetsConstants.arrowLeftIcon : IconsAssetsConstants.arrowRightIcon,
                width: 22.r,
                color: MainColors.primaryColor,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: '${StringsAssetsConstants.deliveryPrice}: ',
                    style: TextStyles.mediumLabelTextStyle(context),
                    children: [
                      TextSpan(
                        text: '600 ${StringsAssetsConstants.currency}',
                        style: TextStyles.mediumLabelTextStyle(context).copyWith(
                          color: MainColors.primaryColor,
                          fontFamily: FontsFamilyAssetsConstants.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            color: MainColors.textColor(context)!.withOpacity(0.1),
          ),
          SizedBox(height: 10.h),
          Column(
            children: [
              TextInputComponent(
                label: StringsAssetsConstants.senderPhoneNumber,
                isLabelOutside: true,
                borderColor: MainColors.textColor(context),
                hint: '${StringsAssetsConstants.senderPhoneNumber}...',
                textInputType: TextInputType.phone,
                prefix: Row(
                  children: [
                    SizedBox(width: 20.w),
                    SvgPicture.asset(
                      IconsAssetsConstants.phoneIcon,
                      width: 22.r,
                      color: MainColors.textColor(context),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              TextInputComponent(
                label: StringsAssetsConstants.receiverPhoneNumber,
                isLabelOutside: true,
                borderColor: MainColors.textColor(context),
                hint: '${StringsAssetsConstants.receiverPhoneNumber}...',
                textInputType: TextInputType.phone,
                prefix: Row(
                  children: [
                    SizedBox(width: 20.w),
                    SvgPicture.asset(
                      IconsAssetsConstants.phoneIcon,
                      width: 22.r,
                      color: MainColors.textColor(context),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ],
      ),
    );
  }
}
