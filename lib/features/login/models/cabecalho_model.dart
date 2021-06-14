class CabecalhoModel {
  String? uid;
  String? acessToken;
  String? client;

  CabecalhoModel({
    this.uid,
    this.acessToken,
    this.client,
  });

  bool get isValido => uid != null && acessToken != null && client != null;

  CabecalhoModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    acessToken = json['acess-token'];
    client = json['client'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['acess-token'] = this.acessToken;
    data['client'] = this.client;
    return data;
  }
}
