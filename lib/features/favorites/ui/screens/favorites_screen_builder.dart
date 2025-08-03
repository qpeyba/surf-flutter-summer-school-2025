import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/favorites/ui/favorites_dependencies.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_model.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_screen.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_wm.dart';

class FavoritesScreenBuilder extends StatelessWidget {
  const FavoritesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...FavoritesDependencies.providers(),
        Provider<IFavoritesWM>(
          create: (context) => FavoritesWM(context.read<IFavoritesModel>()),
        ),
      ],
      child: Builder(
        builder:
            (context) => FavoritesScreen(
              wm: context.read<IFavoritesWM>(),
            ),
      ),
    );
  }
}
