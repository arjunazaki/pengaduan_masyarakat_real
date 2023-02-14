import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengaduan_masyarakat_real/Api/Api.dart';
import 'package:pengaduan_masyarakat_real/Aksi/loginPreferen.dart';
import '../../Provider/Routes/app.routes.dart';
import '../../component.dart';

class daftarMAsyarakat extends StatefulWidget {
  const daftarMAsyarakat({super.key});

  @override
  State<daftarMAsyarakat> createState() => _daftarMAsyarakatState();
}

class _daftarMAsyarakatState extends State<daftarMAsyarakat> {
  TextEditingController _nik = TextEditingController();
  TextEditingController _nomor_telp = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  register() async {
    var name = _name.text;
    var nik = _nik.text;
    var email = _email.text;
    var nomor_telp = _nomor_telp.text;
    var password = _password.text;

    var data = {
      'name': name,
      'nik': nik.toString(),
      'email': email,
      'nomor_telepon': nomor_telp.toString(),
      'password': password
    };

    Api.masyarakatRegister(data).then((value) async {
      loginpref.saveToSharedPref(value.data!.id!.toString(), value.data!.name!,
          value.data!.level!, value.token!);
      if (value.data!.level! == 'admin') {
        Navigator.pushReplacementNamed(context, '/petugas');
      } else if (value.data!.level! == 'petugas') {
      } else if (value.data!.level! == 'masyarakat') {
        Navigator.pushReplacementNamed(context, '/masyarakat');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tingi_layar = MediaQuery.of(context).size.height;
    final bodyHeigt = tingi_layar - MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          SizedBox(
            height: tingi_layar * 0.05,
          ),
          Center(
            child: FittedBox(
              child: Image.asset(
                "assets/logo_.png",
                height: 193,
                width: 193,
              ),
            ),
          ),
          SizedBox(
            height: tingi_layar * 0.005,
          ),
          FittedBox(
            child: Text(
              "Daftar",
              style:
                  TextStyle(fontFamily: 'Itim', fontSize: 40, color: navyColor),
            ),
          ),
          SizedBox(
            height: tingi_layar * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: FittedBox(
              child: Container(
                height: tingi_layar * 0.4,
                width: 303,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      topLeft: Radius.circular(13)),
                  color: merahColor,
                ),
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: tingi_layar * 0.02,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.04,
                        child: TextFormField(
                          controller: _nik,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "nik",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tingi_layar * 0.02,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.04,
                        child: TextFormField(
                          controller: _email,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "email",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tingi_layar * 0.02,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.04,
                        child: TextFormField(
                          controller: _name,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "name",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tingi_layar * 0.02,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.04,
                        child: TextFormField(
                          controller: _nomor_telp,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "nomor telepon",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tingi_layar * 0.02,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.04,
                        child: TextFormField(
                          controller: _password,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tingi_layar * 0.03,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.04,
                        child: ElevatedButton(
                            // style: ElevatedButton.styleFrom(
                            //   onPrimary: Colors.black87,
                            //   primary: Colors.grey[300],
                            //   shape: const RoundedRectangleBorder(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(2)),
                            //   ),
                            // ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(background),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        side:
                                            BorderSide(color: Colors.black)))),
                            onPressed: () {
                              register();
                            },
                            child: FittedBox(
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                    color: navyColor,
                                    fontFamily: 'Itim',
                                    fontSize: 16),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: FittedBox(
              child: Container(
                height: tingi_layar * 0.05,
                width: 303,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13)),
                  color: orenColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun?",
                      style: TextStyle(
                          fontSize: 13, fontFamily: 'Itim', color: navyColor),
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.Login);
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Itim',
                              color: background),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
