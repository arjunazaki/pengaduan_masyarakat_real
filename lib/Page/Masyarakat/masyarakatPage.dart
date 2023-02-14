import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengaduan_masyarakat_real/Api/Api.dart';
import 'package:pengaduan_masyarakat_real/component.dart';
import 'package:pengaduan_masyarakat_real/Aksi/loginPreferen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pengaduan_masyarakat_real/Api/ApiAmbilUser.dart';

class Masyarakat extends StatefulWidget {
  const Masyarakat({super.key});

  @override
  State<Masyarakat> createState() => _MasyarakatState();
}

class _MasyarakatState extends State<Masyarakat> {
  List<Data> user = [];
  Future<void> users() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    if (token == null) {
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }
    setState(() {
      ambilUser = Api.ambilUser(token);
    });
  }

  Future<ApiAmbilUser>? ambilUser;

  @override
  void initState() {
    users();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;

    final LaporYuk = AppBar(
      backgroundColor: merahColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
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
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.logout_outlined,
                    color: navyColor,
                    size: 30,
                  ),
                  onPressed: () async {
                    await loginpref.logout();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
    final bodyHeigt = tinggi -
        LaporYuk.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return FutureBuilder(
      future: ambilUser,
      builder: (context, AsyncSnapshot<ApiAmbilUser> snapshot) {
        if (snapshot.hasData) {
          return halamanMasyarakat(
              LaporYuk, bodyHeigt, context, lebar, snapshot.data!.data!);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Scaffold halamanMasyarakat(AppBar LaporYuk, double bodyHeigt,
      BuildContext context, double lebar, List<Data> list) {
    return Scaffold(
        appBar: LaporYuk,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: bodyHeigt * 0.1,
              ),
              // Profil...
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                height: bodyHeigt * 0.215,
                decoration: BoxDecoration(
                  color: merahColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "Profil Anda:",
                          style: TextStyle(
                              color: background,
                              fontFamily: 'Itim',
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                    height: bodyHeigt * 0.125,
                    decoration: BoxDecoration(
                        color: orenColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    // "arjunazaki93@gmail.com",
                                    "${list[0].email!}",
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                    style: TextStyle(
                                        color: background, fontFamily: 'Itim'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Text(
                                      "${list[0].name!}",
                                      // "${user[0].name!}",
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                      style: TextStyle(
                                          color: background,
                                          fontFamily: 'Itim'),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${list[0].nomorTelepon!}",
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                    style: TextStyle(
                                        color: background, fontFamily: 'Itim'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: bodyHeigt * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                height: bodyHeigt * 0.3,
                decoration: BoxDecoration(
                  color: navyColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(children: [
                  //Laporan
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/buatLap');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                      height: bodyHeigt * 0.1,
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          FittedBox(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20, right: 15),
                              child: Image.asset(
                                "assets/Group.png",
                                height: 48,
                                width: 40,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: bodyHeigt * 0.05,
                                width: lebar * 0.45,
                                child: ListView(
                                  children: [
                                    Text(
                                      "Sampaikan Laporan Anda Segera!",
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 10),
                                          fontFamily: 'Poppins',
                                          color: merahColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  //Lihat Laporan
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/lihatLap');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                      height: bodyHeigt * 0.1,
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          FittedBox(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20, right: 15),
                              child: Image.asset(
                                "assets/Group 5.png",
                                height: 48,
                                width: 40,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: bodyHeigt * 0.025,
                                width: lebar * 0.45,
                                child: ListView(
                                  children: [
                                    Text(
                                      "Lihat laporan anda",
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 10),
                                          fontFamily: 'Poppins',
                                          color: merahColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: bodyHeigt * 0.05,
              ),

              //Apa itu Lapor Yuk!
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                height: bodyHeigt * 0.2,
                decoration: BoxDecoration(
                  color: orenColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Apa itu Lapor Yuk?",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                color: navyColor),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: bodyHeigt * 0.1,
                          width: lebar * 0.8,
                          child: ListView(
                            children: [
                              Text(
                                "layanan penyampaian semua aspirasi dan pengaduan masyarakat Indonesia melalui beberapa kanal pengaduan yaitu aplikasi",
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Itim', color: background),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 3200) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 653) * MediaQuery.of(context).size.height;
  }
}
