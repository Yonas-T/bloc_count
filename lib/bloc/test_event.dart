import 'package:equatable/equatable.dart';

abstract class TestEvent extends Equatable {}

class GetDataButtonPressed extends TestEvent {
  int count;
  GetDataButtonPressed({
    required this.count,
  });
  
  @override
  List<Object> get props => [];
}
