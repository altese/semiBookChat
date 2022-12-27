import 'package:semi_project_bookchat_app/database/create_database.dart';
import 'package:sqflite/sqflite.dart';
import '../model/chats.dart';

class ChatDB {
  CreateDB createDB = CreateDB();
  // insert ----------------
  Future<int> insertChat(Chats chats) async {
    int result = 0;
    final Database db = await createDB.initializeDB();
    result = await db.rawInsert(
        'insert into chat(bId, cDate, cContent) values(?,?,?)',
        [chats.bId, chats.cDate, chats.cContent]);
    return result;
  } //.

  // select all ----------------
  Future<List<Chats>> queryChats(int bId) async {
    final Database db = await createDB.initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from chat where bId = ?', [bId]);

    return queryResult.map((e) => Chats.fromMap(e)).toList();
  }
}
