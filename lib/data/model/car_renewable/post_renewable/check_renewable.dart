class CheckRenewal {
  bool success;
  Result result;
  int statusCode;
  String message;

  CheckRenewal({this.success, this.result, this.statusCode, this.message});

  CheckRenewal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  String officeId;
  String appointmentTypeId;
  String appointmentDate;
  String vehicleNo;

  Result(
      {this.officeId,
      this.appointmentTypeId,
      this.appointmentDate,
      this.vehicleNo});

  Result.fromJson(Map<String, dynamic> json) {
    officeId = json['officeId'];
    appointmentTypeId = json['appointmentTypeId'];
    appointmentDate = json['appointmentDate'];
    vehicleNo = json['vehicleNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['officeId'] = this.officeId;
    data['appointmentTypeId'] = this.appointmentTypeId;
    data['appointmentDate'] = this.appointmentDate;
    data['vehicleNo'] = this.vehicleNo;
    return data;
  }
}