import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String svgAsset;

  const TopBar({super.key, required this.svgAsset});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        svgAsset,
        height: 24.0,  // 图标高度
        width: 24.0,   // 图标宽度
      ),
      backgroundColor: Colors.white,  // 根据需要设置背景色
    );
  }

  // 这里实现 preferredSize 属性
  // 在 Flutter 中，AppBar 或自定义的 appBar widget 必须实现 PreferredSizeWidget，以便框架能够知道 appBar 的大小。要修复这个问题，你需要让 TopBar 实现 PreferredSizeWidget。
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
