part of 'unavailable_cubit.dart';

@immutable
abstract class UnavailableState {}

class UnavailableInitial extends UnavailableState {}

class LoadingDate extends UnavailableState{}

class SuccessDate extends UnavailableState{
  final Unavailable date;

  SuccessDate(this.date);
}
class FailDate extends UnavailableState{
  final String error;

  FailDate(this.error);
}
