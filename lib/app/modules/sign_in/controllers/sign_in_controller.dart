import 'dart:developer';

import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/services/firebase_authentication_service.dart';

class SignInController extends GetxController {
  bool googleSignInLoading = false;
  void changeGoogleSignInLoading(bool value) {
    googleSignInLoading = value;
    update([GetBuildersIdsConstants.signInGoogleButton]);
  }

  void signInWithGoogle() {
    FirebaseAuthenticationService()
        .googleAuthentication(onLoading: () => changeGoogleSignInLoading(true), onFinal: () => changeGoogleSignInLoading(false))
        .then((value) async {
      if (value != null) {
        log('auth token: ${await value.firebaseUserCredential?.user?.getIdToken()}');
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
