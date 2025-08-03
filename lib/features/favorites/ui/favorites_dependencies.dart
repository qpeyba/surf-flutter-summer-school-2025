import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/favorites/ui/screens/favorites_model.dart';

abstract class FavoritesDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<IFavoritesModel>(
        create:
            (context) => FavoritesModel(
              favoritesRepository: context.read<IFavoritesRepository>(),
            ),
      ),
    ];
  }
}
