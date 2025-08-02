import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:surf_places/features/app/theme/theme_manager.dart';
import 'package:surf_places/features/settings/data/repositories/settings_repository.dart';
import 'package:surf_places/features/settings/domain/repositories/i_settings_repository.dart';
import 'package:surf_places/features/settings/ui/screens/settings_model.dart';
import 'package:surf_places/features/settings/ui/screens/settings_wm.dart';

/// Локальные зависимости для settings feature
abstract class SettingsDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<ISettingsRepository>(
        create: (_) => SettingsRepository(),
      ),
      Provider<ISettingsModel>(
        create:
            (context) => SettingsModel(
              settingsRepository: context.read<ISettingsRepository>(),
              themeManager: context.read<IThemeManager>(),
            ),
      ),
      Provider<ISettingsWM>(
        create:
            (context) => SettingsWM(
              model: context.read<ISettingsModel>(),
            ),
      ),
    ];
  }
}
