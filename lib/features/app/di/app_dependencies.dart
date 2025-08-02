import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:surf_places/api/service/api_client.dart';
import 'package:surf_places/features/app/theme/theme_manager.dart';
import 'package:surf_places/features/common/data/repositories/favorites_repository.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/settings/data/repositories/settings_repository.dart';
import 'package:surf_places/features/settings/domain/repositories/i_settings_repository.dart';

/// Класс с зависимостями приложения.
abstract class AppDependencies {
  static List<SingleChildWidget> providers() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = 'http://109.73.206.134:8888/api/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    final apiClient = ApiClient(dio);
    return [
      Provider<ApiClient>(create: (_) => apiClient),
      Provider<IFavoritesRepository>(create: (_) => FavoritesRepository()),
      Provider<ISettingsRepository>(create: (_) => SettingsRepository()),
      Provider<IThemeManager>(
        create:
            (context) => ThemeManager(
              settingsRepository: context.read<ISettingsRepository>(),
            ),
      ),
    ];
  }
}
