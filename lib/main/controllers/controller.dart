import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  // 这是一个RxInt的响应式整数，赋值可以.value或者currentIndex(index)，这是前者的语法糖
  final currentIndex = 0.obs;
  final PageController controller = PageController(
    initialPage: 0,
  );

  // 页面切换监听
  void onBottomNavTap(int index) {
    currentIndex(index);
    controller.jumpToPage(index);
  }
}
