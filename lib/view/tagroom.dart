import 'package:flutter/material.dart';
import 'package:semi_project_bookchat_app/view/component/tr_category.dart';
import 'package:semi_project_bookchat_app/view/component/tr_tag.dart';

class TagRoom extends StatefulWidget {
  const TagRoom({super.key});

  @override
  State<TagRoom> createState() => _TagRoomState();
}

class _TagRoomState extends State<TagRoom> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 40,
        title: const Text(
          'ParkYejin',
          style: TextStyle(color: Colors.black),
        ),
        //앱바위의 아이콘 색상
        iconTheme: IconThemeData(
          color: Color(0xFF616161),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Color(0xFFF5F5F5),
            height: 2.0,
          ),
        ),
      ),
      drawer: Drawer(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 35,
                child: TabBar(
                  controller: controller,
                  //선택된것 글씨색상
                  labelColor: Color(0xFFF5F5F5),
                  //선택안된것 글씨색상
                  unselectedLabelColor: Color(0xFF616161),
                  tabs: const [
                    Tab(
                      text: "카테고리",
                    ),
                    Tab(
                      text: "책",
                    ),
                    Tab(
                      text: "태그",
                    ),
                    Tab(
                      text: "키워드",
                    ),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF616161).withOpacity(0.8),
                  ),
                ),
              ),
              //갈아끼는 화면들
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: const [
                    TrCategory(),
                    //***** */
                    TrTag(),
                    TrTag(),
                    TrTag(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
