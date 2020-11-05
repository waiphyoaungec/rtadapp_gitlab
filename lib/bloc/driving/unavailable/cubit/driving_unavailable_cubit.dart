import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/unavailable.dart';
import 'package:rtad/data/repository.dart';

part 'driving_unavailable_state.dart';

class DrivingUnavailableCubit extends Cubit<DrivingUnavailableState> {
  final Repository _repository = GetIt.I.call();
  DrivingUnavailableCubit() : super(DrivingUnavailableInitial());
  void getDrivingUnavailable(String city,String licenceNo,String officeId){
    emit(DrivingUnavailableLoading());
    _repository.drivingCheckUnavailable(city, licenceNo, officeId)
    .then((value) => emit(DrivingUnavailableSuccess(value)))
    .catchError((e) => emit(DrivingUnavailableFail("Network Error")));
  }
}
