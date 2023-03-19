import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vexana/vexana.dart';

import '../../../core/init/extensions/asset.extension.dart';
import '../../_models/pharmacy.model.dart';
import '../../_services/global_service.dart';

part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  final IGlobalService _globalService;

  PharmacyBloc(this._globalService) : super(PharmacyLoading()) {
    on<PharmaciesLoadEvent>(_onPharmaciesLoadEvent);
  }

  void _onPharmaciesLoadEvent(
    PharmaciesLoadEvent event,
    Emitter<PharmacyState> emit,
  ) async {
    emit(PharmacyLoading());
    final response = await _globalService.getPharmacies();
    if (response.data != null && response.data!.isNotEmpty) {
      final pharmacyIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(16, 16), devicePixelRatio: 1.5),
        'pharmacy'.toPng,
      );
      emit(
        PharmacyLoaded(
          response.data!
              .where((element) =>
                  element.lokasyonX != null && element.lokasyonY != null)
              .toList(),
          pharmacyIcon,
        ),
      );
    } else if (response.error != null) {
      emit(PharmacyError(response.error!));
    }
  }
}
