
class ApiRegister {
  String? message;
  Data? data;
  String? token;

  ApiRegister({this.message, this.data, this.token});

  ApiRegister.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class Data {
  int? id;
  int? nik;
  String? name;
  String? email;
  String? nomorTelepon;
  String? level;

  Data({this.id, this.nik, this.name, this.email, this.nomorTelepon, this.level});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["nik"] is int) {
      nik = json["nik"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["nomor_telepon"] is String) {
      nomorTelepon = json["nomor_telepon"];
    }
    if(json["level"] is String) {
      level = json["level"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["nik"] = nik;
    _data["name"] = name;
    _data["email"] = email;
    _data["nomor_telepon"] = nomorTelepon;
    _data["level"] = level;
    return _data;
  }
}