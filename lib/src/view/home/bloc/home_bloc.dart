import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCurrentLocationGet>(_onHomeCurrentLocationGet);
  }

  void _onHomeCurrentLocationGet(
    HomeCurrentLocationGet event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeCurrentLocationLoading());

    final hasPermission = await Geolocator.checkPermission();

    if (hasPermission == LocationPermission.denied ||
        hasPermission == LocationPermission.deniedForever) {
      final locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        emit(const HomeCurrentLocationError(
            'Uygulamayı kullanabilmek için konum izni vermeniz gerekiyor.'));
        return;
      }
    }

    final locationData = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    developer.log(locationData.toString());

    emit(HomeCurrentLocationLoaded(
      LatLng(locationData.latitude, locationData.longitude),
    ));
  }
}
