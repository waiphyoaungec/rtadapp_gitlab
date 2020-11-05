import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/driving/check/driving_check.dart';
import 'package:rtad/data/repository.dart';

part 'drivingcheck_state.dart';

class DrivingcheckCubit extends Cubit<DrivingcheckState> {
  final Repository _repository = GetIt.I.call();
  DrivingcheckCubit() : super(DrivingcheckInitial());
  void drivingCheck(String city,String licenceNo){
    emit(DrivingCheckLoading());
    _repository.drivingCheck(city: city,licenceNo: licenceNo)
     .then((value) => emit(DrivingCheckSuccess(value)))
     .catchError((e) => emit(DrivingCheckFail('Network Error')));
  }
}
