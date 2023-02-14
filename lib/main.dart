import 'dart:convert';
import 'component.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pengaduan_masyarakat_real/component.dart';
import 'Page/Awal/splash.dart';
import 'Provider/Routes/app.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Future<List> getData() async {
  //   final response = await http.get(Uri.parse(
  //       "http://10.0.2.2/pengaduan_masyarakat/getdata_masyarakat.php"));
  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: AppRoutes.Splash,
      routes: AppRoutes.routes,
      title: 'pengaduan masyarakat',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,

      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("GetData"),
      //   ),
      //   backgroundColor: Colors.blue,
      //   body: new FutureBuilder<List>(
      //     future: getData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) print(snapshot.error);

      //       return snapshot.hasData
      //           ? new ItemList(
      //               list: snapshot.data,
      //             )
      //           : new Center(
      //               child: new CircularProgressIndicator(),
      //             );
      //     },
      //   ),
      // ),
    );
  }
}

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return new Text(list[i]["username_15464"]);
//       },
//     );
//   }
// }
