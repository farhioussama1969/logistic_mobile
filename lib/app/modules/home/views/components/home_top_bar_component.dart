import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class HomeTopBarComponent extends StatelessWidget {
  const HomeTopBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w, top: 20.h, bottom: 20.h),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.MY_ACCOUNT),
                    child: Container(
                      height: 60.r,
                      width: 60.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        border: Border.all(
                          color: MainColors.primaryColor,
                          width: 4.r,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000.r),
                        child: NetworkImageComponent(
                          imageLink: 'https://avatar.iran.liara.run/public/boy?username=Ash',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ashkan',
                          style: TextStyles.mediumLabelTextStyle(context),
                        ),
                        Text(
                          'Algeria, ben aknoun',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        IconButtonComponent(
          iconLink: IconsAssetsConstants.notificationIcon,
          onTap: () {},
        ),
      ]),
    ));
  }
}
