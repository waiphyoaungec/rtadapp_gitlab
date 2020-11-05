part of 'drivingcheck_cubit.dart';

@immutable
abstract class DrivingcheckState {}

class DrivingcheckInitial extends DrivingcheckState {}

class DrivingCheckLoading extends DrivingcheckState {}

class DrivingCheckSuccess extends DrivingcheckState {
  final DrivingCheck drivingCheck;

  DrivingCheckSuccess(this.drivingCheck);
}

class DrivingCheckFail extends DrivingcheckState {
  final String error;

  DrivingCheckFail(this.error);
}
