part of 'check_renewable_post_cubit.dart';

@immutable
abstract class CheckRenewableState {}

class CheckRenewableInitial extends CheckRenewableState {}

class SuccessRenewable extends CheckRenewableState{
  final CheckRenewal checkRenewal;

  SuccessRenewable(this.checkRenewal);
}
class FailedRenewable extends CheckRenewableState{
  final  String error;

  FailedRenewable(this.error);
}
