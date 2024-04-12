import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/services/http_client_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/data/models/general_settings_model.dart';

class ConfigProvider {
  Future<GeneralSettingsModel?> generalSettings({
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.generalSettings,
      requestType: HttpRequestTypes.get,
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return GeneralSettingsModel.fromJson(response?.body);
    }
    return null;
  }
}
