import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/car_renewable/post_renewable/check_renewable.dart';
import 'package:rtad/data/repository.dart';
import 'package:dio/dio.dart';
part 'check_renewable_post_state.dart';

class CheckRenewableCubit extends Cubit<CheckRenewableState> {
  Repository _repository = GetIt.I<Repository>();
  CheckRenewableCubit() : super(CheckRenewableInitial());
  void check(city,licence_no,officeId,appointmentTypeId,appointmentDate,vehicleNo){
    emit(CheckRenewableInitial());
    _repository.checkRenewal(city, licence_no, officeId, appointmentTypeId, appointmentDate, vehicleNo)
    .then((value){
     emit(SuccessRenewable(value));
    })
    .catchError((e){
      switch (e.runtimeType) {
      case DioError:
        // Here's the sample to get the failed response error code and message
       emit(FailedRenewable("Network Error"));
        break;
      default:
      emit(FailedRenewable('Not Successful'));
    }
    });
  }
}
