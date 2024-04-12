import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loogisti/app/core/services/geolocator_location_service.dart';

import '../../../core/constants/get_builders_ids_constants.dart';
import '../../../core/services/geocoding_service.dart';

class PickLocationController extends GetxController {
  String currentAddress = '';

  void changeCurrentAddress(String newCurrentAddress) {
    currentAddress = newCurrentAddress;
    update([GetBuildersIdsConstants.chooseLocationOnMapCurrentAddress]);
  }

  double currentLatitude = 0.0;
  double currentLongitude = 0.0;

  void changeChooseWhatLocation(String newChooseWhatLocation) {
    //chooseWhatLocation = newChooseWhatLocation;
    update([GetBuildersIdsConstants.chooseLocationOnMapCurrentAddress]);
  }

  bool isMapCameraMoving = false;

  Future<void> changeIsMapCameraMoving(bool newIsMapCameraMoving) async {
    if (isMapCameraMoving == newIsMapCameraMoving) return;
    isMapCameraMoving = newIsMapCameraMoving;
    if (isMapCameraMoving) {
      changeCurrentAddress('');
    } else if (!isMapCameraMoving) {
      await getAddressFromCoordinates(currentLatitude, currentLongitude);
    }
    update([
      GetBuildersIdsConstants.chooseLocationOnMapGoogleMapsMoving,
      GetBuildersIdsConstants.chooseLocationOnMapCurrentAddress,
    ]);
  }

  GoogleMapController? googleMapsController;

  void updateGoogleMapsController(GoogleMapController mapController) {
    googleMapsController = mapController;
    // if (ThemeUtil.isDarkMode) {
    //   String _mapStyleString = '';
    //   rootBundle.loadString(GoogleMapsStylesAssetsConstants.darkModeStyle).then((string) {
    //     _mapStyleString = string;
    //     googleMapsController?.setMapStyle(_mapStyleString);
    //   });
    // }
  }

  CameraPosition? initialGoogleMapsCameraPosition;

  void changeInitialGoogleMapsCameraPosition(CameraPosition newCameraPosition) {
    initialGoogleMapsCameraPosition = newCameraPosition;
  }

  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    await GeocodingService.getPlaceMarkFromCoordinates(lat, lng).then((value) {
      if (value != null) {
        changeCurrentAddress(value);
      }
    });
  }

  Position? selectedPosition;

  Future<void> changeStartingPosition(Position? newPosition, {bool? withoutGetPlace}) async {
    selectedPosition = newPosition;
    if (newPosition != null) {
      changeInitialGoogleMapsCameraPosition(CameraPosition(
        target: LatLng(selectedPosition!.latitude!, selectedPosition!.longitude!),
        zoom: 14,
      ));
      googleMapsController
          ?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(selectedPosition!.latitude!, selectedPosition!.longitude!), 14));

      if (withoutGetPlace == null || !withoutGetPlace) {
        getAddressFromCoordinates(selectedPosition!.latitude!, selectedPosition!.longitude!);
      }
    }
  }

  Future<void> enableAndGetStartingPositionFromGeolocator() async {
    Position? newPosition = await GeolocatorLocationService.getCurrentLocation();
    log('new position:::: $newPosition');
    if (newPosition != null) {
      changeStartingPosition(newPosition);
    }
  }

  bool getPlaceSuggestionsLoading = false;
  void changeGetPlaceSuggestionsLoading(bool newGetPlaceSuggestionsLoading) {
    getPlaceSuggestionsLoading = newGetPlaceSuggestionsLoading;
    update([GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions]);
  }

  bool showPlacesSuggestions = false;
  void changeShowPlacesSuggestions(bool newShowPlacesSuggestions) {
    showPlacesSuggestions = newShowPlacesSuggestions;
    update([GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions]);
  }

  List<PlacesSearchResult> placesSuggestions = [];
  void changePlacesSuggestions(List<PlacesSearchResult> newPlacesSuggestions) {
    placesSuggestions = newPlacesSuggestions;
    update([GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions]);
  }

  void getPlacesSuggestions(String searchText) async {
    changeGetPlaceSuggestionsLoading(true);
    changeShowPlacesSuggestions(true);
    changePlacesSuggestions(await GeocodingService.getPlacesSuggestionsFromText(searchText));
    changeGetPlaceSuggestionsLoading(false);
  }

  String? selectedPlaceTitle;
  String? selectedPlaceFormattedAddress;

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

enum MarkersIds {
  chosenLocationMarkerId,
}
