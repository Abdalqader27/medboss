// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CollagesTableTable extends CollagesTable
    with TableInfo<$CollagesTableTable, CollageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollagesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _collageIdMeta =
      const VerificationMeta('collageId');
  @override
  late final GeneratedColumn<String> collageId = GeneratedColumn<String>(
      'collage_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [objectId, collageId, name];
  @override
  String get aliasedName => _alias ?? 'collages_table';
  @override
  String get actualTableName => 'collages_table';
  @override
  VerificationContext validateIntegrity(Insertable<CollageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('collage_id')) {
      context.handle(_collageIdMeta,
          collageId.isAcceptableOrUnknown(data['collage_id']!, _collageIdMeta));
    } else if (isInserting) {
      context.missing(_collageIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectId};
  @override
  CollageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollageData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      collageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collage_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CollagesTableTable createAlias(String alias) {
    return $CollagesTableTable(attachedDatabase, alias);
  }
}

class CollageData extends DataClass implements Insertable<CollageData> {
  final String objectId;
  final String collageId;
  final String name;
  const CollageData(
      {required this.objectId, required this.collageId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['collage_id'] = Variable<String>(collageId);
    map['name'] = Variable<String>(name);
    return map;
  }

  CollagesTableCompanion toCompanion(bool nullToAbsent) {
    return CollagesTableCompanion(
      objectId: Value(objectId),
      collageId: Value(collageId),
      name: Value(name),
    );
  }

  factory CollageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollageData(
      objectId: serializer.fromJson<String>(json['objectId']),
      collageId: serializer.fromJson<String>(json['collageId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'collageId': serializer.toJson<String>(collageId),
      'name': serializer.toJson<String>(name),
    };
  }

  CollageData copyWith({String? objectId, String? collageId, String? name}) =>
      CollageData(
        objectId: objectId ?? this.objectId,
        collageId: collageId ?? this.collageId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CollageData(')
          ..write('objectId: $objectId, ')
          ..write('collageId: $collageId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(objectId, collageId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollageData &&
          other.objectId == this.objectId &&
          other.collageId == this.collageId &&
          other.name == this.name);
}

class CollagesTableCompanion extends UpdateCompanion<CollageData> {
  final Value<String> objectId;
  final Value<String> collageId;
  final Value<String> name;
  final Value<int> rowid;
  const CollagesTableCompanion({
    this.objectId = const Value.absent(),
    this.collageId = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollagesTableCompanion.insert({
    required String objectId,
    required String collageId,
    required String name,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        collageId = Value(collageId),
        name = Value(name);
  static Insertable<CollageData> custom({
    Expression<String>? objectId,
    Expression<String>? collageId,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (collageId != null) 'collage_id': collageId,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollagesTableCompanion copyWith(
      {Value<String>? objectId,
      Value<String>? collageId,
      Value<String>? name,
      Value<int>? rowid}) {
    return CollagesTableCompanion(
      objectId: objectId ?? this.objectId,
      collageId: collageId ?? this.collageId,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (collageId.present) {
      map['collage_id'] = Variable<String>(collageId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollagesTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('collageId: $collageId, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FoldersTableTable extends FoldersTable
    with TableInfo<$FoldersTableTable, FolderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoldersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hasFilesMeta =
      const VerificationMeta('hasFiles');
  @override
  late final GeneratedColumn<bool> hasFiles =
      GeneratedColumn<bool>('has_files', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("has_files" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _universityIdMeta =
      const VerificationMeta('universityId');
  @override
  late final GeneratedColumn<int> universityId = GeneratedColumn<int>(
      'university_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [objectId, id, name, parentId, hasFiles, universityId];
  @override
  String get aliasedName => _alias ?? 'folders_table';
  @override
  String get actualTableName => 'folders_table';
  @override
  VerificationContext validateIntegrity(Insertable<FolderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('has_files')) {
      context.handle(_hasFilesMeta,
          hasFiles.isAcceptableOrUnknown(data['has_files']!, _hasFilesMeta));
    } else if (isInserting) {
      context.missing(_hasFilesMeta);
    }
    if (data.containsKey('university_id')) {
      context.handle(
          _universityIdMeta,
          universityId.isAcceptableOrUnknown(
              data['university_id']!, _universityIdMeta));
    } else if (isInserting) {
      context.missing(_universityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FolderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FolderData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      hasFiles: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_files'])!,
      universityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}university_id'])!,
    );
  }

  @override
  $FoldersTableTable createAlias(String alias) {
    return $FoldersTableTable(attachedDatabase, alias);
  }
}

class FolderData extends DataClass implements Insertable<FolderData> {
  final String objectId;
  final int id;
  final String name;
  final int parentId;
  final bool hasFiles;
  final int universityId;
  const FolderData(
      {required this.objectId,
      required this.id,
      required this.name,
      required this.parentId,
      required this.hasFiles,
      required this.universityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['parent_id'] = Variable<int>(parentId);
    map['has_files'] = Variable<bool>(hasFiles);
    map['university_id'] = Variable<int>(universityId);
    return map;
  }

  FoldersTableCompanion toCompanion(bool nullToAbsent) {
    return FoldersTableCompanion(
      objectId: Value(objectId),
      id: Value(id),
      name: Value(name),
      parentId: Value(parentId),
      hasFiles: Value(hasFiles),
      universityId: Value(universityId),
    );
  }

  factory FolderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FolderData(
      objectId: serializer.fromJson<String>(json['objectId']),
      id: serializer.fromJson<int>(json['ID']),
      name: serializer.fromJson<String>(json['Name']),
      parentId: serializer.fromJson<int>(json['ParentId']),
      hasFiles: serializer.fromJson<bool>(json['HasFiles']),
      universityId: serializer.fromJson<int>(json['UniversityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'ID': serializer.toJson<int>(id),
      'Name': serializer.toJson<String>(name),
      'ParentId': serializer.toJson<int>(parentId),
      'HasFiles': serializer.toJson<bool>(hasFiles),
      'UniversityId': serializer.toJson<int>(universityId),
    };
  }

  FolderData copyWith(
          {String? objectId,
          int? id,
          String? name,
          int? parentId,
          bool? hasFiles,
          int? universityId}) =>
      FolderData(
        objectId: objectId ?? this.objectId,
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        hasFiles: hasFiles ?? this.hasFiles,
        universityId: universityId ?? this.universityId,
      );
  @override
  String toString() {
    return (StringBuffer('FolderData(')
          ..write('objectId: $objectId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('hasFiles: $hasFiles, ')
          ..write('universityId: $universityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(objectId, id, name, parentId, hasFiles, universityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolderData &&
          other.objectId == this.objectId &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId &&
          other.hasFiles == this.hasFiles &&
          other.universityId == this.universityId);
}

class FoldersTableCompanion extends UpdateCompanion<FolderData> {
  final Value<String> objectId;
  final Value<int> id;
  final Value<String> name;
  final Value<int> parentId;
  final Value<bool> hasFiles;
  final Value<int> universityId;
  final Value<int> rowid;
  const FoldersTableCompanion({
    this.objectId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.hasFiles = const Value.absent(),
    this.universityId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoldersTableCompanion.insert({
    required String objectId,
    required int id,
    required String name,
    required int parentId,
    required bool hasFiles,
    required int universityId,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        id = Value(id),
        name = Value(name),
        parentId = Value(parentId),
        hasFiles = Value(hasFiles),
        universityId = Value(universityId);
  static Insertable<FolderData> custom({
    Expression<String>? objectId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? parentId,
    Expression<bool>? hasFiles,
    Expression<int>? universityId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentId != null) 'parent_id': parentId,
      if (hasFiles != null) 'has_files': hasFiles,
      if (universityId != null) 'university_id': universityId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoldersTableCompanion copyWith(
      {Value<String>? objectId,
      Value<int>? id,
      Value<String>? name,
      Value<int>? parentId,
      Value<bool>? hasFiles,
      Value<int>? universityId,
      Value<int>? rowid}) {
    return FoldersTableCompanion(
      objectId: objectId ?? this.objectId,
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      hasFiles: hasFiles ?? this.hasFiles,
      universityId: universityId ?? this.universityId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (hasFiles.present) {
      map['has_files'] = Variable<bool>(hasFiles.value);
    }
    if (universityId.present) {
      map['university_id'] = Variable<int>(universityId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoldersTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('hasFiles: $hasFiles, ')
          ..write('universityId: $universityId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FilesTableTable extends FilesTable
    with TableInfo<$FilesTableTable, FileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _folderIdMeta =
      const VerificationMeta('folderId');
  @override
  late final GeneratedColumn<int> folderId = GeneratedColumn<int>(
      'folder_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _myFileMeta = const VerificationMeta('myFile');
  @override
  late final GeneratedColumn<String> myFile = GeneratedColumn<String>(
      'my_file', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _universityIdMeta =
      const VerificationMeta('universityId');
  @override
  late final GeneratedColumn<int> universityId = GeneratedColumn<int>(
      'university_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActivatedMeta =
      const VerificationMeta('isActivated');
  @override
  late final GeneratedColumn<bool> isActivated =
      GeneratedColumn<bool>('is_activated', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_activated" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [objectId, folderId, name, myFile, universityId, isActivated];
  @override
  String get aliasedName => _alias ?? 'files_table';
  @override
  String get actualTableName => 'files_table';
  @override
  VerificationContext validateIntegrity(Insertable<FileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('folder_id')) {
      context.handle(_folderIdMeta,
          folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta));
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('my_file')) {
      context.handle(_myFileMeta,
          myFile.isAcceptableOrUnknown(data['my_file']!, _myFileMeta));
    } else if (isInserting) {
      context.missing(_myFileMeta);
    }
    if (data.containsKey('university_id')) {
      context.handle(
          _universityIdMeta,
          universityId.isAcceptableOrUnknown(
              data['university_id']!, _universityIdMeta));
    } else if (isInserting) {
      context.missing(_universityIdMeta);
    }
    if (data.containsKey('is_activated')) {
      context.handle(
          _isActivatedMeta,
          isActivated.isAcceptableOrUnknown(
              data['is_activated']!, _isActivatedMeta));
    } else if (isInserting) {
      context.missing(_isActivatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FileData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      folderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}folder_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      myFile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}my_file'])!,
      universityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}university_id'])!,
      isActivated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_activated'])!,
    );
  }

  @override
  $FilesTableTable createAlias(String alias) {
    return $FilesTableTable(attachedDatabase, alias);
  }
}

class FileData extends DataClass implements Insertable<FileData> {
  final String objectId;
  final int folderId;
  final String name;
  final String myFile;
  final int universityId;
  final bool isActivated;
  const FileData(
      {required this.objectId,
      required this.folderId,
      required this.name,
      required this.myFile,
      required this.universityId,
      required this.isActivated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['folder_id'] = Variable<int>(folderId);
    map['name'] = Variable<String>(name);
    map['my_file'] = Variable<String>(myFile);
    map['university_id'] = Variable<int>(universityId);
    map['is_activated'] = Variable<bool>(isActivated);
    return map;
  }

  FilesTableCompanion toCompanion(bool nullToAbsent) {
    return FilesTableCompanion(
      objectId: Value(objectId),
      folderId: Value(folderId),
      name: Value(name),
      myFile: Value(myFile),
      universityId: Value(universityId),
      isActivated: Value(isActivated),
    );
  }

  factory FileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FileData(
      objectId: serializer.fromJson<String>(json['objectId']),
      folderId: serializer.fromJson<int>(json['FolderId']),
      name: serializer.fromJson<String>(json['FileName']),
      myFile: serializer.fromJson<String>(json['MyFile']),
      universityId: serializer.fromJson<int>(json['UniversityId']),
      isActivated: serializer.fromJson<bool>(json['IsActivated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'FolderId': serializer.toJson<int>(folderId),
      'FileName': serializer.toJson<String>(name),
      'MyFile': serializer.toJson<String>(myFile),
      'UniversityId': serializer.toJson<int>(universityId),
      'IsActivated': serializer.toJson<bool>(isActivated),
    };
  }

  FileData copyWith(
          {String? objectId,
          int? folderId,
          String? name,
          String? myFile,
          int? universityId,
          bool? isActivated}) =>
      FileData(
        objectId: objectId ?? this.objectId,
        folderId: folderId ?? this.folderId,
        name: name ?? this.name,
        myFile: myFile ?? this.myFile,
        universityId: universityId ?? this.universityId,
        isActivated: isActivated ?? this.isActivated,
      );
  @override
  String toString() {
    return (StringBuffer('FileData(')
          ..write('objectId: $objectId, ')
          ..write('folderId: $folderId, ')
          ..write('name: $name, ')
          ..write('myFile: $myFile, ')
          ..write('universityId: $universityId, ')
          ..write('isActivated: $isActivated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(objectId, folderId, name, myFile, universityId, isActivated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FileData &&
          other.objectId == this.objectId &&
          other.folderId == this.folderId &&
          other.name == this.name &&
          other.myFile == this.myFile &&
          other.universityId == this.universityId &&
          other.isActivated == this.isActivated);
}

class FilesTableCompanion extends UpdateCompanion<FileData> {
  final Value<String> objectId;
  final Value<int> folderId;
  final Value<String> name;
  final Value<String> myFile;
  final Value<int> universityId;
  final Value<bool> isActivated;
  final Value<int> rowid;
  const FilesTableCompanion({
    this.objectId = const Value.absent(),
    this.folderId = const Value.absent(),
    this.name = const Value.absent(),
    this.myFile = const Value.absent(),
    this.universityId = const Value.absent(),
    this.isActivated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FilesTableCompanion.insert({
    required String objectId,
    required int folderId,
    required String name,
    required String myFile,
    required int universityId,
    required bool isActivated,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        folderId = Value(folderId),
        name = Value(name),
        myFile = Value(myFile),
        universityId = Value(universityId),
        isActivated = Value(isActivated);
  static Insertable<FileData> custom({
    Expression<String>? objectId,
    Expression<int>? folderId,
    Expression<String>? name,
    Expression<String>? myFile,
    Expression<int>? universityId,
    Expression<bool>? isActivated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (folderId != null) 'folder_id': folderId,
      if (name != null) 'name': name,
      if (myFile != null) 'my_file': myFile,
      if (universityId != null) 'university_id': universityId,
      if (isActivated != null) 'is_activated': isActivated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FilesTableCompanion copyWith(
      {Value<String>? objectId,
      Value<int>? folderId,
      Value<String>? name,
      Value<String>? myFile,
      Value<int>? universityId,
      Value<bool>? isActivated,
      Value<int>? rowid}) {
    return FilesTableCompanion(
      objectId: objectId ?? this.objectId,
      folderId: folderId ?? this.folderId,
      name: name ?? this.name,
      myFile: myFile ?? this.myFile,
      universityId: universityId ?? this.universityId,
      isActivated: isActivated ?? this.isActivated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (folderId.present) {
      map['folder_id'] = Variable<int>(folderId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (myFile.present) {
      map['my_file'] = Variable<String>(myFile.value);
    }
    if (universityId.present) {
      map['university_id'] = Variable<int>(universityId.value);
    }
    if (isActivated.present) {
      map['is_activated'] = Variable<bool>(isActivated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilesTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('folderId: $folderId, ')
          ..write('name: $name, ')
          ..write('myFile: $myFile, ')
          ..write('universityId: $universityId, ')
          ..write('isActivated: $isActivated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchasesTableTable extends PurchasesTable
    with TableInfo<$PurchasesTableTable, PurchaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchasesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectIdMeta =
      const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String> objectId = GeneratedColumn<String>(
      'object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileObjectIdMeta =
      const VerificationMeta('fileObjectId');
  @override
  late final GeneratedColumn<String> fileObjectId = GeneratedColumn<String>(
      'file_object_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [objectId, fileObjectId];
  @override
  String get aliasedName => _alias ?? 'purchases_table';
  @override
  String get actualTableName => 'purchases_table';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('file_object_id')) {
      context.handle(
          _fileObjectIdMeta,
          fileObjectId.isAcceptableOrUnknown(
              data['file_object_id']!, _fileObjectIdMeta));
    } else if (isInserting) {
      context.missing(_fileObjectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PurchaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseData(
      objectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_id'])!,
      fileObjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_object_id'])!,
    );
  }

  @override
  $PurchasesTableTable createAlias(String alias) {
    return $PurchasesTableTable(attachedDatabase, alias);
  }
}

class PurchaseData extends DataClass implements Insertable<PurchaseData> {
  final String objectId;
  final String fileObjectId;
  const PurchaseData({required this.objectId, required this.fileObjectId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_id'] = Variable<String>(objectId);
    map['file_object_id'] = Variable<String>(fileObjectId);
    return map;
  }

  PurchasesTableCompanion toCompanion(bool nullToAbsent) {
    return PurchasesTableCompanion(
      objectId: Value(objectId),
      fileObjectId: Value(fileObjectId),
    );
  }

  factory PurchaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseData(
      objectId: serializer.fromJson<String>(json['objectId']),
      fileObjectId: serializer.fromJson<String>(json['fileObjectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectId': serializer.toJson<String>(objectId),
      'fileObjectId': serializer.toJson<String>(fileObjectId),
    };
  }

  PurchaseData copyWith({String? objectId, String? fileObjectId}) =>
      PurchaseData(
        objectId: objectId ?? this.objectId,
        fileObjectId: fileObjectId ?? this.fileObjectId,
      );
  @override
  String toString() {
    return (StringBuffer('PurchaseData(')
          ..write('objectId: $objectId, ')
          ..write('fileObjectId: $fileObjectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(objectId, fileObjectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseData &&
          other.objectId == this.objectId &&
          other.fileObjectId == this.fileObjectId);
}

class PurchasesTableCompanion extends UpdateCompanion<PurchaseData> {
  final Value<String> objectId;
  final Value<String> fileObjectId;
  final Value<int> rowid;
  const PurchasesTableCompanion({
    this.objectId = const Value.absent(),
    this.fileObjectId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchasesTableCompanion.insert({
    required String objectId,
    required String fileObjectId,
    this.rowid = const Value.absent(),
  })  : objectId = Value(objectId),
        fileObjectId = Value(fileObjectId);
  static Insertable<PurchaseData> custom({
    Expression<String>? objectId,
    Expression<String>? fileObjectId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (objectId != null) 'object_id': objectId,
      if (fileObjectId != null) 'file_object_id': fileObjectId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchasesTableCompanion copyWith(
      {Value<String>? objectId,
      Value<String>? fileObjectId,
      Value<int>? rowid}) {
    return PurchasesTableCompanion(
      objectId: objectId ?? this.objectId,
      fileObjectId: fileObjectId ?? this.fileObjectId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (fileObjectId.present) {
      map['file_object_id'] = Variable<String>(fileObjectId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesTableCompanion(')
          ..write('objectId: $objectId, ')
          ..write('fileObjectId: $fileObjectId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CollagesTableTable collagesTable = $CollagesTableTable(this);
  late final $FoldersTableTable foldersTable = $FoldersTableTable(this);
  late final $FilesTableTable filesTable = $FilesTableTable(this);
  late final $PurchasesTableTable purchasesTable = $PurchasesTableTable(this);
  late final CollagesDAO collagesDAO = CollagesDAO(this as AppDatabase);
  late final FoldersDao foldersDao = FoldersDao(this as AppDatabase);
  late final FilesDao filesDao = FilesDao(this as AppDatabase);
  late final PurchasesDao purchasesDao = PurchasesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [collagesTable, foldersTable, filesTable, purchasesTable];
}
