import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offset_counter_provider.g.dart';

@Riverpod(keepAlive: true)
class OffsetCounter extends _$OffsetCounter {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state = state + 20;
  }
}
