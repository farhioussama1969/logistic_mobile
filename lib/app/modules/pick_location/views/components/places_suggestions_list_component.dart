import 'package:flutter/cupertino.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/modules/pick_location/views/components/places_suggestion_card_component.dart';

class PlacesSuggestionsListComponent extends StatelessWidget {
  const PlacesSuggestionsListComponent(
      {super.key, required this.placesSuggestions, required this.isLoading, required this.show, required this.onTap});

  final List<PlacesSearchResult> placesSuggestions;
  final bool isLoading;
  final bool show;
  final Function(PlacesSearchResult placesSuggestions) onTap;

  @override
  Widget build(BuildContext context) {
    return show
        ? Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
              itemBuilder: (context, index) {
                return PlaceSuggestionCardComponent(
                  placesSuggestions: placesSuggestions[index],
                  onTap: (placesSuggestions) => onTap(placesSuggestions),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              itemCount: placesSuggestions.length,
            ),
          )
        : const SizedBox.shrink();
  }
}
