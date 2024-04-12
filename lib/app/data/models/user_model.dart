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
  String? status;
  String? avatar;
  String? lastLogin;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.role,
      this.email,
      this.lang,
      this.callingCode,
      this.phone,
      this.birthday,
      this.gender,
      this.status,
      this.avatar,
      this.lastLogin,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

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
    status = json['status'];
    avatar = json['avatar'];
    lastLogin = json['last_login'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['status'] = this.status;
    data['avatar'] = this.avatar;
    data['last_login'] = this.lastLogin;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
