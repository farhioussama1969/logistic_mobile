class OrderStatusModel {
  int? id;
  String? name;
  String? title;
  String? createdAt;
  String? icon;

  OrderStatusModel({this.id, this.name, this.title, this.createdAt, this.icon});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    createdAt = json['created_at'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['icon'] = this.icon;
    return data;
  }
}
