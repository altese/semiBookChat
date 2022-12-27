import 'package:flutter/material.dart';

class TrCategory extends StatefulWidget {
  const TrCategory({super.key});

  @override
  State<TrCategory> createState() => _TrCategoryState();
}

class _TrCategoryState extends State<TrCategory> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text(
              '과학',
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 229, 147),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('경제'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 230, 223),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('소설'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 217, 155),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 169, 248),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 141, 172),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
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
