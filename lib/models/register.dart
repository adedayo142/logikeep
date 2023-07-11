//Register register = Register();

// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.data,
    required this.token,
    required this.status,
    required this.message,
  });

  final Data data;
  final String token;
  final String status;
  final String message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        data: Data.fromJson(json["data"]),
        token: json["token"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "token": token,
        "status": status,
        "message": message,
      };
}

class Data {
  Data({
     this.firstname,
     this.lastname,
     this.email,
   this.phonenumber,
     this.allCountryId,
     this.password,
     this.confirmPassword,
     this.referralCode,
     this.id,
  });

   String? firstname;
   String? lastname;
   String? email;
   String? phonenumber;
   String? allCountryId;
   String? password;
   String? confirmPassword;
   int? referralCode;
   int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        allCountryId: json["all_country_id"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        referralCode: json["referral_code"],

        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phonenumber": phonenumber,
        "all_country_id": allCountryId,
        "password": password,
        "confirm_password": confirmPassword,
        "referral_code": referralCode,

        "id": id,
      };
}
