import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/car_check/check/car_check.dart';
import 'package:rtad/data/repository.dart';

part 'vehicle_check_state.dart';

class VehicleCheckCubit extends Cubit<VehicleCheckState> {
  final Repository _repository = GetIt.I<Repository>();
  VehicleCheckCubit() : super(VehicleCheckInitial());
  void vehicleCheck({String city,String licenceNo}) {
    emit(VehicleCheckLoading());
    _repository.getVehicleLicenceCheck(city, licenceNo)
    .then((value){
      emit(VehicleCehckSuccess(value));
    })
    .catchError((e) => emit(VehicleCheckFail('Network Error')));
  }
}
