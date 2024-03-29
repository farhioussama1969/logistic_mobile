// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:loogisti/app/core/components/others/camera_component.dart';
// import 'package:loogisti/app/core/components/others/header_component.dart';
// import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
// import 'package:loogisti/app/core/styles/main_colors.dart';
// import 'package:loogisti/app/core/styles/text_styles.dart';
//
// class OcrScannerComponent extends StatefulWidget {
//   const OcrScannerComponent({super.key});
//
//   @override
//   State<OcrScannerComponent> createState() => _OcrScannerComponentState();
// }
//
// class _OcrScannerComponentState extends State<OcrScannerComponent> {
//   File? pickedImageFile;
//
//   void onPickImageFile(File? image) {
//     pickedImageFile = image;
//   }
//
//   Future<void> convertImageToText(File? imageFile) async {
//     pickedImageFile = imageFile;
//     InputImage inputImage = InputImage.fromFile(imageFile!);
//     final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
//     final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
//     String text = recognizedText.text;
//
//     print('extracted text is:: ${text}');
//
//     EntityExtractor extractor = EntityExtractor(language: EntityExtractorLanguage.english);
//     List<EntityAnnotation> result = await extractor.annotateText(text);
//     print('AI result:: ${result}');
//
//     Get.back(result: result);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       appBar: HeaderComponent(
//         backgroundColor: MainColors.transparentColor,
//         titleWidget: Text(
//           StringsAssetsConstants.scanDriverLicense,
//           style: TextStyles.mediumLabelTextStyle(context).copyWith(
//             color: MainColors.whiteColor,
//           ),
//         ),
//       ),
//       body: CameraComponent(
//         pickedGalleryImageFile: pickedImageFile,
//         onPickImageFileFromGallery: (imageFile) => convertImageToText(imageFile),
//         onTakePicture: (image) => convertImageToText(image),
//       ),
//     );
//   }
// }
