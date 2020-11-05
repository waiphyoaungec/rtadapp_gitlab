import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/car_check/post/vehicle_post.dart';
import 'package:rtad/data/repository.dart';

part 'vehicle_check_post_state.dart';

class VehicleCheckPostCubit extends Cubit<VehicleCheckPostState> {
  Repository _repository = GetIt.I.call();
  VehicleCheckPostCubit() : super(VehicleCheckPostInitial());
  void vehicleCheckPost(
      {String city,
      String licence_no,
      String officeId,
      String appointmentDate,
      String vehicleNo}) {
    emit(VehicleCheckPostInitial());
    _repository
        .vehiclePost(city, licence_no, officeId, appointmentDate, vehicleNo)
        .then((value) => emit(VehicleCheckPostSuccess(value)))
        .catchError((e) => emit(VehicleCheckPostFail("Network Error")));
  }
}
