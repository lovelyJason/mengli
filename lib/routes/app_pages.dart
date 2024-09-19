import 'package:get/get.dart';
import 'package:mengli/main/binding/main_binding.dart';
import 'package:mengli/main/views/main_page.dart';
import 'package:mengli/pages/login_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const init = Routes.MAIN;
  static final routes = [
    GetPage(name: Routes.MAIN, page: () =>const MainPage(), binding: MainBinding()),
    // GetPage(name: Routes.Login, page: () =>const LoginPage(), binding: MainBinding()),
  ];
}