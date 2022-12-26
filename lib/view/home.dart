import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semi_project_bookchat_app/view/tagroom.dart';
import 'mainpage.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose(); //앱 종료 전에 컨트롤러 종료시키기
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          MainPage(),
          // Chat(),
          TagRoom(),
        ],
      ),
      extendBody: true,
      // ------------------------- 가운데 채팅 버튼 -------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/chat');
        },
        backgroundColor: const Color(0xffB3C8FE),
        child: const Icon(CupertinoIcons.chat_bubble_fill),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        color: const Color(0xffEEEEEE),
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                CupertinoIcons.book_fill,
                color: Color(0xff616161),
              ),
            ),
            Tab(
              icon: Icon(
                CupertinoIcons.chart_bar,
                color: Color(0xff616161),
              ),
            ),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     // ------------------------- 왼쪽 책 버튼 -------------------
        //     IconButton(
        //       onPressed: () {
        //         //
        //       },
        //       icon: const Icon(
        //         CupertinoIcons.book_fill,
        //         color: Color(0xff616161),
        //       ),
        //     ),
        //     // ------------------------- 오른쪽 차트 버튼 -------------------
        //     IconButton(
        //       onPressed: () {
        //         //
        //       },
        //       icon: const Icon(
        //         CupertinoIcons.chart_bar,
        //         color: Color(0xff616161),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
