import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_wm.dart';

class FavoritesScreen extends StatelessWidget {
  final IFavoritesWM wm;

  const FavoritesScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.placesScreenBottomNavFavorites),
      ),
      body: const Center(
        child: Text(AppStrings.favoritesEmptyTitle),
      ),
    );
  }
}
