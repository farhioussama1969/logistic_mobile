import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class Step1Component extends StatelessWidget {
  const Step1Component({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
          SizedBox(height: 10.h),
          Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    IconsAssetsConstants.starIcon,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    TextInputComponent(
                      label: StringsAssetsConstants.pickUpLocation,
                      isLabelOutside: true,
                    ),
                    SizedBox(height: 15.h),
                    TextInputComponent(
                      label: StringsAssetsConstants.deliveryLocation,
                      isLabelOutside: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
