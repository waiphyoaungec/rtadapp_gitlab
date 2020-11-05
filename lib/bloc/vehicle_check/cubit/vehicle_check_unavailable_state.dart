part of 'vehicle_check_unavailable_cubit.dart';

@immutable
abstract class VehicleCheckUnavailableState {}

class VehicleCheckUnavailableInitial extends VehicleCheckUnavailableState {}

class VehicleCheckUnavailableLoading extends VehicleCheckUnavailableState{}

class VehicleCheckUnavailableSuccess extends VehicleCheckUnavailableState{
  final Unavailable unavailable;

  VehicleCheckUnavailableSuccess(this.unavailable);
}
class VehicleCheckUnavailableFail extends VehicleCheckUnavailableState{
  final String error;

  VehicleCheckUnavailableFail(this.error);
}
