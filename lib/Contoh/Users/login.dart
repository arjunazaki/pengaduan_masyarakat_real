import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pengaduan_masyarakat_real/Aksi/loginPreferen.dart';
import 'package:pengaduan_masyarakat_real/Page/adminPage.dart';
import 'package:pengaduan_masyarakat_real/component.dart';
import 'package:http/http.dart' as http;
import '../../Api/Api.dart';
import '../../Provider/Routes/app.routes.dart';

class loginAdmin extends StatefulWidget {
  const loginAdmin({super.key});

  @override
  State<loginAdmin> createState() => _loginAdminState();
}

class _loginAdminState extends State<loginAdmin> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String msg = '';
  login(BuildContext context) {
    String emails = email.text;
    String passwords = password.text;
    var data = {
      "email": "${emails}",
      "password": "${passwords}",
    };
    Api.login(data).then((value) async {
      loginpref.saveToSharedPref(value.data!.id!.toString(), value.data!.name!,
          value.data!.level!, value.token!);
      if (value.data!.level! == 'admin') {
        Navigator.pushReplacementNamed(context, '/petugas');
      } else if (value.data!.level! == 'petugas') {
      } else if (value.data!.level! == 'masyarakat') {
        Navigator.pushReplacementNamed(context, '/pageMasyarakat');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future<List> _login() async {
    //   final response = await http
    //       .post(Uri.parse("http://127.0.0.1:8000/api/login"), headers: {
    //     'Accept': 'application/json'
    //   }, body: {
    //     "email": email.text,
    //     "password": password.text,
    //   });
    //   var dataUser = jsonDecode(response.body);
    //   print(dataUser);
    //   if (dataUser.length == 0) {
    //     setState(() {
    //       msg = "Login Failed";
    //     });
    //   } else {
    //     loginpref.saveToSharedPref(dataUser.data.id.toString(),
    //         dataUser.data.name, dataUser.data.level);
    //     Navigator.pushReplacementNamed(context, '/admin');
    //   }
    // }

    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: [
          Column(
            children: [
              new SizedBox(
                height: 119,
              ),
              new Image.asset(
                "assets/logo.png",
                width: 124,
                height: 138,
              ),
              new SizedBox(
                height: 18,
              ),
              new Text(
                "Masuk",
                style: TextStyle(
                    fontFamily: 'Itim', fontSize: 40, color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 178,
                width: 303,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      topLeft: Radius.circular(13)),
                  color: Color.fromRGBO(114, 134, 211, 1),
                ),
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 23,
                      ),
                      Container(
                        width: 260,
                        height: 29,
                        child: TextFormField(
                          controller: email,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "username",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: 260,
                        height: 29,
                        child: TextFormField(
                          controller: password,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 260,
                        height: 29,
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
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(142, 167, 233, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        side:
                                            BorderSide(color: Colors.black)))),
                            onPressed: () {
                              login(context);
                            },
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Itim',
                                  fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 31,
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
                      "Belum punya akun?",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Itim',
                          color: Colors.black),
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.Daftar);
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Itim',
                              color: orenColor),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
