import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http_parser/http_parser.dart';
import 'package:pengaduan_masyarakat_real/Api/ApiAmbilUser.dart';
import 'package:pengaduan_masyarakat_real/Api/ApiLogin.dart';
import 'package:pengaduan_masyarakat_real/Api/ApiRegister.dart';
import 'ApiInsert.dart';

const baseUrl = "http://127.0.0.1:8004/api/";

class Api {
  static Future<ApiLogin> login(Map<String, String> data) async {
    var url = "${baseUrl}login";
    var response = await http.post(Uri.parse(url),
        headers: {'Accept': 'application/json'}, body: data);
    if (response.statusCode == 200) {
      return ApiLogin.fromJson(jsonDecode(response.body));
    } else {
      (throw "Gagal mengambil data");
    }
  }

  static Future<ApiRegister> masyarakatRegister(
      Map<String, String> data) async {
    var url = Uri.parse(baseUrl + 'registerMas');
    var response = await http.post(url,
        headers: {'Accept': 'application/json'}, body: data);
    return ApiRegister.fromJson(jsonDecode(response.body));
  }

  static Future<ApiAmbilUser> ambilUser(String token) async {
    var url = Uri.parse(baseUrl + 'ambilUser');
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return ApiAmbilUser.fromJson(jsonDecode(response.body));
  }

  static Future<ApiInsert> insertLaporan(
      Map data, String? baseImage, Uint8List? webImage, String? token) async {
    var url = Uri.parse('${baseUrl}tambahLaporan');
    if (!kIsWeb) {
      var response = await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, body: {
        'isi_laporan': data['isi_laporan'],
        'status': 'pending',
        'foto': baseImage
      });
      return ApiInsert.fromJson(jsonDecode(response.body));
    } else if (kIsWeb) {
      var request = http.MultipartRequest("POST", url);
      request.files.add(http.MultipartFile.fromBytes('foto', webImage!,
          contentType: MediaType('application', 'octet-stream'),
          filename: 'myImage.png'));
      request.headers.addAll({'Accept': 'application/json',"Authorization": "Bearer $token"});
      request.fields['isi_laporan'] = data['isi_laporan'];
      request.fields['status'] = 'pending';

      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      final responData = json.decode(responsed.body);
      return ApiInsert.fromJson(responData);
    }
    throw "Gagal";
  }
}
