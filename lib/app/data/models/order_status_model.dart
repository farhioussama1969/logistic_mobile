class OrderStatusModel {
  int? id;
  String? name;
  String? title;
  String? createdAt;

  OrderStatusModel({this.id, this.name, this.title, this.createdAt});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    return data;
  }
}
