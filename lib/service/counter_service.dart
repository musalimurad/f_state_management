import 'package:f_state/model/counter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterService extends StateNotifier<CounterModel> {
  CounterService() : super(CounterModel(0));

  void plusCount() {
    state = CounterModel(state.count + 1);
  }

  void minusCount() {
    state = CounterModel(state.count - 1);
  }
}
