// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $ArticleTableTable extends ArticleTable
    with TableInfo<$ArticleTableTable, ArticleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, content, urlToImage];
  @override
  String get aliasedName => _alias ?? 'article_table';
  @override
  String get actualTableName => 'article_table';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArticleModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleModel(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image'])!,
    );
  }

  @override
  $ArticleTableTable createAlias(String alias) {
    return $ArticleTableTable(attachedDatabase, alias);
  }
}

class ArticleTableCompanion extends UpdateCompanion<ArticleModel> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> content;
  final Value<String> urlToImage;
  const ArticleTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.content = const Value.absent(),
    this.urlToImage = const Value.absent(),
  });
  ArticleTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String content,
    required String urlToImage,
  })  : title = Value(title),
        description = Value(description),
        content = Value(content),
        urlToImage = Value(urlToImage);
  static Insertable<ArticleModel> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? content,
    Expression<String>? urlToImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (content != null) 'content': content,
      if (urlToImage != null) 'url_to_image': urlToImage,
    });
  }

  ArticleTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? content,
      Value<String>? urlToImage}) {
    return ArticleTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('content: $content, ')
          ..write('urlToImage: $urlToImage')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ArticleTableTable articleTable = $ArticleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articleTable];
}
