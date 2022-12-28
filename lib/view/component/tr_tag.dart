import 'package:flutter/material.dart';
import 'package:semi_project_bookchat_app/database/tag_db.dart';
import 'package:semi_project_bookchat_app/model/tags.dart';

class TrTag extends StatefulWidget {
  const TrTag({super.key});

  @override
  State<TrTag> createState() => _TrTagState();
}

class _TrTagState extends State<TrTag> {
  final int currentPage = 1;
  TagDB tagDB = TagDB();
  // List tagList = [];
  late int select;

  @override
  void initState() {
    super.initState();
    tagDB.insertDefaultTag();
    // makeTagList();
    select = 0;
  }

  // makeTagList() async {
  //   tagList = await tagDB.queryTags();
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: tagDB.queryTags(),
        builder: (BuildContext context, AsyncSnapshot<List<Tags>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('태그를 고른후에 검색 버튼을 눌러주세요'),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('검색'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: snapshot.data?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 2 / 1, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 5, //수평 Padding
                      crossAxisSpacing: 5, //수직 Padding
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // String thumbnail = snapshot.data![index].bThumbnail == null
                      //     ? "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg"
                      //     : snapshot.data![index].bThumbnail.toString();
                      //item 의 반목문 항목 형성
                      // return return Text(thumbnail);
                      // return Image.network(
                      //   thumbnail,
                      //   height: 100,
                      //   width: 100,
                      //   fit: BoxFit.contain,
                      // );
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              select = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: select == index
                                    ? Color.fromARGB(255, 154, 123, 13)
                                    : Colors.amber),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(snapshot.data![index].tTitle.toString()),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
}
    // return Expanded(
    //   child: GridView.count(
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 20,
    //     crossAxisCount: 3,
    //     childAspectRatio: (60 / 25),
    //     children: [
    //       OutlinedButton(
    //         onPressed: () {
    //           setState(() {
    //             currentPage = 2;
    //           });
    //         },
    //         child: const Text('#태그'),
    //         style: OutlinedButton.styleFrom(
    //           backgroundColor:
    //               currentPage == 2 ? Color(0xFF616161) : Color(0xFFF5F5F5),
    //           foregroundColor:
    //               currentPage == 2 ? Color(0xFFF5F5F5) : Color(0xFF616161),
    //           minimumSize: const Size(80, 35),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //         ),
    //       ),
    //       OutlinedButton(
    //         onPressed: () {
    //           setState(() {
    //             currentPage = 2;
    //           });
    //         },
    //         child: const Text('#태그2'),
    //         style: OutlinedButton.styleFrom(
    //           backgroundColor:
    //               currentPage == 2 ? Color(0xFF616161) : Color(0xFFF5F5F5),
    //           foregroundColor:
    //               currentPage == 2 ? Color(0xFFF5F5F5) : Color(0xFF616161),
    //           minimumSize: const Size(80, 35),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //         ),
    //       ),
    //       OutlinedButton(
    //         onPressed: () {
    //           setState(() {
    //             currentPage = 2;
    //           });
    //         },
    //         child: const Text('#태그3'),
    //         style: OutlinedButton.styleFrom(
    //           backgroundColor:
    //               currentPage == 2 ? Color(0xFF616161) : Color(0xFFF5F5F5),
    //           foregroundColor:
    //               currentPage == 2 ? Color(0xFFF5F5F5) : Color(0xFF616161),
    //           minimumSize: const Size(80, 35),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 35,
    //         width: 70,
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.all(8),
    //         child: const Text('#태그2'),
    //         decoration: BoxDecoration(
    //             color: Color.fromARGB(255, 160, 230, 223),
    //             borderRadius: BorderRadius.all(Radius.circular(20))),
    //       ),
    //       Container(
    //         height: 35,
    //         width: 70,
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.all(8),
    //         child: const Text('#태그3'),
    //         decoration: BoxDecoration(
    //             color: Color.fromARGB(255, 249, 217, 155),
    //             borderRadius: BorderRadius.all(Radius.circular(20))),
    //       ),
    //       Container(
    //         height: 35,
    //         width: 70,
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.all(8),
    //         child: const Text('Revolution, they...'),
    //         decoration: BoxDecoration(
    //             color: Color.fromARGB(255, 154, 169, 248),
    //             borderRadius: BorderRadius.all(Radius.circular(20))),
    //       ),
    //       Container(
    //         height: 35,
    //         width: 70,
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.all(8),
    //         child: const Text('Revolution, they...'),
    //         decoration: BoxDecoration(
    //             color: Color.fromARGB(255, 251, 141, 172),
    //             borderRadius: BorderRadius.all(Radius.circular(20))),
    //       ),
    //       Container(
    //         height: 35,
    //         width: 70,
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.all(8),
    //         child: const Text('Revolution, they...'),
    //         decoration: BoxDecoration(
    //             color: Colors.teal[600],
    //             borderRadius: BorderRadius.all(Radius.circular(20))),
    //       ),
    //     ],
    //   ),
    // );
  // }
// }
