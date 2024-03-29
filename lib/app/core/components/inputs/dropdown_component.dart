import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/dropdown_item_model.dart';
import '../../constants/icons_assets_constants.dart';
import '../../styles/main_colors.dart';
import '../../styles/text_styles.dart';
import '../animations/animator_component.dart';

class DropdownComponent extends StatelessWidget {
  const DropdownComponent(
      {super.key,
      required this.dataList,
      this.selectedItem,
      this.label,
      this.isLabelOutside,
      this.hint,
      this.focusNode,
      this.nextNode,
      required this.onSelectedItem});

  final List<DropdownItemModel> dataList;
  final DropdownItemModel? selectedItem;
  final String? label;
  final bool? isLabelOutside;
  final String? hint;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final Function(DropdownItemModel? value) onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return AnimatorComponent(
      time: const Duration(milliseconds: 300),
      child: Column(
        children: [
          (isLabelOutside == true)
              ? SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 5.h, start: 14.w),
                        child: Text(
                          label == null ? "" : label!,
                          style: TextStyles.mediumBodyTextStyle(context),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<DropdownItemModel>(
                isExpanded: true,
                hint: Text(
                  hint ?? '',
                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                    color: MainColors.disableColor(context),
                  ),
                ),
                items: dataList
                    .map(
                      (DropdownItemModel item) => DropdownMenuItem<DropdownItemModel>(
                        value: item,
                        child: Text(
                          item.title ?? '',
                          style: TextStyles.mediumBodyTextStyle(context),
                        ),
                      ),
                    )
                    .toList(),
                value: selectedItem,
                focusNode: focusNode,
                onChanged: (DropdownItemModel? value) => onSelectedItem(value),
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  elevation: 0,
                  decoration: BoxDecoration(
                    color: MainColors.inputColor(context),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset(
                    IconsAssetsConstants.arrowDownIcon,
                    width: 25.r,
                    color: MainColors.disableColor(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
