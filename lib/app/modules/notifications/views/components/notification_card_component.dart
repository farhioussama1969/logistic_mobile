import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/data/models/notification_model.dart';

class NotificationCardComponent extends StatelessWidget {
  const NotificationCardComponent({super.key, required this.notification, required this.deleteNotification, required this.isRead});
  final NotificationModel notification;
  final bool isRead;
  final Function(int notificationId) deleteNotification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: MainColors.backgroundColor(context),
          border: Border.all(
              color: isRead ? MainColors.disableColor(context)!.withOpacity(0.3) : MainColors.primaryColor.withOpacity(0.7), width: 1.r),
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 60.r,
              height: 60.r,
              decoration: BoxDecoration(
                gradient: isRead
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          MainColors.disableColor(context)!,
                          MainColors.disableColor(context)!.withOpacity(0.6),
                        ],
                      )
                    : MainColors.primaryGradientColor,
                // notification.colorCode == null
                //     ? MainColors.primaryGradientColor
                // : LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: [
                //       ColorConvertorUtil().stringColorCodeToColor(
                //         notification.colorCode,
                //       ),
                //       ColorConvertorUtil()
                //           .stringColorCodeToColor(
                //             notification.colorCode,
                //           )
                //           .withOpacity(0.6),
                //     ],
                //   ),
                borderRadius: BorderRadius.circular(1000.r),
              ),
              child: SvgPicture.asset(
                //notification.iconLink ??
                IconsAssetsConstants.notificationIcon,
                color: MainColors.whiteColor,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title ?? '',
                    style: TextStyles.mediumLabelTextStyle(context).copyWith(
                      fontSize: 16.sp,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    notification.data ?? '',
                    style: TextStyles.mediumBodyTextStyle(context).copyWith(),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    DateTime.now().toString().substring(10, 16),
                    style: TextStyles.mediumBodyTextStyle(context).copyWith(
                      fontSize: 12.sp,
                      color: MainColors.disableColor(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
