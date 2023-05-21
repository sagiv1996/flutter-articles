import 'package:drift/drift.dart';

class ArticleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get content => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
}
