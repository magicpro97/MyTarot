// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class TarotTableData extends DataClass implements Insertable<TarotTableData> {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final String note;
  TarotTableData(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      this.description,
      this.note});
  factory TarotTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return TarotTableData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      imageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }
  factory TarotTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TarotTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      description: serializer.fromJson<String>(json['description']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'description': serializer.toJson<String>(description),
      'note': serializer.toJson<String>(note),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<TarotTableData>>(
      bool nullToAbsent) {
    return TarotTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    ) as T;
  }

  TarotTableData copyWith(
          {String id,
          String name,
          String imageUrl,
          String description,
          String note}) =>
      TarotTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('TarotTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              imageUrl.hashCode, $mrjc(description.hashCode, note.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TarotTableData &&
          other.id == id &&
          other.name == name &&
          other.imageUrl == imageUrl &&
          other.description == description &&
          other.note == note);
}

class TarotTableCompanion extends UpdateCompanion<TarotTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String> description;
  final Value<String> note;
  const TarotTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  TarotTableCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> imageUrl,
      Value<String> description,
      Value<String> note}) {
    return TarotTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }
}

class $TarotTableTable extends TarotTable
    with TableInfo<$TarotTableTable, TarotTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TarotTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  GeneratedTextColumn _imageUrl;
  @override
  GeneratedTextColumn get imageUrl => _imageUrl ??= _constructImageUrl();
  GeneratedTextColumn _constructImageUrl() {
    return GeneratedTextColumn(
      'image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, imageUrl, description, note];
  @override
  $TarotTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tarot_table';
  @override
  final String actualTableName = 'tarot_table';
  @override
  VerificationContext validateIntegrity(TarotTableCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.imageUrl.present) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableValue(d.imageUrl.value, _imageUrlMeta));
    } else if (imageUrl.isRequired && isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.note.present) {
      context.handle(
          _noteMeta, note.isAcceptableValue(d.note.value, _noteMeta));
    } else if (note.isRequired && isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TarotTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TarotTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TarotTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.imageUrl.present) {
      map['image_url'] = Variable<String, StringType>(d.imageUrl.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.note.present) {
      map['note'] = Variable<String, StringType>(d.note.value);
    }
    return map;
  }

  @override
  $TarotTableTable createAlias(String alias) {
    return $TarotTableTable(_db, alias);
  }
}

class NoteTableData extends DataClass implements Insertable<NoteTableData> {
  final String id;
  final String tarotId;
  final String userId;
  final String content;
  NoteTableData(
      {@required this.id,
      @required this.tarotId,
      @required this.userId,
      @required this.content});
  factory NoteTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NoteTableData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      tarotId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tarot_id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
    );
  }
  factory NoteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return NoteTableData(
      id: serializer.fromJson<String>(json['id']),
      tarotId: serializer.fromJson<String>(json['tarotId']),
      userId: serializer.fromJson<String>(json['userId']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'tarotId': serializer.toJson<String>(tarotId),
      'userId': serializer.toJson<String>(userId),
      'content': serializer.toJson<String>(content),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<NoteTableData>>(
      bool nullToAbsent) {
    return NoteTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      tarotId: tarotId == null && nullToAbsent
          ? const Value.absent()
          : Value(tarotId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    ) as T;
  }

  NoteTableData copyWith(
          {String id, String tarotId, String userId, String content}) =>
      NoteTableData(
        id: id ?? this.id,
        tarotId: tarotId ?? this.tarotId,
        userId: userId ?? this.userId,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('NoteTableData(')
          ..write('id: $id, ')
          ..write('tarotId: $tarotId, ')
          ..write('userId: $userId, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(tarotId.hashCode, $mrjc(userId.hashCode, content.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is NoteTableData &&
          other.id == id &&
          other.tarotId == tarotId &&
          other.userId == userId &&
          other.content == content);
}

class NoteTableCompanion extends UpdateCompanion<NoteTableData> {
  final Value<String> id;
  final Value<String> tarotId;
  final Value<String> userId;
  final Value<String> content;
  const NoteTableCompanion({
    this.id = const Value.absent(),
    this.tarotId = const Value.absent(),
    this.userId = const Value.absent(),
    this.content = const Value.absent(),
  });
  NoteTableCompanion copyWith(
      {Value<String> id,
      Value<String> tarotId,
      Value<String> userId,
      Value<String> content}) {
    return NoteTableCompanion(
      id: id ?? this.id,
      tarotId: tarotId ?? this.tarotId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
    );
  }
}

class $NoteTableTable extends NoteTable
    with TableInfo<$NoteTableTable, NoteTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NoteTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tarotIdMeta = const VerificationMeta('tarotId');
  GeneratedTextColumn _tarotId;
  @override
  GeneratedTextColumn get tarotId => _tarotId ??= _constructTarotId();
  GeneratedTextColumn _constructTarotId() {
    return GeneratedTextColumn(
      'tarot_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, tarotId, userId, content];
  @override
  $NoteTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'note_table';
  @override
  final String actualTableName = 'note_table';
  @override
  VerificationContext validateIntegrity(NoteTableCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.tarotId.present) {
      context.handle(_tarotIdMeta,
          tarotId.isAcceptableValue(d.tarotId.value, _tarotIdMeta));
    } else if (tarotId.isRequired && isInserting) {
      context.missing(_tarotIdMeta);
    }
    if (d.userId.present) {
      context.handle(
          _userIdMeta, userId.isAcceptableValue(d.userId.value, _userIdMeta));
    } else if (userId.isRequired && isInserting) {
      context.missing(_userIdMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (content.isRequired && isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NoteTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NoteTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NoteTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.tarotId.present) {
      map['tarot_id'] = Variable<String, StringType>(d.tarotId.value);
    }
    if (d.userId.present) {
      map['user_id'] = Variable<String, StringType>(d.userId.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    return map;
  }

  @override
  $NoteTableTable createAlias(String alias) {
    return $NoteTableTable(_db, alias);
  }
}

abstract class _$MoorDb extends GeneratedDatabase {
  _$MoorDb(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TarotTableTable _tarotTable;
  $TarotTableTable get tarotTable => _tarotTable ??= $TarotTableTable(this);
  $NoteTableTable _noteTable;
  $NoteTableTable get noteTable => _noteTable ??= $NoteTableTable(this);
  TarotDao _tarotDao;
  TarotDao get tarotDao => _tarotDao ??= TarotDao(this as MoorDb);
  NoteDao _noteDao;
  NoteDao get noteDao => _noteDao ??= NoteDao(this as MoorDb);
  @override
  List<TableInfo> get allTables => [tarotTable, noteTable];
}
