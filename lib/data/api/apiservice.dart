import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rtad/data/model/car_check/check/car_check.dart';
import 'package:rtad/data/model/car_check/post/vehicle_post.dart';
import 'package:rtad/data/model/car_renewable/car_renewable_chcek/car_renewable.dart';
import 'package:rtad/data/model/car_renewable/post_renewable/check_renewable.dart';
import 'package:rtad/data/model/driving/check/driving_check.dart';
import 'package:rtad/data/model/unavailable.dart';
import 'package:rtad/utils/constant.dart';

part 'apiservice.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('/{city}/v1/vehicle-renewal/appointment')
  Future<CarLicenceModel> carLicence(
      @Path() String city,
      @Query('license_no') String licenceNo,
      @Query('code') String code,
      @Query('token') String token);
  @GET('/{city}/v1/vehicle-renewal/appointment/unavailable-date')
  Future<Unavailable> unavailable(
      @Path() city,
      @Query('license_no') String licenceNo,
      @Query('code') String code,
      @Query('token') String token,
      @Query('officeId') String officeId,
      @Query('appointmentTypeId') String appointmentTypeId);
  @GET('/{city}/v1/vehicle-renewal/appointment/check-renewal')
  Future<CheckRenewal> checkRenewable(
    @Path() String city,
    @Query('license_no') String license_no,
    @Query('code') String code,
    @Query('token') String token,
    @Query('officeId') String officeId,
    @Query('appointmentTypeId') String appointmentTypeId,
    @Query('appointmentDate') String appointmentDate,
    @Query('vehicleNo') String vehicleNo,
  );

//Vehicle Check
  @GET('/{city}/v1/vehicle-registration-check/appointment')
  Future<VehicleLicenceCheck> vehicleCheck(
      @Path() String city,
      @Query('license_no') String licenceNo,
      @Query('code') String code,
      @Query('token') String token);
  @GET('/{city}/v1/vehicle-registration-check/appointment/unavailable-date')
  Future<Unavailable> unavailableVehicleCheck(
    @Path() city,
    @Query('license_no') String licenceNo,
    @Query('code') String code,
    @Query('token') String token,
    @Query('officeId') String officeId,
  );
  @GET('/{city}/v1/vehicle-renewal/appointment/check-renewal')
  Future<VehiclePost> vehiclePost(
    @Path() String city,
    @Query('license_no') String license_no,
    @Query('code') String code,
    @Query('token') String token,
    @Query('officeId') String officeId,
    @Query('appointmentDate') String appointmentDate,
    @Query('vehicleNo') String vehicleNo,
  );

  //Driving
  @GET('/{city}/v1/vehicle-registration-check/appointment')
  Future<DrivingCheck> drivingCheck(
      @Path() String city,
      @Query('license_no') String licenceNo,
      @Query('code') String code,
      @Query('token') String token);
  @GET('/{city}/v1/driving-license-renewal/appointment/unavailable-date')
  Future<Unavailable> drivingCheckUnavailable(
    @Path() city,
    @Query('license_no') String licenceNo,
    @Query('code') String code,
    @Query('token') String token,
    @Query('officeId') String officeId,
  );
}
