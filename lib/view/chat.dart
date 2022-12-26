import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semi_project_bookchat_app/model/book_info.dart';
import 'package:semi_project_bookchat_app/view/book_search.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> chats = ['1', '2', '3', '4'];
  List<String> tags = ['#hi', '#필사', '#my', '#hello'];
  late TextEditingController tfBookController;
  late TextEditingController tfChatController;
  String result = '';

  @override
  void initState() {
    super.initState();
    tfBookController = TextEditingController();
    tfChatController = TextEditingController();
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
                        width: 180,
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
                          getJSONData();
                          await Get.to(const BookSearch());
                          tfSearchBarRefresh();

                          // var url = Uri.parse('http://www.google.com');
                          // var response = await http.get(url);
                          // setState(() {
                          //   result = response.body;
                          // });
                          // print(result);
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
              //============================================================= chat list
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                          child: Text(chats[index].toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //============================================================= keyboard
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: tags.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 226, 226, 226),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Text(tags[index]),
                          // child: Text('aa'),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
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

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=doit');
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK 9b30e9bc59db5e19c100866becbf583a"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      print(dataConvertedToJSON);

      List result = dataConvertedToJSON["documents"];
      BookInfo.books.addAll(result);
    });
    return response.body;
  }

  tfSearchBarRefresh() {
    print('set state ${BookInfo.bookTitle}, ${tfBookController.text}');
    setState(() {
      tfBookController.text = BookInfo.bookTitle;
    });
  }
}//END
