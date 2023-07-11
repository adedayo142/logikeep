// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

class AuthResponse {
  AuthResponse({
    this.status,
    this.data,
    this.token,
    this.message,
  });

  String? status;
  Data? data;
  String? token;
  String? message;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
        message: json["message"],
      );
}

class Data {
  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phonenumber,
    this.confirmPassword,
    this.stateId,
    this.allCountryId,
    this.industryId,
    this.businessName,
    this.businessAddress,
    this.businessPhone,
    this.businessDoc,
    this.businessLogo,
    this.referralCode,
    this.plan,
    this.createdAt,
    this.updatedAt,
    this.wallet,
    this.point,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phonenumber;
  String? confirmPassword;
  dynamic stateId;
  String? allCountryId;
  dynamic industryId;
  dynamic businessName;
  dynamic businessAddress;
  dynamic businessPhone;
  dynamic businessDoc;
  dynamic businessLogo;
  String? referralCode;
  String? plan;
  DateTime? createdAt;
  DateTime? updatedAt;
  Wallet? wallet;
  dynamic point;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        confirmPassword: json["confirm_password"],
        stateId: json["state_id"],
        allCountryId: json["all_country_id"],
        industryId: json["industry_id"],
        businessName: json["business_name"],
        businessAddress: json["business_address"],
        businessPhone: json["business_phone"],
        businessDoc: json["business_doc"],
        businessLogo: json["business_logo"],
        referralCode: json["referral_code"],
        plan: json["plan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        wallet: Wallet.fromJson(json["wallet"]),
        point: json["point"],
      );
}

class Wallet {
  Wallet({
    this.id,
    this.userId,
    this.walletCredit,
    this.walletDebit,
    this.walletBalance,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? walletCredit;
  String? walletDebit;
  String? walletBalance;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        userId: json["user_id"],
        walletCredit: json["wallet_credit"],
        walletDebit: json["wallet_debit"],
        walletBalance: json["wallet_balance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
