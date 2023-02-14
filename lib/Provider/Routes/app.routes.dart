import 'dart:js';
import 'package:pengaduan_masyarakat_real/Contoh/Users/login.dart';
import 'package:pengaduan_masyarakat_real/Contoh/role.dart';
import 'package:pengaduan_masyarakat_real/Page/Awal/splash.dart';
import 'package:pengaduan_masyarakat_real/Page/Masyarakat/DaftarMasyarakatPage.dart';
import 'package:pengaduan_masyarakat_real/Page/Masyarakat/buatLaporan.dart';
import 'package:pengaduan_masyarakat_real/Page/Masyarakat/lihatLaporan.dart';
import 'package:pengaduan_masyarakat_real/Page/adminPage.dart';
import 'package:pengaduan_masyarakat_real/Page/Awal/loginPage.dart';
import 'package:pengaduan_masyarakat_real/Page/Masyarakat/masyarakatPage.dart';
import 'package:pengaduan_masyarakat_real/Page/petugasPage.dart';
import '../../Contoh/Users/daftarAdmin.dart';

String username = '';

class AppRoutes {
  static const String Login = "/login";
  static const String Daftar = "/regis";
  static const String Splash = "/splash";
  static const String AdminPage = "/admin";
  static const String MasyarakatPage = "/masyarakat";
  static const String LaporanMAs = "/buatLap";
  static const String LihatLaporan = "/lihatLap";

  static final routes = {
    Login: (context) => loginPage(),
    Daftar: (context) => daftarMAsyarakat(),
    Splash: (context) => splash(),
    AdminPage: (context) => adminPage(
          username: username,
        ),
    MasyarakatPage: (context) => Masyarakat(),
    LaporanMAs: (context) => buatLaporan(),
    LihatLaporan: (context) => lihatLaporan(),
  };
}
