import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/favorites/domain/favorites_state.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_model.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';

abstract class IFavoritesWM {
  ValueListenable<FavoritesState> get favoritesState;

  void onCardTap(BuildContext context, PlaceEntity place);

  void onRemoveTap(PlaceEntity place);

  void dispose();
}

class FavoritesWM implements IFavoritesWM {
  final IFavoritesModel _model;

  FavoritesWM(this._model);

  @override
  ValueListenable<FavoritesState> get favoritesState => _model.favoritesStateListenable;

  @override
  void dispose() => _model.dispose();

  @override
  void onCardTap(BuildContext context, PlaceEntity place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailScreenBuilder(place: place),
      ),
    );
  }

  @override
  void onRemoveTap(PlaceEntity place) {
    _model.removeFavorite(place);
  }
}
