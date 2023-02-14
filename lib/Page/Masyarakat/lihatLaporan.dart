import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengaduan_masyarakat_real/component.dart';
import 'package:pengaduan_masyarakat_real/Aksi/loginPreferen.dart';

class lihatLaporan extends StatefulWidget {
  const lihatLaporan({super.key});

  @override
  State<lihatLaporan> createState() => _lihatLaporanState();
}

class _lihatLaporanState extends State<lihatLaporan> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
    final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;
    final bodyHeigt = tinggi -
        LaporYuk.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: background,
      appBar: LaporYuk,
      body: ListView(children: [
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
                    "Semua Laporan",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: background, fontFamily: 'Poppins', fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: bodyHeigt * 0.025,
        ),
        Center(
          child: Container(
            width: lebar * 0.84,
            height: bodyHeigt * 0.3,
            decoration: BoxDecoration(
                color: orenColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: SizedBox(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
