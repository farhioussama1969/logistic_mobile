class EndPointsConstants {
  static const String baseUrl = 'https://taxili.solvodev.com/api/';

  //auth provider
  static const String checkUserWithPhone = 'driver/check';
  static const String login = 'driver/login';
  static const String getUserData = 'driver/me';
  static const String changeProfileAvatar = 'driver/me/avatar';
  static const String logout = 'driver/logout';
  static const String deleteAccount = 'driver/delete';
  static const String register = 'driver/register';
  static const String updateProfile = 'driver/me/details';

  //config provider
  static const String generalSettings = 'general_settings';

  //car provider
  static const String getCarBrands = 'brands';
  static const String getCarModels = 'brand-models';

  //address provider
  static const String getWilayas = 'address/wilayas';
  static const String getCities = 'address/cities';
}
