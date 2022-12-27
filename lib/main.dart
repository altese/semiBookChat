import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/chat.dart';
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
      getPages: [
        GetPage(
          name: "/chat",
          page: () => const Chat(),
        ),
        // GetPage(
        //   name: "/tagroom",
        //   page: () => TagRoom(),
        // ),
      ],
      // getX 필요시 오픈
    );
  }
}
