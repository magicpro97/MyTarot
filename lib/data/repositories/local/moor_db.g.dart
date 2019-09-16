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
  TarotTableData(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      this.description});
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
    );
  }
  factory TarotTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TarotTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      description: serializer.fromJson<String>(json['description']),
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
    ) as T;
  }

  TarotTableData copyWith(
          {String id, String name, String imageUrl, String description}) =>
      TarotTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('TarotTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(imageUrl.hashCode, description.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TarotTableData &&
          other.id == id &&
          other.name == name &&
          other.imageUrl == imageUrl &&
          other.description == description);
}

class TarotTableCompanion extends UpdateCompanion<TarotTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String> description;
  const TarotTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
  });
  TarotTableCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> imageUrl,
      Value<String> description}) {
    return TarotTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
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

  @override
  List<GeneratedColumn> get $columns => [id, name, imageUrl, description];
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
    return map;
  }

  @override
  $TarotTableTable createAlias(String alias) {
    return $TarotTableTable(_db, alias);
  }
}

abstract class _$MoorDb extends GeneratedDatabase {
  _$MoorDb(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TarotTableTable _tarotTable;
  $TarotTableTable get tarotTable => _tarotTable ??= $TarotTableTable(this);
  TarotDao _tarotDao;
  TarotDao get tarotDao => _tarotDao ??= TarotDao(this as MoorDb);
  @override
  List<TableInfo> get allTables => [tarotTable];
}
