import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/services/http_client_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/data/models/general_settings_model.dart';

class ConfigProvider {
  Future<String?> termsAndConditions({
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.termsAndConditions,
      requestType: HttpRequestTypes.get,
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return response?.body['terms']['content'];
    }
    return null;
  }
}
