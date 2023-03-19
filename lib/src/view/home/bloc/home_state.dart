part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeCurrentLocationLoading extends HomeState {}

class HomeCurrentLocationLoaded extends HomeState {
  final LatLng currentLocation;

  const HomeCurrentLocationLoaded(this.currentLocation);

  @override
  List<Object> get props => [currentLocation];
}

class HomeCurrentLocationError extends HomeState {
  final String message;

  const HomeCurrentLocationError(this.message);

  @override
  List<Object> get props => [message];
}
