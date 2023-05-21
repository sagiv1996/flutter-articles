import 'package:articles/model/articel_model.dart';
import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ArticleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get content => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
}
