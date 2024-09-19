import 'package:get/get.dart';
import 'package:mengli/main/binding/main_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    MainBinding().dependencies();
  }
}