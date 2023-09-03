class Videos {
  String? sId;
  String? url;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  Videos(
      {this.sId,
        this.url,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt});

  Videos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}