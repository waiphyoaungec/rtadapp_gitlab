part of 'car_renewable_cubit_check.dart';

@immutable
abstract class CarLicenceState {}

class CarLicenceInitial extends CarLicenceState {}

class CarLicenceLoading extends CarLicenceState{}

class SuccessToken extends CarLicenceState{
  final CarLicenceModel carLicenceModel;

  SuccessToken(this.carLicenceModel);
}
class FailedToken extends CarLicenceState{
  final String error;

  FailedToken(this.error);
}


