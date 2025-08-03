import 'package:surf_places/core/domain/entities/result/request_operation.dart';

abstract interface class IFirstLaunchRepository {
  RequestOperation<bool> isFirstLaunch();

  RequestOperation<void> setFirstLaunchCompleted();
}
