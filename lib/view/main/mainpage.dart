import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 72, 72, 72),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                foregroundColor: const Color(0xFF616161),
                minimumSize: const Size(80, 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                //
              },
              child: const Text('읽은 책'),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                foregroundColor: const Color(0xFF616161),
                minimumSize: const Size(80, 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                //
              },
              child: const Text('읽고 있는 책'),
            ),
          ],
        ),
      ),
    );
  }
}//END
