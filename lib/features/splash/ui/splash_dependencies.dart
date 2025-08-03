import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:surf_places/features/splash/data/repositories/first_launch_repository.dart';
import 'package:surf_places/features/splash/domain/repositories/i_first_launch_repository.dart';
import 'package:surf_places/features/splash/ui/screens/splash_model.dart';

abstract class SplashDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<IFirstLaunchRepository>(
        create: (_) => FirstLaunchRepository(),
      ),
      Provider<ISplashModel>(
        create:
            (context) => SplashModel(
              firstLaunchRepository: context.read<IFirstLaunchRepository>(),
            ),
      ),
    ];
  }
}
