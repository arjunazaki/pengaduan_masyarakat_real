import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart'
    if (kIsWeb) 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:pengaduan_masyarakat_real/Api/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../component.dart';

class buatLaporan extends StatefulWidget {
  const buatLaporan({super.key});

  @override
  State<buatLaporan> createState() => _buatLaporanState();
}

class _buatLaporanState extends State<buatLaporan> {
  File? pickedImage;
  Uint8List webImage = Uint8List(8);
  String? baseImage;

  Future<void> _pilihFoto() async {
    final ImagePicker imagePicker = ImagePicker();
    var choosedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    var f = await choosedImage!.readAsBytes();
    setState(() {
      webImage = f;
      pickedImage = File(choosedImage.path);
    });
  }

  // TextEditingController _tanggal = TextEditingController();
  TextEditingController _isi = TextEditingController();
  tambahLaporan(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // var tanggal = _tanggal.text;
    var isi = _isi.text;

    try {
      if (!kIsWeb) {
        List<int> imageBytes = pickedImage!.readAsBytesSync();
        String baseImage = base64Encode(imageBytes);
      }
    } catch (e) {
      print('Error');
    }

    var data = {
      // 'tanggal_pegaduan': tanggal,
      'isi_laporan': isi,
    };
    print(isi);

    Api.insertLaporan(data, baseImage, webImage, pref.getString('token'))
        .then((value) async {
      if (value.message == null) {
        //muncul error
        print("Sesuatu ada yang gagal");
        return;
      }
      print(value.message!);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/masyarakat");
    });
  }

  @override
  Widget build(BuildContext context) {
    final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;

    final LaporYuk = AppBar(
      backgroundColor: merahColor,
      title: Row(
        children: [
          Text(
            "Lapor Yuk",
            style: TextStyle(
                color: background, fontFamily: 'Poppins', fontSize: 32),
          ),
          Text(
            "!",
            style: TextStyle(
                color: navyColor, fontFamily: 'Poppins', fontSize: 32),
          ),
        ],
      ),
    );
    final bodyHeigt = tinggi -
        LaporYuk.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: LaporYuk,
      backgroundColor: background,
      body: Column(
        children: [
          SizedBox(
            height: bodyHeigt * 0.025,
          ),
          //Laporan text
          Center(
            child: Container(
              width: lebar * 0.9,
              height: bodyHeigt * 0.1,
              decoration: BoxDecoration(
                  color: navyColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: SizedBox(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Sampaikan Laporan Anda Segera!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: background,
                          fontFamily: 'Poppins',
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: bodyHeigt * 0.025,
          ),
          Container(
            height: bodyHeigt * 0.5,
            width: lebar * 0.85,
            decoration: BoxDecoration(
                color: orenColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              children: [
                SizedBox(
                  height: bodyHeigt * 0.02,
                ),
                Container(
                  width: lebar * 0.7,
                  height: bodyHeigt * 0.05,
                  decoration: BoxDecoration(
                      color: merahColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text(
                      "Tulis Laporan Anda",
                      style: TextStyle(
                          color: background,
                          fontFamily: 'Poppins',
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: bodyHeigt * 0.02,
                ),
                Form(
                    child: Column(
                  children: [
                    // Container(
                    //     width: lebar * 0.7,
                    //     height: bodyHeigt * 0.055,
                    //     child: TextFormField(
                    //       keyboardType: TextInputType.datetime,
                    //       textAlignVertical: TextAlignVertical.center,
                    //       decoration: InputDecoration(
                    //           filled: true,
                    //           fillColor: merahColor,
                    //           hintText: "tanggal kejadian",
                    //           hintStyle: hint,
                    //           border: OutlineInputBorder(
                    //               borderSide: BorderSide.none),
                    //           focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide.none)),
                    //     )),
                    SizedBox(
                      height: bodyHeigt * 0.02,
                    ),
                    Container(
                        width: lebar * 0.7,
                        height: bodyHeigt * 0.2,
                        child: TextFormField(
                          controller: _isi,
                          keyboardType: TextInputType.datetime,
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 6,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: merahColor,
                              hintText: "Isi laporan",
                              hintStyle: hint,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        )),
                    SizedBox(
                      height: bodyHeigt * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: lebar * 0.35,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(merahColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ))),
                              child: Center(
                                child: Text(
                                  pickedImage == null
                                      ? "Uplode Foto(MAX 2mb)"
                                      : "sudah ada",
                                  style: TextStyle(
                                      fontFamily: 'Itim', fontSize: 8),
                                ),
                              ),
                              onPressed: () {
                                _pilihFoto();
                              },
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            width: lebar * 0.35,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(merah50Color),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          side: BorderSide(
                                              width: 1, color: navyColor)))),
                              child: Text(
                                "Lapor",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: background),
                              ),
                              onPressed: () {
                                tambahLaporan(context);
                              },
                            )),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
