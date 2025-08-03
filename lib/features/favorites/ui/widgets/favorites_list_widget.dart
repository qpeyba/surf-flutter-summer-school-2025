import 'package:flutter/material.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_wm.dart';
import 'package:surf_places/features/places/ui/widgets/place_card_widget.dart';

class FavoritesListWidget extends StatelessWidget {
  final List<PlaceEntity> places;
  final IFavoritesWM wm;

  const FavoritesListWidget({
    required this.places,
    required this.wm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: PlaceCardWidget(
            place: place,
            cardType: PlaceCardType.favorite,
            onCardTap: () => wm.onCardTap(context, place),
            onLikeTap: () => wm.onRemoveTap(place),
          ),
        );
      },
    );
  }
}
