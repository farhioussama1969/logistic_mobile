import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/modules/my_account/views/components/my_account_item_component.dart';
import 'package:loogisti/app/routes/app_pages.dart';

import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(),
      body: SizedBox(
        width: double.infinity,
        child: ScrollableBodyComponent(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 10.h),
            Column(
              children: [
                Container(
                  height: 140.r,
                  width: 140.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.r),
                    child: NetworkImageComponent(
                      imageLink: 'https://avatar.iran.liara.run/public/boy?username=Ash',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Center(
                  child: Text(
                    'Ashkan',
                    style: TextStyles.mediumLabelTextStyle(context),
                  ),
                ),
                Center(
                  child: Text(
                    'farhioussama1969@gmail.com',
                    style: TextStyles.mediumBodyTextStyle(context).copyWith(
                      color: MainColors.textColor(context)!.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          StringsAssetsConstants.myAccount,
                          style: TextStyles.mediumLabelTextStyle(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    MyAccountItemComponent(
                      iconLink: IconsAssetsConstants.myAccountIcon,
                      title: StringsAssetsConstants.myPersonalInformation,
                      onTap: () => Get.toNamed(Routes.MY_PERSONNEL_INFORMATION),
                    ),
                    SizedBox(height: 15.h),
                    MyAccountItemComponent(
                      iconLink: IconsAssetsConstants.registerAsDriverIcon,
                      title: StringsAssetsConstants.registerAsADriver,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Divider(color: MainColors.textColor(context)!.withOpacity(0.3), height: 1.h),
                ),
                SizedBox(height: 30.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          StringsAssetsConstants.support,
                          style: TextStyles.mediumLabelTextStyle(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    MyAccountItemComponent(
                      iconLink: IconsAssetsConstants.contactUsIcon,
                      title: StringsAssetsConstants.contactUs,
                      onTap: () {},
                    ),
                    SizedBox(height: 15.h),
                    MyAccountItemComponent(
                      iconLink: IconsAssetsConstants.aboutUsIcon,
                      title: StringsAssetsConstants.aboutUs,
                      onTap: () {},
                    ),
                    SizedBox(height: 15.h),
                    MyAccountItemComponent(
                      iconLink: IconsAssetsConstants.termsIcon,
                      title: StringsAssetsConstants.termsAndConditions,
                      onTap: () {},
                    ),
                    SizedBox(height: 15.h),
                    MyAccountItemComponent(
                      iconLink: IconsAssetsConstants.deleteAccountIcon,
                      title: StringsAssetsConstants.deleteAccount,
                      onTap: () {},
                      hideArrow: true,
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                PrimaryButtonComponent(
                  onTap: () {},
                  text: StringsAssetsConstants.logout,
                  backgroundColor: MainColors.backgroundColor(context),
                  textColor: MainColors.errorColor(context),
                  borderColor: MainColors.errorColor(context),
                  iconPath: IconsAssetsConstants.logoutIcon,
                  iconColor: MainColors.errorColor(context),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
