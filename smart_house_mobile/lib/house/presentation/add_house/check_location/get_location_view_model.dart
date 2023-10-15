import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_location_view_model.g.dart';

@riverpod
class IsAddressManuallyEntered extends _$IsAddressManuallyEntered {
  @override
  bool build() {
    return false;
  }

  void setManuallyEntered() {
    state = true;
  }

  void setAutoDetected() {
    state = false;
  }
}
