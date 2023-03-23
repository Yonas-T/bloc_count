import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {}

class TriggerCountButton extends CounterEvent {
  int count;
  TriggerCountButton({
    required this.count,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
