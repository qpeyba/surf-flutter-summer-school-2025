import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/places/domain/enitites/places_state.dart';
import 'package:surf_places/features/places/ui/screens/places_wm.dart';
import 'package:surf_places/features/places/ui/widgets/place_card_widget.dart';

/// Экран списка мест.
class PlacesScreen extends StatelessWidget {
  /// WM.
  final IPlacesWM wm;

  const PlacesScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<PlacesState>(
        valueListenable: wm.placesStateListenable,
        builder: (context, places, _) {
          return NestedScrollView(
            headerSliverBuilder:
                (_, __) => [
                  SliverAppBar(title: const Text(AppStrings.placesScreenAppBarTitle), floating: true, snap: true),
                ],
            body: RefreshIndicator.adaptive(
              onRefresh: wm.loadPlaces,
              child: switch (places) {
                PlacesStateLoading() => Center(child: Text(AppStrings.placesLoading)),
                PlacesStateFailure(:final failure) => Center(child: Text('${AppStrings.placesError}$failure')),
                PlacesStateData(:final places) => ListView.separated(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final likedPlace = places[index];
                    return PlaceCardWidget(
                      place: likedPlace.place,
                      onCardTap: () => wm.onPlacePressed(context, likedPlace.place),
                      onLikeTap: () => wm.onLikePressed(likedPlace.place),
                      isFavorite: likedPlace.isFavorite,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
