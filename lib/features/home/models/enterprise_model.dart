import 'package:empresas_flutter/features/home/models/enterprise_type_model.dart';

class Enterprises {
  late final int id;
  late final String emailEnterprise;
  late final String facebook;
  late final String twitter;
  late final String linkedin;
  late final String phone;
  late final bool ownEnterprise;
  late final String enterpriseName;
  late final String photo;
  late final String description;
  late final String city;
  late final String country;
  late final num value;
  late final num sharePrice;
  late final EnterpriseType enterpriseType;

  Enterprises({
    required this.id,
    required this.emailEnterprise,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.phone,
    required this.ownEnterprise,
    required this.enterpriseName,
    required this.photo,
    required this.description,
    required this.city,
    required this.country,
    required this.value,
    required this.sharePrice,
    required this.enterpriseType,
  });

  Enterprises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    emailEnterprise = json['email_enterprise'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    phone = json['phone'];
    ownEnterprise = json['own_enterprise'];
    enterpriseName = json['enterprise_name'];
    photo = json['photo'];
    description = json['description'];
    city = json['city'];
    country = json['country'];
    value = json['value'];
    sharePrice = json['share_price'];
    enterpriseType = (json['enterprise_type'] != null
        ? EnterpriseType.fromJson(json['enterprise_type'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email_enterprise'] = this.emailEnterprise;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['phone'] = this.phone;
    data['own_enterprise'] = this.ownEnterprise;
    data['enterprise_name'] = this.enterpriseName;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['city'] = this.city;
    data['country'] = this.country;
    data['value'] = this.value;
    data['share_price'] = this.sharePrice;
    if (this.enterpriseType != null) {
      data['enterprise_type'] = this.enterpriseType.toJson();
    }
    return data;
  }
}
