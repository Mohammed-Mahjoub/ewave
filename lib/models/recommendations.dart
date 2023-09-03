class Recommendations {
  String? sId;
  String? name;
  String? action;
  String? image;
  int? status;
  String? openingTime;
  int? tradeStyle;
  int? riskPerTrade;
  int? firstTargetPrice;
  int? secondTargetPrice;
  int? stopLoss;
  int? tradeResult;
  String? expireTime;
  num? openPrice;
  int? winRate;
  String? lastUpdate;
  String? comment;
  int? isPaid;
  String? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Recommendations(
      {this.sId,
        this.name,
        this.action,
        this.image,
        this.status,
        this.openingTime,
        this.tradeStyle,
        this.riskPerTrade,
        this.firstTargetPrice,
        this.secondTargetPrice,
        this.stopLoss,
        this.tradeResult,
        this.expireTime,
        this.winRate,
        this.lastUpdate,
        this.comment,
        this.isPaid,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Recommendations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    action = json['action'];
    image = json['image'];
    status = json['status'];
    openingTime = json['opening_time'];
    tradeStyle = json['trade_style'];
    riskPerTrade = json['risk_per_trade'];
    firstTargetPrice = json['first_target_price'];
    secondTargetPrice = json['second_target_price'];
    stopLoss = json['stop_loss'];
    tradeResult = json['trade_result'];
    expireTime = json['expire_time'];
    openPrice = json['open_price'];
    winRate = json['win_rate'];
    lastUpdate = json['last_update'];
    comment = json['comment'];
    isPaid = json['is_paid'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['action'] = this.action;
    data['image'] = this.image;
    data['status'] = this.status;
    data['opening_time'] = this.openingTime;
    data['trade_style'] = this.tradeStyle;
    data['risk_per_trade'] = this.riskPerTrade;
    data['first_target_price'] = this.firstTargetPrice;
    data['second_target_price'] = this.secondTargetPrice;
    data['stop_loss'] = this.stopLoss;
    data['trade_result'] = this.tradeResult;
    data['expire_time'] = this.expireTime;
    data['win_rate'] = this.winRate;
    data['last_update'] = this.lastUpdate;
    data['comment'] = this.comment;
    data['is_paid'] = this.isPaid;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}