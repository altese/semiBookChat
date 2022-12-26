import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semi_project_bookchat_app/view/chat.dart';
import 'package:semi_project_bookchat_app/view/tagroom.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      // getPages: [
      //   GetPage(
      //     name: "/chat",
      //     page: () => Chat(),
      //   ),
      //   GetPage(
      //     name: "/tagroom",
      //     page: () => TagRoom(),
      //   ),
      // ],
      // getX 필요시 오픈
    );
  }
}
