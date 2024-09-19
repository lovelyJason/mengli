import 'package:flutter/material.dart';
import 'package:mengli/widgets/top_bar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' as calendar;

// IOS风格部件：https://docs.flutter.dev/ui/widgets/cupertino

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(svgAsset: 'assets/menu.svg'),
      backgroundColor: const Color(0xfff2f2f2),
      body: Stack(
        children: [
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: _buildCalendar(),
          )
        ],
      ),
    );
  }
}

Widget _buildCalendar() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    child: calendar.CalendarCarousel(
      height: 420.0,
    ),
  );
}