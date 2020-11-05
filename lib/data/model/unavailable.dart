class Unavailable {
  bool success;
  Results result;
  int statusCode;
  String message;

  Unavailable({this.success, this.result, this.statusCode, this.message});

  Unavailable.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
        json['result'] != null ? new Results.fromJson(json['result']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }

}

class Results {
  Map<String,dynamic> dates;

  Results({dates});

  Results.fromJson(Map<String, dynamic> json) {
    dates = json;
  }

  
}