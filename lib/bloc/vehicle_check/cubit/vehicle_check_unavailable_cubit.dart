import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/unavailable.dart';
import 'package:rtad/data/repository.dart';

part 'vehicle_check_unavailable_state.dart';

class VehicleCheckUnavailableCubit extends Cubit<VehicleCheckUnavailableState> {
  final Repository _repository = GetIt.I.call();
  VehicleCheckUnavailableCubit() : super(VehicleCheckUnavailableInitial());
  void getDate({String city,String licenceNo,String officeId}){
    emit(VehicleCheckUnavailableLoading());
    _repository.getVehicleLicenceUnavailable(city, licenceNo, officeId)
     .then((value) => emit(VehicleCheckUnavailableSuccess(value)))
     .catchError((e) {
       print(e.toString());
       emit(VehicleCheckUnavailableFail('Network Error'));
     });

  }
}
