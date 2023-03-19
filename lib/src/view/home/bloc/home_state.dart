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
