part of 'vehicle_check_post_cubit.dart';

@immutable
abstract class VehicleCheckPostState {}

class VehicleCheckPostInitial extends VehicleCheckPostState {}

class VehicleCheckPostSuccess extends VehicleCheckPostState{
  final VehiclePost vehiclePost;

  VehicleCheckPostSuccess(this.vehiclePost);
}
class VehicleCheckPostFail extends VehicleCheckPostState{
  final String error;

  VehicleCheckPostFail(this.error);

}
