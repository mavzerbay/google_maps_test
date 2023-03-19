import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/init/extensions/asset.extension.dart';
import '../../../_models/bus_stop.model.dart';
import '../../../_services/global_service.dart';

part 'bus_stop_event.dart';
part 'bus_stop_state.dart';

class BusStopBloc extends Bloc<BusStopEvent, BusStopState> {
  final IGlobalService _globalService;
  BusStopBloc(this._globalService) : super(BusLoading()) {
    on<BusGetBusStops>(_onBusGetBusStops);
  }

  void _onBusGetBusStops(
    BusGetBusStops event,
    Emitter<BusStopState> emit,
  ) async {
    emit(BusLoading());
    final response = await _globalService.getBusStops(
        event.currentLocation.latitude, event.currentLocation.longitude);
    if (response.data != null && response.data!.isNotEmpty) {
      final busStopIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(16, 16), devicePixelRatio: 1.5),
        'bus_stop'.toPng,
      );
      emit(BusLoaded(response.data!, busStopIcon));
    } else if (response.error != null) {
      emit(BusError(response.error!));
    }
  }
}
