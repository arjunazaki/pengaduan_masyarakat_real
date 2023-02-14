import 'package:flutter/material.dart';
import 'package:pengaduan_masyarakat_real/Aksi/dataUser.dart';
import 'package:pengaduan_masyarakat_real/Aksi/loginPreferen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class adminPage extends StatefulWidget {
  adminPage({required this.username});
  final String username;

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  String? id;
  String? name;
  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pref = prefs.getString('id');
    var name_pref = prefs.getString('name');
    if (id_pref == null) {
      print("need login");
    }
    var DataUser = await loginpref.getPref();
    print(prefs.getString('name'));
    setState(() {
      id = DataUser.id;
      name = DataUser.name;
    });
  }

  @override
  void initState() {
    user();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final MyAppBar = AppBar(
      title: Text("Welcome $name"),
    );

    final bodyHeigt = heigt -
        MyAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: MyAppBar,
        body: Column(
          children: [
            Container(
              color: Colors.black,
              height: bodyHeigt * 0.7,
            ),
            Container(
              color: Colors.blue,
              height: bodyHeigt * 0.3,
            )
          ],
        ));
  }
}
