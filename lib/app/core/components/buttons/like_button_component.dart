import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class LikeButtonComponent extends StatelessWidget {
  const LikeButtonComponent(
      {Key? key,
      required this.onTap,
      required this.isLiked,
      this.size,
      this.borderColor,
      this.backgroundColor,
      this.iconSize})
      : super(key: key);

  final Function(bool value) onTap;
  final bool isLiked;
  final double? size;
  final double? iconSize;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size ?? 50.r,
      height: size ?? 50.r,
      decoration: BoxDecoration(
          color: backgroundColor ?? MainColors.backgroundColor(context),
          borderRadius: BorderRadius.circular(1000.r),
          border: Border.all(
            color: borderColor ?? MainColors.disableColor(context)!,
          ),
          boxShadow: [
            BoxShadow(
              color: MainColors.blackColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: LikeButton(
        size: iconSize ?? 25.r,
        isLiked: isLiked,
        onTap: (bool value) {
          onTap(!value);
          return Future.value(!value);
        },
        countPostion: CountPostion.bottom,
        padding: EdgeInsets.zero,
        circleSize: 30.r,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        animationDuration: const Duration(milliseconds: 300),
        likeBuilder: (bool value) {
          return SvgPicture.asset(
            value
                ? IconsAssetsConstants.heartBoldIcon
                : IconsAssetsConstants.heartOutlineIcon,
            width: iconSize ?? 25.r,
            color: MainColors.errorColor(context),
          );
        },
      ),
    );
  }
}
