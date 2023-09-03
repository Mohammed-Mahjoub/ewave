class Articles {
  String? sId;
  String? title;
  String? content;
  String? image;
  String? createdAt;
  String? updatedAt;

  Articles(
      {this.sId,
        this.title,
        this.content,
        this.image,
        this.createdAt,
        this.updatedAt});

  Articles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}