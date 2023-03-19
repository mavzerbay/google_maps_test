part of 'bus_bloc.dart';

abstract class BusState extends Equatable {
  const BusState();

  @override
  List<Object> get props => [];
}

class BusInitial extends BusState {}

class BusLoading extends BusState {}

class BusLoaded extends BusState {
  final BusDetailResponseModel busResponse;

  const BusLoaded(this.busResponse);

  @override
  List<Object> get props => [busResponse];
}

class BusError extends BusState {
  final IErrorModel<INetworkModel<dynamic>?> error;

  const BusError(this.error);

  @override
  List<Object> get props => [error];
}
