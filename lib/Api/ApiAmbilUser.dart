
class ApiAmbilUser {
  String? message;
  List<Data>? data;

  ApiAmbilUser({this.message, this.data});

  ApiAmbilUser.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  int? nik;
  String? nomorTelepon;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? level;
  dynamic createdAt;
  dynamic updatedAt;

  Data({this.id, this.nik, this.nomorTelepon, this.name, this.email, this.emailVerifiedAt, this.level, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["nik"] is int) {
      nik = json["nik"];
    }
    if(json["nomor_telepon"] is String) {
      nomorTelepon = json["nomor_telepon"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    emailVerifiedAt = json["email_verified_at"];
    if(json["level"] is String) {
      level = json["level"];
    }
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["nik"] = nik;
    _data["nomor_telepon"] = nomorTelepon;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["level"] = level;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}