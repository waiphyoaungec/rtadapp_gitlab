import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/car_renewable/car_renewable_chcek/car_renewable.dart';
import 'package:rtad/data/repository.dart';
import 'package:rtad/utils/constant.dart';

part 'car_renewable_state_check.dart';

class CarLicenceCubit extends Cubit<CarLicenceState> {
  Repository repository = GetIt.I<Repository>();
  CarLicenceCubit() : super(CarLicenceInitial());
  void getToken(String licenceNo,String city){
    emit(CarLicenceLoading());
    repository.getCarRenewal(city,licenceNo)
    .then((value) => emit(SuccessToken(value)))
    .catchError((e) => emit(FailedToken(e.toString())))
    ;
}
}
