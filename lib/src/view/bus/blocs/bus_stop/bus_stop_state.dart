part of 'bus_stop_bloc.dart';

abstract class BusStopState extends Equatable {
  const BusStopState();

  @override
  List<Object> get props => [];
}

class BusLoading extends BusStopState {}

class BusLoaded extends BusStopState {
  final List<BusStopModel> busStops;
  final BitmapDescriptor busStop;

  const BusLoaded(this.busStops, this.busStop);

  @override
  List<Object> get props => [busStops, busStop];
}

class BusError extends BusStopState {
  final IErrorModel<INetworkModel<dynamic>?> error;

  const BusError(this.error);

  @override
  List<Object> get props => [error];
}
