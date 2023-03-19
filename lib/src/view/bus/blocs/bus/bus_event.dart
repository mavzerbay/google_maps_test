part of 'bus_bloc.dart';

abstract class BusEvent extends Equatable {
  const BusEvent();

  @override
  List<Object> get props => [];
}

class BusGetBus extends BusEvent {
  final String lineNo;

  const BusGetBus(this.lineNo);

  @override
  List<Object> get props => [lineNo];
}
