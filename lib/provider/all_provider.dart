import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/counter_model.dart';
import '../service/counter_service.dart';

final titleProvider = Provider<String>(((ref) => 'Basic Provider Head'));
final textProvider = Provider<String>((ref) {
  return 'You have pushed the button this many times:';
});
final counterProvider = StateProvider<int>(((ref) {
  return 0;
}));

final counterNotifierProvider =
    StateNotifierProvider<CounterService, CounterModel>(((ref) {
  return CounterService();
}));
