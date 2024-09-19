import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/login_page.dart';
import '../routes/app_pages.dart';
// import 'package:flutter/services.dart';

class NavigatorUtil {
  static BuildContext? _context;
  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;

  }

  static push(BuildContext context, Widget page) {
    Get.to(() => page); // 可以直接传入page或传入一个返回page的函数，不用传递上下文了
  }

  static gotoHome(BuildContext context) {
    // 跳转到目标页面，并且不让返回
    // Get.offAll(const TabNavigator())
    // 当使用getx依赖注入后，需要使用路由名跳转才能确保依赖注入生效，切换页面时不丢失controller
    Get.offAllNamed(Routes.MAIN);
  }


  static gotoLogin() {
    Get.off(const LoginPage()); // 跳到指定页面时关闭当前页面
  }

  // 返回上一页
  static pop(BuildContext context) {
    Get.back();
  }

  static jumpH5(
      {
        BuildContext? context,
        String? url,
        String ? title,
        bool? hideAppBar,
        String? statusBarColor
      }
      ) {
    // Get.to(
    //     xxxxWebview( // 封装的一个webview
    //       url: url,
    //       title: title,
    //       hideAppBar: hideAppbar,
    //       statusBarColor: statusBarColor,
    //     )
    // )
  }
}