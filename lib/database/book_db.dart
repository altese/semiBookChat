import 'package:semi_project_bookchat_app/model/book_info.dart';
import 'package:sqflite/sqflite.dart';
import 'create_database.dart';

class BookDB {
  CreateDB createDB = CreateDB();

  // insert ----------------
  Future<int> insertBook(BookInfo bookInfo) async {
    int result = 0;
    final Database db = await createDB.initializeDB();
    result = await db.rawInsert(
        'insert into book(bId, bTitle, bPublisher, bThumbnail, bAuthors, bTranslators, bContents) values(?,?,?,?,?,?,?)',
        [
          bookInfo.bId,
          bookInfo.bTitle,
          bookInfo.bPublisher,
          bookInfo.bThumbnail,
          bookInfo.bAuthors,
          bookInfo.bTranslators,
          bookInfo.bContents
        ]);
    return result;
  } //.

  // insert ----------------
  Future<int> insertDefault() async {
    int result = 0;
    final Database db = await createDB.initializeDB();
    result = await db.rawInsert(
        'insert into book(bTitle, bPublisher, bThumbnail, bAuthors, bTranslators, bContents) values(?,?,?,?,?,?)',
        [
          "기타",
          "1",
          "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg",
          "1",
          "1",
          "1"
        ]);
    return result;
  } //.

  // select all ----------------
  Future<List<BookInfo>> queryBooks() async {
    final Database db = await createDB.initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from book');

    return queryResult.map((e) => BookInfo.fromMap(e)).toList();
  }

  // select 마지막 행 (가장 최근 책)
  Future<List<BookInfo>> selectCurrentBook() async {
    final Database db = await createDB.initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('SELECT * FROM book ORDER BY ROWID DESC LIMIT 1');

    return queryResult.map((e) => BookInfo.fromMap(e)).toList();
  }

  // 싹 delete..
  Future<int> deleteStudents() async {
    print('delete');
    int result = 0;
    final Database db = await createDB.initializeDB();
    result = await db.rawDelete('delete from book');
    return result;
  } //.
} //END
