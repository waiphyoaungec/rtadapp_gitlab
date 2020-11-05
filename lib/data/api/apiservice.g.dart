// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiservice.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://67.207.85.58/rtadapi/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<CarLicenceModel> carLicence(city, licenceNo, code, token) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(licenceNo, 'licenceNo');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': licenceNo,
      r'code': code,
      r'token': token
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-renewal/appointment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CarLicenceModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<Unavailable> unavailable(
      city, licenceNo, code, token, officeId, appointmentTypeId) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(licenceNo, 'licenceNo');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(officeId, 'officeId');
    ArgumentError.checkNotNull(appointmentTypeId, 'appointmentTypeId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': licenceNo,
      r'code': code,
      r'token': token,
      r'officeId': officeId,
      r'appointmentTypeId': appointmentTypeId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-renewal/appointment/unavailable-date',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Unavailable.fromJson(_result.data);
    return value;
  }

  @override
  Future<CheckRenewal> checkRenewable(city, license_no, code, token, officeId,
      appointmentTypeId, appointmentDate, vehicleNo) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(license_no, 'license_no');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(officeId, 'officeId');
    ArgumentError.checkNotNull(appointmentTypeId, 'appointmentTypeId');
    ArgumentError.checkNotNull(appointmentDate, 'appointmentDate');
    ArgumentError.checkNotNull(vehicleNo, 'vehicleNo');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': license_no,
      r'code': code,
      r'token': token,
      r'officeId': officeId,
      r'appointmentTypeId': appointmentTypeId,
      r'appointmentDate': appointmentDate,
      r'vehicleNo': vehicleNo
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-renewal/appointment/check-renewal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CheckRenewal.fromJson(_result.data);
    return value;
  }

  @override
  Future<VehicleLicenceCheck> vehicleCheck(city, licenceNo, code, token) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(licenceNo, 'licenceNo');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': licenceNo,
      r'code': code,
      r'token': token
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-registration-check/appointment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VehicleLicenceCheck.fromJson(_result.data);
    return value;
  }

  @override
  Future<Unavailable> unavailableVehicleCheck(
      city, licenceNo, code, token, officeId) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(licenceNo, 'licenceNo');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(officeId, 'officeId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': licenceNo,
      r'code': code,
      r'token': token,
      r'officeId': officeId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-registration-check/appointment/unavailable-date',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Unavailable.fromJson(_result.data);
    return value;
  }

  @override
  Future<VehiclePost> vehiclePost(city, license_no, code, token, officeId,
      appointmentDate, vehicleNo) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(license_no, 'license_no');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(officeId, 'officeId');
    ArgumentError.checkNotNull(appointmentDate, 'appointmentDate');
    ArgumentError.checkNotNull(vehicleNo, 'vehicleNo');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': license_no,
      r'code': code,
      r'token': token,
      r'officeId': officeId,
      r'appointmentDate': appointmentDate,
      r'vehicleNo': vehicleNo
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-renewal/appointment/check-renewal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VehiclePost.fromJson(_result.data);
    return value;
  }

  @override
  Future<DrivingCheck> drivingCheck(city, licenceNo, code, token) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(licenceNo, 'licenceNo');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': licenceNo,
      r'code': code,
      r'token': token
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/vehicle-registration-check/appointment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DrivingCheck.fromJson(_result.data);
    return value;
  }

  @override
  Future<Unavailable> drivingCheckUnavailable(
      city, licenceNo, code, token, officeId) async {
    ArgumentError.checkNotNull(city, 'city');
    ArgumentError.checkNotNull(licenceNo, 'licenceNo');
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(officeId, 'officeId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'license_no': licenceNo,
      r'code': code,
      r'token': token,
      r'officeId': officeId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$city/v1/driving-license-renewal/appointment/unavailable-date',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Unavailable.fromJson(_result.data);
    return value;
  }
}
