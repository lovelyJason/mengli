import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

import '../../pages/login_page.dart';
import '../../util/screen_adapter_helper.dart';
import 'bottom_tab_view.dart';

const isLogin = true;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: _doInit(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          ScreenHelper.init(context); // 初始化屏幕适配工具
          if (snapshot.connectionState == ConnectionState.done) {
            if (!isLogin) {
              return const LoginPage();
            } else {
              // return const TabNavigator
              return const BottomTabView();
            }
          } else {
            return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                )
            );
          }
        }
    );
  }

  Future<void> _doInit() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      FlutterSplashScreen.hide(); // 隐藏原生启动屏幕
    });
  }

}