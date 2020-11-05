part of 'vehicle_check_cubit.dart';

@immutable
abstract class VehicleCheckState {}

class VehicleCheckInitial extends VehicleCheckState {}
class VehicleCheckLoading extends VehicleCheckState{}
class VehicleCehckSuccess extends VehicleCheckState{
  final VehicleLicenceCheck vehicleLicenceCheck;

  VehicleCehckSuccess(this.vehicleLicenceCheck);

}
class VehicleCheckFail extends VehicleCheckState{
  final String error;

  VehicleCheckFail(this.error);
}
