import 'package:flutter/material.dart';
import 'package:mengli/widgets/top_bar.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' as calendar;
import 'package:jason_table_calendar/table_calendar.dart';

// IOS风格部件：https://docs.flutter.dev/ui/widgets/cupertino

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.now(); // 当前聚焦的日期
  DateTime? _selectedDay; // 用户选择的日期，可能为空
  late CalendarFormat _calendarFormat; // 日历格式（可折叠、展开）

  final List<ScheduleEvent> events = [
    ScheduleEvent(time: '11:30 AM - 12:30 PM', title: '麦当劳的商务午餐', description: '上午 11:30 — 下午 12:30', color: Colors.lightBlueAccent),
    ScheduleEvent(time: '1:00 PM - 2:30 PM', title: 'Skype 通话介绍新功能', description: '下午 1:00 — 下午 2:30', color: Colors.orangeAccent),
    ScheduleEvent(time: '3:40 PM - 5:40 PM', title: '项目A团队会议', description: '下午 3:40 — 下午 5:40', color: Colors.lightBlueAccent),
    ScheduleEvent(time: '6:00 PM - 7:00 PM', title: '客户电话会议', description: '下午 6:00 — 下午 7:00', color: Colors.pinkAccent),
    // Add more events as needed
  ];

  @override
  void reassemble() {
    super.reassemble();
    print('热重载了');
  }

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month; // 初始化时默认值为月份显示
  }

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
            child: _buildBody(),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        // 蓝色背景容器，放在最底层
        Positioned(
          top: 150.0, // 控制这个 Container 距离屏幕上方的距离
          left: 0,
          right: 0,
          bottom: -10, // 留出 BottomNavigationBar 的高度
          child: Container(
            color: Colors.white,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return _buildScheduleEventItem(event);
                },
              ),
            ),
          ),
        ),
        // 日历容器，放在上层，可以覆盖蓝色容器
        Positioned(
          top: 0, // 距离屏幕顶部的距离
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // 背景色
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),  // 左下角圆角
                bottomRight: Radius.circular(30.0), // 右下角圆角
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // 阴影颜色
                  blurRadius: 10.0, // 模糊半径
                  spreadRadius: 2.0, // 扩散半径
                  offset: Offset(0, 4), // 阴影偏移
                ),
              ],
            ),

            child: TableCalendar(
              headerVisible: true,
              shouldFillViewport: false,
              daysOfWeekVisible: true,
              locale: 'zh_CN',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleEventItem(ScheduleEvent event) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 时间显示
          Container(
            width: 70,
            child: Text(
              event.time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 10),
          // 时间轴指示
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: event.color,
                ),
              ),
              Container(
                width: 2,
                height: 80,
                color: Colors.blueAccent, // 连接事件的线条
              ),
            ],
          ),
          SizedBox(width: 10),
          // 日程卡片
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: event.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    event.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleEvent {
  final String time;
  final String title;
  final String description;
  final Color color;

  ScheduleEvent({
    required this.time,
    required this.title,
    required this.description,
    required this.color,
  });
}

