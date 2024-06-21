// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocationTableTable extends LocationTable
    with TableInfo<$LocationTableTable, LocationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _googleStaticMapsUriMeta =
      const VerificationMeta('googleStaticMapsUri');
  @override
  late final GeneratedColumn<String> googleStaticMapsUri =
      GeneratedColumn<String>('google_static_maps_uri', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, latitude, longitude, address, googleStaticMapsUri];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_table';
  @override
  VerificationContext validateIntegrity(Insertable<LocationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('google_static_maps_uri')) {
      context.handle(
          _googleStaticMapsUriMeta,
          googleStaticMapsUri.isAcceptableOrUnknown(
              data['google_static_maps_uri']!, _googleStaticMapsUriMeta));
    } else if (isInserting) {
      context.missing(_googleStaticMapsUriMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      googleStaticMapsUri: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}google_static_maps_uri'])!,
    );
  }

  @override
  $LocationTableTable createAlias(String alias) {
    return $LocationTableTable(attachedDatabase, alias);
  }
}

class LocationTableData extends DataClass
    implements Insertable<LocationTableData> {
  final int id;
  final double latitude;
  final double longitude;
  final String address;
  final String googleStaticMapsUri;
  const LocationTableData(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.googleStaticMapsUri});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['address'] = Variable<String>(address);
    map['google_static_maps_uri'] = Variable<String>(googleStaticMapsUri);
    return map;
  }

  LocationTableCompanion toCompanion(bool nullToAbsent) {
    return LocationTableCompanion(
      id: Value(id),
      latitude: Value(latitude),
      longitude: Value(longitude),
      address: Value(address),
      googleStaticMapsUri: Value(googleStaticMapsUri),
    );
  }

  factory LocationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationTableData(
      id: serializer.fromJson<int>(json['id']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      address: serializer.fromJson<String>(json['address']),
      googleStaticMapsUri:
          serializer.fromJson<String>(json['googleStaticMapsUri']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'address': serializer.toJson<String>(address),
      'googleStaticMapsUri': serializer.toJson<String>(googleStaticMapsUri),
    };
  }

  LocationTableData copyWith(
          {int? id,
          double? latitude,
          double? longitude,
          String? address,
          String? googleStaticMapsUri}) =>
      LocationTableData(
        id: id ?? this.id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        googleStaticMapsUri: googleStaticMapsUri ?? this.googleStaticMapsUri,
      );
  @override
  String toString() {
    return (StringBuffer('LocationTableData(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('googleStaticMapsUri: $googleStaticMapsUri')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, latitude, longitude, address, googleStaticMapsUri);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationTableData &&
          other.id == this.id &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.googleStaticMapsUri == this.googleStaticMapsUri);
}

class LocationTableCompanion extends UpdateCompanion<LocationTableData> {
  final Value<int> id;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> address;
  final Value<String> googleStaticMapsUri;
  const LocationTableCompanion({
    this.id = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.googleStaticMapsUri = const Value.absent(),
  });
  LocationTableCompanion.insert({
    this.id = const Value.absent(),
    required double latitude,
    required double longitude,
    required String address,
    required String googleStaticMapsUri,
  })  : latitude = Value(latitude),
        longitude = Value(longitude),
        address = Value(address),
        googleStaticMapsUri = Value(googleStaticMapsUri);
  static Insertable<LocationTableData> custom({
    Expression<int>? id,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? address,
    Expression<String>? googleStaticMapsUri,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (googleStaticMapsUri != null)
        'google_static_maps_uri': googleStaticMapsUri,
    });
  }

  LocationTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String>? address,
      Value<String>? googleStaticMapsUri}) {
    return LocationTableCompanion(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      googleStaticMapsUri: googleStaticMapsUri ?? this.googleStaticMapsUri,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (googleStaticMapsUri.present) {
      map['google_static_maps_uri'] =
          Variable<String>(googleStaticMapsUri.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationTableCompanion(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('googleStaticMapsUri: $googleStaticMapsUri')
          ..write(')'))
        .toString();
  }
}

class $PlaceTableTable extends PlaceTable
    with TableInfo<$PlaceTableTable, PlaceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaceTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
      'location', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES location_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, title, image, location];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'place_table';
  @override
  VerificationContext validateIntegrity(Insertable<PlaceTableData> instance,
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
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location'])!,
    );
  }

  @override
  $PlaceTableTable createAlias(String alias) {
    return $PlaceTableTable(attachedDatabase, alias);
  }
}

class PlaceTableData extends DataClass implements Insertable<PlaceTableData> {
  final int id;
  final String title;
  final String image;
  final int location;
  const PlaceTableData(
      {required this.id,
      required this.title,
      required this.image,
      required this.location});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['location'] = Variable<int>(location);
    return map;
  }

  PlaceTableCompanion toCompanion(bool nullToAbsent) {
    return PlaceTableCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      location: Value(location),
    );
  }

  factory PlaceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      location: serializer.fromJson<int>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'location': serializer.toJson<int>(location),
    };
  }

  PlaceTableData copyWith(
          {int? id, String? title, String? image, int? location}) =>
      PlaceTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('PlaceTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaceTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.location == this.location);
}

