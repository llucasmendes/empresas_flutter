class PerfilEmpresaModel {
  late Enterprise enterprise;
  late bool success;

  PerfilEmpresaModel({required this.enterprise, required this.success});

  PerfilEmpresaModel.fromJson(Map<String, dynamic> json) {
    enterprise = (json['enterprise'] != null
        ? Enterprise.fromJson(json['enterprise'])
        : null)!;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Enterprise {
  int? id;
  late String enterpriseName;
  String? description;
  String? emailEnterprise;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? phone;
  bool? ownEnterprise;
  String? photo;
  num? value;
  num? shares;
  double? sharePrice;
  num? ownShares;
  String? city;
  String? country;
  EnterpriseType? enterpriseType;

  Enterprise(
      {this.id,
      required this.enterpriseName,
      this.description,
      this.emailEnterprise,
      this.facebook,
      this.twitter,
      this.linkedin,
      this.phone,
      this.ownEnterprise,
      this.photo,
      this.value,
      this.shares,
      this.sharePrice,
      this.ownShares,
      this.city,
      this.country,
      this.enterpriseType});

  Enterprise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseName = json['enterprise_name'];
    description = json['description'];
    emailEnterprise = json['email_enterprise'] ?? "";
    facebook = json['facebook'] ?? "";
    twitter = json['twitter'] ?? "";
    linkedin = json['linkedin'] ?? "";
    phone = json['phone'] ?? "";
    ownEnterprise = json['own_enterprise'];
    photo = json['photo'];
    value = json['value'] ?? 0;
    shares = json['shares'];
    sharePrice = json['share_price'];
    ownShares = json['own_shares'];
    city = json['city'];
    country = json['country'];
    enterpriseType = json['enterprise_type'] != null
        ? EnterpriseType.fromJson(json['enterprise_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['enterprise_name'] = this.enterpriseName;
    data['description'] = this.description;
    data['email_enterprise'] = this.emailEnterprise;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['phone'] = this.phone;
    data['own_enterprise'] = this.ownEnterprise;
    data['photo'] = this.photo;
    data['value'] = this.value;
    data['shares'] = this.shares;
    data['share_price'] = this.sharePrice;
    data['own_shares'] = this.ownShares;
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.enterpriseType != null) {
      data['enterprise_type'] = this.enterpriseType!.toJson();
    }
    return data;
  }
}

class EnterpriseType {
  int? id;
  String? enterpriseTypeName;

  EnterpriseType({this.id, this.enterpriseTypeName});

  EnterpriseType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseTypeName = json['enterprise_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['enterprise_type_name'] = this.enterpriseTypeName;
    return data;
  }
}
