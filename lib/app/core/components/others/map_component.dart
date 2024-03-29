import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import '../../styles/main_colors.dart';

class MapComponent extends StatelessWidget {
  const MapComponent(
      {Key? key,
      required this.center,
      this.markers,
      required this.radius,
      this.zoom,
      this.onLocationChanged,
      this.mapController})
      : super(key: key);

  final LatLng center;
  final List<Marker>? markers;
  final BorderRadius radius;
  final double? zoom;
  final Function(LatLng? newLocation)? onLocationChanged;
  final MapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(color: MainColors.primaryColor),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: radius,
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                onPositionChanged: (location, value) {
                  if (onLocationChanged != null) {
                    onLocationChanged!(location.center);
                  }
                },
                center: center,
                zoom: zoom ?? 5,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://mt0.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                ),
                MarkerLayer(
                  markers: markers ?? [],
                ),
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset(
              IconsAssetsConstants.locationIcon,
              color: MainColors.primaryColor,
              width: 34.r,
            ),
          ),
        ],
      ),
    );
  }
}
