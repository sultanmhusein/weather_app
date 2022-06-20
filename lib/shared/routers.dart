import 'package:get/get.dart';

import '../presentations/pages/page.dart';

class Routers {
  static const String splash = "/splash";
  List<GetPage> routers = [
    GetPage(name: splash, page: () => SplashPage()),
  ];
}
