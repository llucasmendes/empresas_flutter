import 'package:empresas_flutter/features/home/models/enterprise_model.dart';

class EmpresasModel {
  late List<Enterprises> enterprises;

  EmpresasModel({required this.enterprises});

  EmpresasModel.fromJson(Map<String, dynamic> json) {
    if (json['enterprises'] != null) {
      enterprises = <Enterprises>[];
      json['enterprises'].forEach((v) {
        enterprises.add(Enterprises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterprises'] = this.enterprises.map((v) => v.toJson()).toList();
    return data;
  }
}
