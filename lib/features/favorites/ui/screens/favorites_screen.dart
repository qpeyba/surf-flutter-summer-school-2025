import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/favorites/domain/favorites_state.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_wm.dart';
import 'package:surf_places/features/favorites/ui/widgets/favorites_empty_widget.dart';
import 'package:surf_places/features/favorites/ui/widgets/favorites_list_widget.dart';

class FavoritesScreen extends StatelessWidget {
  final IFavoritesWM wm;

  const FavoritesScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.placesScreenBottomNavFavorites),
      ),
      body: ValueListenableBuilder<FavoritesState>(
        valueListenable: wm.favoritesState,
        builder: (context, state, _) {
          return switch (state) {
            FavoritesStateLoading() => const Center(child: CircularProgressIndicator()),
            FavoritesStateEmpty() => const FavoritesEmptyWidget(),
            FavoritesStateData(places: final places) => FavoritesListWidget(places: places, wm: wm),
          };
        },
      ),
    );
  }
}
