import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semi_project_bookchat_app/database/book_db.dart';
import 'package:semi_project_bookchat_app/database/create_database.dart';
import 'package:semi_project_bookchat_app/model/book_info.dart';
import 'package:semi_project_bookchat_app/view/chat.dart';

class ReadBookList extends StatefulWidget {
  const ReadBookList({super.key});

  @override
  State<ReadBookList> createState() => _ReadBookListState();
}

class _ReadBookListState extends State<ReadBookList> {
  late BookDB bookDB;
  late CreateDB createDB;
  // late BookInfo bookInfo;
  // List bookList = [];

  @override
  void initState() {
    super.initState();
    createDB = CreateDB();
    createDB.initializeDB().whenComplete(() async {
      setState(() {});
    });
    bookDB = BookDB();
    bookDB.insertDefault();
    // bookDB.deleteStudents();
    selectThumbnails();
  }

  selectThumbnails() async {
    BookInfo.bookList = await bookDB.queryBooks();
    print('bookList length: ${BookInfo.bookList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bookDB.queryBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<BookInfo>> snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
              childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
              mainAxisSpacing: 10, //수평 Padding
              crossAxisSpacing: 10, //수직 Padding
            ),
            itemBuilder: (BuildContext context, int index) {
              String thumbnail = snapshot.data![index].bThumbnail == null
                  ? "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg"
                  : snapshot.data![index].bThumbnail.toString();
              //item 의 반목문 항목 형성
              // return return Text(thumbnail);
              return GestureDetector(
                // --------------------------------------------- 책 누르면 어디로 이동?
                // 챗으로?
                onTap: () {
                  Get.to(const Chat());
                },
                child: Image.network(
                  thumbnail,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              );
            },
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
