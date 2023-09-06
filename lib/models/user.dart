class User {
  String? sId;
  String? name;
  String? email;
  String? role;
  int? isPaid;
  int? iV;
  String? fcmToken;
  String? expire_payment;

  User(
      {this.sId,
        this.name,
        this.email,
        this.role,
        this.isPaid,
        this.iV,
        this.expire_payment,
        this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    isPaid = json['is_paid'];
    iV = json['__v'];
    fcmToken = json['fcm_token'];
    expire_payment = json['expire_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['is_paid'] = this.isPaid;
    data['__v'] = this.iV;
    data['fcm_token'] = this.fcmToken;
    data['expire_payment'] = this.expire_payment;
    return data;
  }
}