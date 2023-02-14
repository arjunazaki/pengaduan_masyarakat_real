import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengaduan_masyarakat_real/component.dart';
import 'package:pengaduan_masyarakat_real/Aksi/loginPreferen.dart';
import '../../Api/Api.dart';
import '../../Provider/Routes/app.routes.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
            height: tingi_layar * 0.1,
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
              "Masuk",
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
                height: tingi_layar * 0.25,
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
                        height: tingi_layar * 0.025,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.05,
                        child: TextFormField(
                          controller: email,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: "email",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tingi_layar * 0.025,
                      ),
                      Container(
                        width: 260,
                        height: tingi_layar * 0.05,
                        child: TextFormField(
                          // controller: ,
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: password,
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
                              login(context);
                              // Navigator.pushReplacementNamed(
                              //     context, "/masyarakat");
                            },
                            child: FittedBox(
                              child: Text(
                                "Masuk",
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
                      "Belum punya akun?",
                      style: TextStyle(
                          fontSize: 13, fontFamily: 'Itim', color: navyColor),
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.Daftar);
                        },
                        child: Text(
                          "Daftar",
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
