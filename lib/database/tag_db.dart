import 'package:semi_project_bookchat_app/model/tags.dart';
import 'package:sqflite/sqflite.dart';
import 'create_database.dart';

class TagDB {
  CreateDB createDB = CreateDB();

  // insert ----------------
  Future<int> insertTag(Tags tags) async {
    int result = 0;
    final Database db = await createDB.initializeDB();
    result = await db.rawInsert('insert into tag(tTitle) values(?)', [
      tags.tTitle,
    ]);
    return result;
  } //.

  // insert default ----------------
  Future<int> insertDefaultTag() async {
    int result = 0;
    final Database db = await createDB.initializeDB();
    result = await db.rawInsert('insert into tag(tTitle) values(?)', [
      "#기타",
    ]);
    return result;
  } //.

  // select all ----------------
  Future<List<Tags>> queryTags() async {
    final Database db = await createDB.initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from tag');

    return queryResult.map((e) => Tags.fromMap(e)).toList();
  }
}//END
