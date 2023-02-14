import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat_real/Contoh/Users/login.dart';
import 'package:pengaduan_masyarakat_real/Contoh/role.dart';
import 'package:pengaduan_masyarakat_real/Page/Awal/loginPage.dart';

import '../../component.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return loginPage();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Image.asset(
                "assets/logo_.png",
                width: 193,
                height: 193,
              ),
            ),
            new Text("Lapor Yuk!", style: textpengaduan)
          ],
        ),
      ),
    );
  }
}
