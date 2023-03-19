part of 'pharmacy_bloc.dart';

abstract class PharmacyState extends Equatable {
  const PharmacyState();

  @override
  List<Object> get props => [];
}

class PharmacyLoading extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  final List<PharmacyModel> pharmacies;
  final BitmapDescriptor pharmacyIcon;

  const PharmacyLoaded(this.pharmacies, this.pharmacyIcon);

  @override
  List<Object> get props => [pharmacies, pharmacyIcon];
}

class PharmacyError extends PharmacyState {
  final IErrorModel<INetworkModel<dynamic>?> error;

  const PharmacyError(this.error);

  @override
  List<Object> get props => [error];
}
