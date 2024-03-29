import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class QrCodeComponent extends StatelessWidget {
  const QrCodeComponent({super.key, required this.data, this.size});

  final String data;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: PrettyQrView.data(
        data: data,
        decoration: PrettyQrDecoration(
          shape: PrettyQrSmoothSymbol(
            roundFactor: 0,
            color: MainColors.textColor(context)!,
          ),
        ),
      ),
    );
  }
}
