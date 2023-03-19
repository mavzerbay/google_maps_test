part of 'bus_stop_bloc.dart';

abstract class BusStopEvent extends Equatable {
  const BusStopEvent();

  @override
  List<Object> get props => [];
}

class BusGetBusStops extends BusStopEvent {
  final LatLng currentLocation;

  const BusGetBusStops(this.currentLocation);

  @override
  List<Object> get props => [currentLocation];
}
