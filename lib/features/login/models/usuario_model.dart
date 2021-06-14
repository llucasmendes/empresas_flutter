class UsuarioModel {
  Investor? investor;
  bool? success;

  String? uid;
  String? accessToken;
  String? client;

  UsuarioModel({
    this.investor,
    this.success,
  });

  setAccessData(
    String newUid,
    String newAccessToken,
    String newClient,
  ) {
    uid = newUid;
    accessToken = newAccessToken;
    client = newClient;
  }

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    investor = json['investor'] != null
        ? new Investor.fromJson(json['investor'])
        : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.investor != null) {
      data['investor'] = this.investor!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Investor {
  int? id;
  String? investorName;
  String? email;
  String? city;
  String? country;
  double? balance;
  double? portfolioValue;
  bool? firstAccess;
  bool? superAngel;

  Investor({
    this.id,
    this.investorName,
    this.email,
    this.city,
    this.country,
    this.balance,
    this.portfolioValue,
    this.firstAccess,
    this.superAngel,
  });

  Investor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    investorName = json['investor_name'];
    email = json['email'];
    city = json['city'];
    country = json['country'];
    balance = json['balance'];
    portfolioValue = json['portfolio_value'];
    firstAccess = json['first_access'];
    superAngel = json['super_angel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['investor_name'] = this.investorName;
    data['email'] = this.email;
    data['city'] = this.city;
    data['country'] = this.country;
    data['balance'] = this.balance;
    data['portfolio_value'] = this.portfolioValue;
    data['first_access'] = this.firstAccess;
    data['super_angel'] = this.superAngel;
    return data;
  }
}
