import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/http_client_service.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/data/models/user_model.dart';

class AuthProvider {
  Future<UserModel?> socialLogin({
    required String? firebaseAuthToken,
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.socialSignIn,
      requestType: HttpRequestTypes.post,
      data: {
        "token": firebaseAuthToken,
        "fcm": await LocalStorageService.loadData(key: StorageKeysConstants.fcmToken, type: DataTypes.string),
      },
      onSuccess: (response) async {
        if (response.body['token'] != null) {
          await LocalStorageService.saveData(
              key: StorageKeysConstants.serverApiToken, value: response.body['token'], type: DataTypes.string);
        }
      },
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return UserModel.fromJson(response?.body['user']);
    }
    return null;
  }

  Future<UserModel?> getUserData({
    Function? onLoading,
    Function? onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.getUserData,
      requestType: HttpRequestTypes.get,
      onLoading: () {
        if (onLoading != null) onLoading();
      },
      onFinal: () {
        if (onFinal != null) onFinal();
      },
    );
    if (response?.body != null) {
      if (response?.body?['user'] != null) {
        return UserModel.fromJson(response?.body?['user']);
      }
    }
    return null;
  }
}
