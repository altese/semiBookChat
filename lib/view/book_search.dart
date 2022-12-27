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

  @override
  void initState() {
    super.initState();
    bookList = BookInfo.books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BookInfo.books.isEmpty
            ? const Text(
                "데이터가 없습니다",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            : ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // --------------------------------------- 클릭 버튼
                      // 클릭 시 책 제목 가지고 채팅으로 복귀
                      // DB book 엔터티에 데이터 저장
                      BookInfo.bookTitle = bookList[index]['title'].toString();
                      addBook();
                      Get.back();
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Text(bookList[index]['title'].toString()),
                          Text(bookList[index]['authors'].toString()),
                          Text(bookList[index]['status'].toString()),
                          Image.network(
                            bookList[index]['thumbnail'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )
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
  Future<int> addBook() async {
    BookInfo bookInfo = BookInfo(bTitle: BookInfo.bookTitle);
    BookDB bookDB = BookDB();
    await bookDB.insertBook(bookInfo);

    return 0;
  }
}//END
