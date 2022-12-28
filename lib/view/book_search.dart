import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semi_project_bookchat_app/database/book_db.dart';
import 'package:semi_project_bookchat_app/model/book_info.dart';

class BookSearch extends StatefulWidget {
  const BookSearch({super.key});

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  late List bookList;
  late BookDB bookDB;
  late String title;

  @override
  void initState() {
    super.initState();
    setState(() {
      bookList = BookInfo.books;
    });
    title = "";
    // bookList =
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bookList.isEmpty
            ? const Text(
                "데이터가 없습니다",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            : ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (BuildContext context, int index) {
                  // refresh();
                  return GestureDetector(
                    onTap: () {
                      // --------------------------------------- 클릭 버튼
                      // 클릭 시 책 제목 가지고 채팅으로 복귀
                      // DB book 엔터티에 데이터 저장
                      BookInfo.bookTitle = bookList[index]['title'].toString();
                      // (index);
                      addBook(index);
                      Get.back();
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Image.network(
                            bookList[index]['thumbnail'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          Text(
                              // bookList[index]['title'].toString()
                              title),
                          const SizedBox(width: 10),
                          Text(bookList[index]['authors'].toString()),
                          // Text(bookList[index]['status'].toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  //funcs ----------
  Future<int> addBook(int index) async {
    BookInfo bookInfo = BookInfo(
        bTitle: BookInfo.bookTitle,
        bThumbnail: bookList[index]['thumbnail'],
        bAuthors: bookList[index]['authors'].toString());
    BookDB bookDB = BookDB();
    await bookDB.insertBook(bookInfo);

    return 0;
  }

  refresh() {
    setState(() {});
  }

  strCut(int index) {
    title = bookList[index]['title'].toString().length > 10
        ? bookList[index]['title'].toString().substring(0, 9)
        : bookList[index]['title'].toString();
    refresh();
  }
}//END
