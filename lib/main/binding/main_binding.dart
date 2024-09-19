import 'package:get/get.dart';

import '../controllers/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() { // 必须实现
    Get.lazyPut<MainViewModel>(() => MainViewModel());
  }
}