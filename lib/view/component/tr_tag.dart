import 'package:flutter/material.dart';

class TrTag extends StatefulWidget {
  const TrTag({super.key});

  @override
  State<TrTag> createState() => _TrTagState();
}

class _TrTagState extends State<TrTag> {
  late int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        childAspectRatio: (60 / 25),
        children: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                currentPage = 2;
              });
            },
            child: const Text('#태그'),
            style: OutlinedButton.styleFrom(
              backgroundColor:
                  currentPage == 2 ? Color(0xFF616161) : Color(0xFFF5F5F5),
              foregroundColor:
                  currentPage == 2 ? Color(0xFFF5F5F5) : Color(0xFF616161),
              minimumSize: const Size(80, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                currentPage = 2;
              });
            },
            child: const Text('#태그2'),
            style: OutlinedButton.styleFrom(
              backgroundColor:
                  currentPage == 2 ? Color(0xFF616161) : Color(0xFFF5F5F5),
              foregroundColor:
                  currentPage == 2 ? Color(0xFFF5F5F5) : Color(0xFF616161),
              minimumSize: const Size(80, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                currentPage = 2;
              });
            },
            child: const Text('#태그3'),
            style: OutlinedButton.styleFrom(
              backgroundColor:
                  currentPage == 2 ? Color(0xFF616161) : Color(0xFFF5F5F5),
              foregroundColor:
                  currentPage == 2 ? Color(0xFFF5F5F5) : Color(0xFF616161),
              minimumSize: const Size(80, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('#태그2'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 230, 223),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            height: 35,
            width: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('#태그3'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 217, 155),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            height: 35,
            width: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 169, 248),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            height: 35,
            width: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 141, 172),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            height: 35,
            width: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            decoration: BoxDecoration(
                color: Colors.teal[600],
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ],
      ),
    );
  }
}
