import 'package:get/get.dart';

import '../presentations/pages/page.dart';

class Routers {
  static const String splash = "/splash";
  static const String form = "/form";
  static const String home = "/home";

  List<GetPage> routers = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: form, page: () => FormPage()),
    GetPage(name: home, page: () => HomePage()),
  ];
}
