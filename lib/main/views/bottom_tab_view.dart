import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mengli/main/controllers/controller.dart';

import '../../pages/home_page.dart';
import '../../pages/my_page.dart';

// GetView能自动为视图提供controller，controller 实际上就是通过 Get.find<MainViewModel>() 获取到的控制器实例
class BottomTabView extends GetView<MainViewModel>{
  const BottomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // GetView源码里有 get controller => GetInstance().find<T>(tag: tag)!;
    // 为啥不使用getxbuilder，因为getxbuilder热重载的时候会清除MainViewModel，controller会为空
    return Obx(() => Scaffold(
        body: PageView(
            controller: controller.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              MyPage(),
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.blue,
            currentIndex: controller.currentIndex.value,
            onTap: controller.onBottomNavTap,
            type: BottomNavigationBarType.fixed,
        items: [
        _bottomItem('首页', Icons.home, 0),
        _bottomItem('我的', Icons.account_circle, 1),
        ]
    )
    ));
  }
}

_bottomItem(String title, IconData icon, int index) {
  return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.grey),
      activeIcon: Icon(
          icon,
          color: Colors.blue
      ),
      label: title
  );
}