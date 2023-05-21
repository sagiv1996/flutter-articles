import 'package:articles/model/articel_model.dart';
import 'package:drift/drift.dart';

@UseRowClass(ArticleModel)
class ArticleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get content => text()();
  TextColumn get urlToImage => text()();
}
