import 'package:loogisti/app/data/models/partner_model.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? lang;
  String? callingCode;
  String? phone;
  String? birthday;
  String? gender;
  String? avatar;
  String? status;
  Null? wilaya;
  String? lastLogin;
  String? emailVerifiedAt;
  String? createdAt;
  PartnerModel? partner;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.lang,
    this.callingCode,
    this.phone,
    this.birthday,
    this.gender,
    this.avatar,
    this.status,
    this.wilaya,
    this.lastLogin,
    this.emailVerifiedAt,
    this.createdAt,
    this.partner,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    email = json['email'];
    lang = json['lang'];
    callingCode = json['calling_code'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    status = json['status'];
    wilaya = json['wilaya'];
    lastLogin = json['last_login'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    partner = json['partner'] != null
        ? new PartnerModel.fromJson(json['partner'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['role'] = this.role;
    data['email'] = this.email;
    data['lang'] = this.lang;
    data['calling_code'] = this.callingCode;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['wilaya'] = this.wilaya;
    data['last_login'] = this.lastLogin;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    if (this.partner != null) {
      data['partner'] = this.partner!.toJson();
    }

    return data;
  }
}
