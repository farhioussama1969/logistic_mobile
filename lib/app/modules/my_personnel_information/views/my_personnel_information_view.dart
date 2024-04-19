import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/modules/my_personnel_information/views/components/profile_avatar_component.dart';

import '../controllers/my_personnel_information_controller.dart';

class MyPersonnelInformationView extends GetView<MyPersonnelInformationController> {
  const MyPersonnelInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.myPersonalInformation,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ScrollableBodyComponent(
          children: [
            SizedBox(height: 10.h),
            ProfileAvatarComponent(
              avatarLink: null,
              pickedAvatarFile: null,
              onPickAvatarFile: (file) {},
              loading: false,
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Divider(color: MainColors.textColor(context)!.withOpacity(0.3), height: 1.h),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
