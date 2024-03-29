class PartnerModel {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? address;
  int? professionId;
  int? specialityId;
  String? bio;
  String? avatar;
  double? rating;
  String? commersialRegister;
  MapLocation? mapLocation;
  bool? isFavorite;
  String? status;

  PartnerModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.professionId,
    this.specialityId,
    this.bio,
    this.avatar,
    this.rating,
    this.commersialRegister,
    this.mapLocation,
    this.isFavorite,
    this.status,
  });

  PartnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    professionId = json['profession_id'];
    specialityId = json['speciality_id'];
    bio = json['bio'];
    avatar = json['avatar'];
    rating = double.parse(json['rating'].toString());
    commersialRegister = json['commersial_register'];
    isFavorite = json['isFavorite'];
    mapLocation = json['map_location'] != null
        ? new MapLocation.fromJson(json['map_location'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['profession_id'] = this.professionId;
    data['speciality_id'] = this.specialityId;
    data['bio'] = this.bio;
    data['avatar'] = this.avatar;
    data['rating'] = this.rating;
    data['commersial_register'] = this.commersialRegister;
    data['isFavorite'] = this.isFavorite;
    data['status'] = this.status;
    if (this.mapLocation != null) {
      data['map_location'] = this.mapLocation!.toJson();
    }
    return data;
  }
}

class MapLocation {
  double? latitude;
  double? longitude;

  MapLocation({this.latitude, this.longitude});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
