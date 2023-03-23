import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../counter_bloc/counter_event.dart';
import '../counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState) {
    on<TriggerCountButton>((event, emit) async {
      int counted = state.count + 1;
      persistCountedData(state.count + counted);
      int? savedData = await getCountedData();
      emit(CounterState(count: counted, savedCount: savedData ?? 0));
    });
  }

  void persistCountedData(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', value);
  }

  Future<int?> getCountedData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('count');
  }
}
