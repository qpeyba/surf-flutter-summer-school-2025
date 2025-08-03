import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_places/core/data/repositories/base_repository.dart';
import 'package:surf_places/core/domain/entities/failure/unknown_failure.dart';
import 'package:surf_places/core/domain/entities/result/request_operation.dart';
import 'package:surf_places/core/domain/entities/result/result.dart';
import 'package:surf_places/features/splash/domain/repositories/i_first_launch_repository.dart';

final class FirstLaunchRepository extends BaseRepository implements IFirstLaunchRepository {
  static const String _firstLaunchKey = 'is_first_launch';

  @override
  RequestOperation<bool> isFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool(_firstLaunchKey) ?? true;
      return Result.ok(isFirstLaunch);
    } on Object catch (e, s) {
      return Result.failed(UnknownFailure(message: e.toString(), stackTrace: s), s);
    }
  }

  @override
  RequestOperation<void> setFirstLaunchCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_firstLaunchKey, false);
      return Result.ok(null);
    } on Object catch (e, s) {
      return Result.failed(UnknownFailure(message: e.toString(), stackTrace: s), s);
    }
  }
}
