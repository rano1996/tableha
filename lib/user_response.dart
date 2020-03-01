import 'package:treva_shop_flutter/models/data.dart';

class UserResponse {
  String code;
  String message;
  bool isSuccessful;
  bool hasContent;
  int errorId;
  Data data;

  UserResponse(
      {this.code,
      this.message,
      this.isSuccessful,
      this.hasContent,
      this.errorId,
      this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    isSuccessful = json['IsSuccessful'];
    hasContent = json['HasContent'];
    errorId = json['ErrorId'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Message'] = this.message;
    data['IsSuccessful'] = this.isSuccessful;
    data['HasContent'] = this.hasContent;
    data['ErrorId'] = this.errorId;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }

  UserResponse.withError(String errorValue)
      : data = null,
        code = "-1",
        message = errorValue;
}
