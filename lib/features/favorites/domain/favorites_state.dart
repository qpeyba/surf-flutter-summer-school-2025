import 'package:flutter/foundation.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';

@immutable
sealed class FavoritesState {
  const FavoritesState();
}

final class FavoritesStateLoading extends FavoritesState {
  const FavoritesStateLoading();
}

final class FavoritesStateEmpty extends FavoritesState {
  const FavoritesStateEmpty();
}

final class FavoritesStateData extends FavoritesState {
  final List<PlaceEntity> places;

  const FavoritesStateData(this.places);

  @override
  int get hashCode => places.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesStateData && runtimeType == other.runtimeType && places == other.places;
}
