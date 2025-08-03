import 'package:flutter/foundation.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/favorites/domain/favorites_state.dart';

abstract class IFavoritesModel {
  ValueListenable<FavoritesState> get favoritesStateListenable;

  void removeFavorite(PlaceEntity place);

  void dispose();
}

class FavoritesModel implements IFavoritesModel {
  final IFavoritesRepository _favoritesRepository;

  final _favoritesState = ValueNotifier<FavoritesState>(const FavoritesStateLoading());

  FavoritesModel({required IFavoritesRepository favoritesRepository}) : _favoritesRepository = favoritesRepository {
    _favoritesRepository.favoritesListenable.addListener(_onFavoritesChanged);
    _onFavoritesChanged();
  }

  @override
  ValueListenable<FavoritesState> get favoritesStateListenable => _favoritesState;

  @override
  void dispose() {
    _favoritesRepository.favoritesListenable.removeListener(_onFavoritesChanged);
    _favoritesState.dispose();
  }

  @override
  void removeFavorite(PlaceEntity place) {
    _favoritesRepository.removeFavorite(place);
  }

  void _onFavoritesChanged() {
    final favorites = _favoritesRepository.favoritesListenable.value;
    if (favorites.isEmpty) {
      _favoritesState.value = const FavoritesStateEmpty();
    } else {
      _favoritesState.value = FavoritesStateData(favorites);
    }
  }
}
