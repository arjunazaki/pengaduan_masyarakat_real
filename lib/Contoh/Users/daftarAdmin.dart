import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pengaduan_masyarakat_real/Provider/Routes/app.routes.dart';
import '../../component.dart';

class daftarAdmin extends StatefulWidget {
  const daftarAdmin({super.key});

  @override
  State<daftarAdmin> createState() => _daftarAdminState();
}

class _daftarAdminState extends State<daftarAdmin> {
  String _selectData = "admin";

  final List<String> data = ["admin", "petugas", "masyarakat"];

  _MyFormState() {
    _selectData = data[0];
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nama = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController nomor = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController role = TextEditingController();

    final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: [
          Column(
            children: [
              new SizedBox(
                height: tinggi * 0.1,
              ),
              new Image.asset(
                "assets/logo.png",
                width: 124,
                height: 138,
              ),
              new SizedBox(
                height: tinggi * 0.015,
              ),
              new Text(
                "Daftar",
                style: TextStyle(
                    fontFamily: 'Itim', fontSize: 40, color: Colors.black),
              ),
              SizedBox(
                height: tinggi * 0.015,
              ),
              Container(
                height: tinggi * 0.4,
                width: lebar * 0.8,
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
                        height: tinggi * 0.02,
                      ),
                      Container(
                        width: lebar * 0.7,
                        height: tinggi * 0.04,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "nama",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.015,
                      ),
                      Container(
                        width: lebar * 0.7,
                        height: tinggi * 0.04,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "username",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.015,
                      ),
                      Container(
                        width: lebar * 0.7,
                        height: tinggi * 0.04,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "nomor telepon",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.015,
                      ),
                      Container(
                        width: lebar * 0.7,
                        height: tinggi * 0.04,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: hint,
                              border: Outline,
                              focusedBorder: Focused),
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.015,
                      ),
                      Container(
                        width: lebar * 0.7,
                        // height: tinggi * 0.1,
                        child: DropdownButtonFormField(
                          value: _selectData,
                          items: data.map((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e,
                                style: hint,
                              ),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectData = val as String;
                            });
                          },
                          decoration: InputDecoration(
                              border: Outline, focusedBorder: Focused),
                          // textAlignVertical: TextAlignVertical.bottom,
                          // decoration: InputDecoration(
                          //     hintText: "role",
                          //     hintStyle: hint,
                          //     border: Outline,
                          //     focusedBorder: Focused),
                        ),
                      ),
                      Container(
                        width: lebar * 0.7,
                        height: tinggi * 0.045,
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
                            onPressed: () {},
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Itim',
                                  fontSize: 16),
                            )),
                      )
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
                      "Sudah punya akun?",
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
                          Navigator.of(context).pushNamed(AppRoutes.Login);
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Itim',
                              color: orenColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
