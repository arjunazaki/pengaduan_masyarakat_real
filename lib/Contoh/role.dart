import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pengaduan_masyarakat_real/component.dart';

class role extends StatefulWidget {
  const role({super.key});

  @override
  State<role> createState() => _roleState();
}

class _roleState extends State<role> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Sebagai?",
              style: TextStyle(
                  color: Colors.black, fontSize: 25, fontFamily: 'Itim'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(142, 167, 233, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/loginAdmin');
                    },
                    child: Text(
                      "Admin",
                      style: roletext,
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(142, 167, 233, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/loginMasyarakat');
                    },
                    child: Text(
                      "Masyarakat",
                      style: roletext,
                    ))
              ],
            ),
          ]),
    );
  }
}
