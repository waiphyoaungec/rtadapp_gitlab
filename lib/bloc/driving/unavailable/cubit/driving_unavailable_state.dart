part of 'driving_unavailable_cubit.dart';

@immutable
abstract class DrivingUnavailableState {}

class DrivingUnavailableInitial extends DrivingUnavailableState {}
class DrivingUnavailableLoading extends DrivingUnavailableState{}
class DrivingUnavailableSuccess extends DrivingUnavailableState{
  final Unavailable unavailable;

  DrivingUnavailableSuccess(this.unavailable);
}
class DrivingUnavailableFail extends DrivingUnavailableState{
  final String error;

  DrivingUnavailableFail(this.error);

}
