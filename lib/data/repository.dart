import 'package:rtad/data/api/apiservice.dart';
import 'package:rtad/data/model/car_check/check/car_check.dart';
import 'package:rtad/data/model/car_check/post/vehicle_post.dart';
import 'package:rtad/data/model/driving/check/driving_check.dart';
import 'package:rtad/data/model/unavailable.dart';
import 'package:rtad/utils/constant.dart';
import 'model/car_renewable/car_renewable_chcek/car_renewable.dart';
import 'model/car_renewable/post_renewable/check_renewable.dart';


class Repository {
  final ApiService _apiService;
  Repository(this._apiService);
//Car Renewable
  Future<CarLicenceModel> getCarRenewal(String city, String licenceNo) {
    String token = Const.changeHash(licenceNo);
    print(token);
    return  _apiService.carLicence(city, licenceNo, Const.code, token);
  }
  Future<Unavailable> unavailableDate(String city,String licenceNo,String officeId,
  String appointId){
    String token = Const.changeHash(licenceNo);
    return _apiService.unavailable(city, licenceNo, Const.code, 
    token, officeId, appointId);
  }
  Future<CheckRenewal> checkRenewal(String city,String licence_no,String officeId,
  String appointmentTypeId,String appointmentDate,String vehicleNo){
    String token = Const.changeHash(licence_no);
    return _apiService.checkRenewable(city, licence_no, Const.code, token, officeId, 
    appointmentTypeId, appointmentDate, vehicleNo);
  }


//Vehicle Registration Check
  Future<VehicleLicenceCheck> getVehicleLicenceCheck(String city, String licenceNo) {
    String token = Const.changeHash(licenceNo);
    print(token);
    return  _apiService.vehicleCheck(city, licenceNo, Const.code, token);
  }
  Future<Unavailable> getVehicleLicenceUnavailable(String city,String licenceNo,String officeId){
    String token = Const.changeHash(licenceNo);
    return _apiService.unavailableVehicleCheck(city, licenceNo, Const.code, 
    token, officeId);
  }
  Future<VehiclePost> vehiclePost(String city,String licence_no,String officeId,String appointmentDate,String vehicleNo){
    String token = Const.changeHash(licence_no);
    return _apiService.vehiclePost(city, licence_no, Const.code, token, officeId, appointmentDate, vehicleNo);
  }

  //Driving Check
  Future<DrivingCheck> drivingCheck({String city,String licenceNo}){
    String token = Const.changeHash(licenceNo);
    print(token);
    return  _apiService.drivingCheck(city, licenceNo, Const.code, token);
  }
  Future<Unavailable> drivingCheckUnavailable(String city,String licenceNo,String officeId){
    String token = Const.changeHash(licenceNo);
    return _apiService.drivingCheckUnavailable(city, licenceNo, Const.code, 
    token, officeId);
  }
}
