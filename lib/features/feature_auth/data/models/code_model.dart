class CodeModel {
  CodeModel({
    this.accessToken,
    this.name,
    this.mobile,
    this.tokenType,
    this.expiresIn,});

  CodeModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    name = json['name'];
    mobile = json['mobile'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
  String? accessToken;
  String? name;
  String? mobile;
  String? tokenType;
  int? expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['name'] = name;
    map['mobile'] = mobile;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    return map;
  }

}