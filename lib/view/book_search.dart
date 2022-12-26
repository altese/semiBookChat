import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semi_project_bookchat_app/model/book_info.dart';

class BookSearch extends StatefulWidget {
  const BookSearch({super.key});

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
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
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // --------------------------------------- 클릭 버튼
                      // 클릭 시 책 제목 가지고 채팅으로 복귀
                      BookInfo.bookTitle =
                          BookInfo.books[index]['title'].toString();
                      Get.back();
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Text(BookInfo.books[index]['title'].toString()),
                          Text(BookInfo.books[index]['authors'].toString()),
                          Text(BookInfo.books[index]['status'].toString()),
                          Image.network(
                            BookInfo.books[index]['thumbnail'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: BookInfo.books.length,
              ),
      ),
    );
  }
}
