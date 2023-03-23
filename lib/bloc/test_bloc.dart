import 'package:bloc/bloc.dart';
import '../bloc/test_event.dart';
import '../bloc/test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(TestState initialState) : super(initialState) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(TestState(count: state.count + 1));
    });
  }
}
