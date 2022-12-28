import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CreateDB {
  // create chat DB ----------------
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'bookChat.db'), // 파일 이름
      onCreate: (db, version) async {
        // 테이블 만들기
        await db.execute('create table user(uId text primary key, uPw text)');
        await db.execute(
            'create table book(bId integer primary key autoincrement, bTitle text, bPublisher text, bThumbnail text, bAuthors text, bTranslators text, bContents text)');
        await db.execute(
            'create table regbook(regBookId integer primary key autoincrement, bId integer, regBookDate integer, regBookDelDate integer, FOREIGN KEY (bId) REFERENCES book (bId))');
        await db.execute(
            'create table chat(cId integer primary key autoincrement, cContent text, cDelDate integer, cMoDate integer, cDate integer, bId Integer, FOREIGN KEY (bId) REFERENCES book (bId))');
        await db.execute(
            'create table tag(tId integer primary key autoincrement, tTitle text)');
        await db.execute(
            'create table regtag(regTagId integer primary key autoincrement, regTagDate Integer, regTagDelDate Integer, tId Integer, bId Integer, cId Integer, FOREIGN KEY (tId) REFERENCES tag (tId), FOREIGN KEY (bId) REFERENCES book (bId), FOREIGN KEY (cId) REFERENCES chat (cId))');
      },

      // 버전은 내가 지정해주는 거 (내 버전)
      version: 1,
    );
  } //.

}//END
