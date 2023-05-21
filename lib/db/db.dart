import 'dart:io';

import 'package:articles/db/tables/article_table.dart';
import 'package:articles/model/articel_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

@DriftDatabase(tables: [ArticleTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ArticleModel>> getAllArticle() => select(articleTable).get();

  Future deleteArticles() => batch((batch) => batch.deleteAll(articleTable));

  Future insertArticles(List<ArticleModel> articles) async {
    for (var article in articles) {
      await into(articleTable).insert(ArticleTableCompanion.insert(
          title: article.title.toString(),
          description: article.description.toString(),
          content: article.content.toString(),
          urlToImage: article.urlToImage.toString()));
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
