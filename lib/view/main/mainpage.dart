import 'package:flutter/material.dart';
import 'package:semi_project_bookchat_app/view/main/ing_book_list.dart';
import 'package:semi_project_bookchat_app/view/main/read_book_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40,
        // 그림자
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF616161),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              width: 250,
              child: TabBar(
                controller: controller,
                //선택된것 글씨색상
                labelColor: const Color(0xFFF5F5F5),
                //선택안된것 글씨색상
                unselectedLabelColor: const Color(0xFF616161),
                tabs: const [
                  Tab(text: "읽고 있는 책"),
                  Tab(text: "읽은 책"),
                ],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF616161).withOpacity(0.8),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  ReadBookList(),
                  IngBookList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}//END
