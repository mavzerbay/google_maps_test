import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../../_models/bus_detail_response.model.dart';
import '../../../_services/global_service.dart';

part 'bus_event.dart';
part 'bus_state.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  final IGlobalService _globalService;
  BusBloc(this._globalService) : super(BusInitial()) {
    on<BusGetBus>(_onBusGetBus);
  }

  void _onBusGetBus(
    BusGetBus event,
    Emitter<BusState> emit,
  ) async {
    emit(BusLoading());
    final response = await _globalService.getBus(event.lineNo);
    if (response.data != null) {
      emit(BusLoaded(response.data!));
    } else if (response.error != null) {
      emit(BusError(response.error!));
    }
  }
}
