import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semi_project_bookchat_app/database/book_db.dart';
import 'package:semi_project_bookchat_app/database/chat_db.dart';
import 'package:semi_project_bookchat_app/database/create_database.dart';
import 'package:semi_project_bookchat_app/model/book_info.dart';
import 'package:semi_project_bookchat_app/model/chats.dart';
import 'package:semi_project_bookchat_app/view/book_search.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late CreateDB createDB;
  late ChatDB chatDB;
  late BookDB bookDB;

  List<String> tags = ['#hi', '#필사', '#my', '#hello'];
  late TextEditingController tfBookController;
  late TextEditingController tfChatController;
  late int currentBookId;
  late String currentBookTitle;

  @override
  void initState() {
    super.initState();
    createDB = CreateDB();
    chatDB = ChatDB();
    // 처음 접속한 경우 DB 만들어주기

    tfBookController = TextEditingController();
    tfChatController = TextEditingController();
    bookDB = BookDB();

    currentBookId = 0;
    currentBook();

    //임시 함수
    bookDataCount();
  }

  // book data 잘 들어가는지 확인 용도 임시 함수
  bookDataCount() async {
    List list = await bookDB.queryBooks();

    print('book count: ${list.length}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //아무데나 누르면 키보드 내려감
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              CompositedTransformFollower(
                link: LayerLink(),
                offset: const Offset(10, 10),
                child: Container(
                  width: 300,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3) // changes position of shadow
                          ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Color(0xffFBC2EB), Color(0xffB3C8FE)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 190,
                        height: 60,
                        child: TextField(
                          controller: tfBookController,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      // ------------------------------------------------- search 버튼 **
                      IconButton(
                        onPressed: () async {
                          BookInfo.books = [];
                          getJSONData();
                          await Get.to(const BookSearch());
                          tfSearchBarRefresh();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 89, 89, 89),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //============================================================= chat list 시작
              Expanded(
                child: FutureBuilder(
                  // chat DB에서 불러오기
                  future: chatDB.queryChats(currentBookId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Chats>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 226, 226, 226),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                // -------------------------------------------- chat bubble
                                child: Text(snapshot.data![index].cContent),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              //============================================================= keyboard
              // ----------------------------------------------------------- keyword
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: tags.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            //  --------------------------------------------- 키워드 각각 버튼
                            child: OutlinedButton(
                              onPressed: () {
                                //
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFF5F5F5),
                                foregroundColor: const Color(0xFF616161),
                                minimumSize: const Size(80, 35),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(tags[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // ========================================================= 채팅 row 시작
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 5),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 204, 204, 204),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      // ------------------------------------------------- 채팅 tf
                      child: TextField(
                        controller: tfChatController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ------------------------------------------------- 채팅 전송 버튼 **
                  IconButton(
                    color: const Color(0xff9AB6FF),
                    onPressed: () {
                      //tfChatController 전송
                      setState(() {
                        addChat();
                        // regExp();
                        tfChatController.text = "";
                      });
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//  funcs ================================================================

  // 카카오 book api 정보 가져오기
  Future<String> getJSONData() async {
    // null 들어오면 "가"로 치환해준다.
    String inputQuery = tfBookController.text.trim().isEmpty
        ? "가"
        : tfBookController.text.trim();

    var url = Uri.parse(
        // query: tf로 사용자가 치는 부분
        // target: query의 타겟?
        'https://dapi.kakao.com/v3/search/book?target=title&query=$inputQuery');
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK 9b30e9bc59db5e19c100866becbf583a"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      // print(dataConvertedToJSON);

      List result = dataConvertedToJSON["documents"];
      // BookInfo.books = [];
      BookInfo.books.addAll(result);
      print(result);
    });
    return response.body;
  }

  // 가장 위 검색바에 api로 받아온 제목 넣어주기
  tfSearchBarRefresh() {
    print('set state ${BookInfo.bookTitle}, ${tfBookController.text}');

    setState(() {
      tfBookController.text = BookInfo.bookTitle;
    });
    currentBookTitle = BookInfo.bookTitle;

    currentBook();
  }

  // 채팅 DB에 insert
  Future<int> addChat() async {
    Chats chat = Chats(
        cDate: 20221226, cContent: tfChatController.text, bId: currentBookId);
    await chatDB.insertChat(chat);
    return 0;
  }

  // init state 현재 책
  currentBook() async {
    List currrentBook = await bookDB.selectCurrentBook();
    print('currentBTitle: ${currrentBook[0].bTitle}');
    print('currentBId: ${currrentBook[0].bId}');
    tfBookController.text = currrentBook[0].bTitle ?? "기타";
    currentBookId = currrentBook[0].bId ?? 0;
  }

// 키워드 뽑아내는 정규식
  regExp() {
    RegExp exp = RegExp(r'[#-\s]');
    // Iterable<RegExpMatch> match = exp.allMatches(tfChatController.text);
    // print(exp(tfChatController.text)); // "Parse"
    void match(String str, String regexp) {
      // var text = '$'
    }
  }
} //END