class PlaceTableCompanion extends UpdateCompanion<PlaceTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> image;
  final Value<int> location;
  const PlaceTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.location = const Value.absent(),
  });
  PlaceTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String image,
    required int location,
  })  : title = Value(title),
        image = Value(image),
        location = Value(location);
  static Insertable<PlaceTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<int>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (location != null) 'location': location,
    });
  }

  PlaceTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? image,
      Value<int>? location}) {
    return PlaceTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      location: location ?? this.location,
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (location.present) {
      map['location'] = Variable<int>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaceTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $LocationTableTable locationTable = $LocationTableTable(this);
  late final $PlaceTableTable placeTable = $PlaceTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [locationTable, placeTable];
}

typedef $$LocationTableTableInsertCompanionBuilder = LocationTableCompanion
    Function({
  Value<int> id,
  required double latitude,
  required double longitude,
  required String address,
  required String googleStaticMapsUri,
});
typedef $$LocationTableTableUpdateCompanionBuilder = LocationTableCompanion
    Function({
  Value<int> id,
  Value<double> latitude,
  Value<double> longitude,
  Value<String> address,
  Value<String> googleStaticMapsUri,
});

class $$LocationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocationTableTable,
    LocationTableData,
    $$LocationTableTableFilterComposer,
    $$LocationTableTableOrderingComposer,
    $$LocationTableTableProcessedTableManager,
    $$LocationTableTableInsertCompanionBuilder,
    $$LocationTableTableUpdateCompanionBuilder> {
  $$LocationTableTableTableManager(_$AppDatabase db, $LocationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LocationTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LocationTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$LocationTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> googleStaticMapsUri = const Value.absent(),
          }) =>
              LocationTableCompanion(
            id: id,
            latitude: latitude,
            longitude: longitude,
            address: address,
            googleStaticMapsUri: googleStaticMapsUri,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required double latitude,
            required double longitude,
            required String address,
            required String googleStaticMapsUri,
          }) =>
              LocationTableCompanion.insert(
            id: id,
            latitude: latitude,
            longitude: longitude,
            address: address,
            googleStaticMapsUri: googleStaticMapsUri,
          ),
        ));
}

class $$LocationTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $LocationTableTable,
    LocationTableData,
    $$LocationTableTableFilterComposer,
    $$LocationTableTableOrderingComposer,
    $$LocationTableTableProcessedTableManager,
    $$LocationTableTableInsertCompanionBuilder,
    $$LocationTableTableUpdateCompanionBuilder> {
  $$LocationTableTableProcessedTableManager(super.$state);
}

class $$LocationTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LocationTableTable> {
  $$LocationTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get longitude => $state.composableBuilder(
      column: $state.table.longitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get googleStaticMapsUri => $state.composableBuilder(
      column: $state.table.googleStaticMapsUri,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter placeTableRefs(
      ComposableFilter Function($$PlaceTableTableFilterComposer f) f) {
    final $$PlaceTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.placeTable,
        getReferencedColumn: (t) => t.location,
        builder: (joinBuilder, parentComposers) =>
            $$PlaceTableTableFilterComposer(ComposerState($state.db,
                $state.db.placeTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$LocationTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LocationTableTable> {
  $$LocationTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get longitude => $state.composableBuilder(
      column: $state.table.longitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get googleStaticMapsUri => $state.composableBuilder(
      column: $state.table.googleStaticMapsUri,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PlaceTableTableInsertCompanionBuilder = PlaceTableCompanion Function({
  Value<int> id,
  required String title,
  required String image,
  required int location,
});
typedef $$PlaceTableTableUpdateCompanionBuilder = PlaceTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> image,
  Value<int> location,
});

class $$PlaceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlaceTableTable,
    PlaceTableData,
    $$PlaceTableTableFilterComposer,
    $$PlaceTableTableOrderingComposer,
    $$PlaceTableTableProcessedTableManager,
    $$PlaceTableTableInsertCompanionBuilder,
    $$PlaceTableTableUpdateCompanionBuilder> {
  $$PlaceTableTableTableManager(_$AppDatabase db, $PlaceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PlaceTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PlaceTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PlaceTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<int> location = const Value.absent(),
          }) =>
              PlaceTableCompanion(
            id: id,
            title: title,
            image: image,
            location: location,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String image,
            required int location,
          }) =>
              PlaceTableCompanion.insert(
            id: id,
            title: title,
            image: image,
            location: location,
          ),
        ));
}

class $$PlaceTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $PlaceTableTable,
    PlaceTableData,
    $$PlaceTableTableFilterComposer,
    $$PlaceTableTableOrderingComposer,
    $$PlaceTableTableProcessedTableManager,
    $$PlaceTableTableInsertCompanionBuilder,
    $$PlaceTableTableUpdateCompanionBuilder> {
  $$PlaceTableTableProcessedTableManager(super.$state);
}

class $$PlaceTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PlaceTableTable> {
  $$PlaceTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$LocationTableTableFilterComposer get location {
    final $$LocationTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.location,
        referencedTable: $state.db.locationTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$LocationTableTableFilterComposer(ComposerState($state.db,
                $state.db.locationTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PlaceTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PlaceTableTable> {
  $$PlaceTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$LocationTableTableOrderingComposer get location {
    final $$LocationTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.location,
            referencedTable: $state.db.locationTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$LocationTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.locationTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$LocationTableTableTableManager get locationTable =>
      $$LocationTableTableTableManager(_db, _db.locationTable);
  $$PlaceTableTableTableManager get placeTable =>
      $$PlaceTableTableTableManager(_db, _db.placeTable);
}
