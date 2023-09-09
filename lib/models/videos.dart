class Videos {
  String? sId;
  String? url;
  String? title;
  String? status;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? pinned;

  Videos(
      {this.sId,
        this.url,
        this.title,
        this.status,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.pinned});

  Videos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    pinned = json['pinned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['image'] = this.image;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['pinned'] = this.pinned;
    return data;
  }
}