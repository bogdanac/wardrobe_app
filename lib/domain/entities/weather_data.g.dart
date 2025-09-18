// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeatherDataCollection on Isar {
  IsarCollection<WeatherData> get weatherDatas => this.collection();
}

const WeatherDataSchema = CollectionSchema(
  name: r'WeatherData',
  id: 2298948898357077248,
  properties: {
    r'airQualityIndex': PropertySchema(
      id: 0,
      name: r'airQualityIndex',
      type: IsarType.long,
    ),
    r'clothingRecommendations': PropertySchema(
      id: 1,
      name: r'clothingRecommendations',
      type: IsarType.stringList,
    ),
    r'condition': PropertySchema(
      id: 2,
      name: r'condition',
      type: IsarType.string,
    ),
    r'dateTime': PropertySchema(
      id: 3,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'feelsLike': PropertySchema(
      id: 5,
      name: r'feelsLike',
      type: IsarType.double,
    ),
    r'humidity': PropertySchema(
      id: 6,
      name: r'humidity',
      type: IsarType.long,
    ),
    r'humidityDescription': PropertySchema(
      id: 7,
      name: r'humidityDescription',
      type: IsarType.string,
    ),
    r'iconCode': PropertySchema(
      id: 8,
      name: r'iconCode',
      type: IsarType.string,
    ),
    r'isCloudy': PropertySchema(
      id: 9,
      name: r'isCloudy',
      type: IsarType.bool,
    ),
    r'isCold': PropertySchema(
      id: 10,
      name: r'isCold',
      type: IsarType.bool,
    ),
    r'isFreezingCold': PropertySchema(
      id: 11,
      name: r'isFreezingCold',
      type: IsarType.bool,
    ),
    r'isHot': PropertySchema(
      id: 12,
      name: r'isHot',
      type: IsarType.bool,
    ),
    r'isHumid': PropertySchema(
      id: 13,
      name: r'isHumid',
      type: IsarType.bool,
    ),
    r'isRainy': PropertySchema(
      id: 14,
      name: r'isRainy',
      type: IsarType.bool,
    ),
    r'isSnowy': PropertySchema(
      id: 15,
      name: r'isSnowy',
      type: IsarType.bool,
    ),
    r'isSunny': PropertySchema(
      id: 16,
      name: r'isSunny',
      type: IsarType.bool,
    ),
    r'isWarm': PropertySchema(
      id: 17,
      name: r'isWarm',
      type: IsarType.bool,
    ),
    r'isWindy': PropertySchema(
      id: 18,
      name: r'isWindy',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(
      id: 19,
      name: r'location',
      type: IsarType.string,
    ),
    r'precipitationChance': PropertySchema(
      id: 20,
      name: r'precipitationChance',
      type: IsarType.double,
    ),
    r'precipitationMm': PropertySchema(
      id: 21,
      name: r'precipitationMm',
      type: IsarType.double,
    ),
    r'pressure': PropertySchema(
      id: 22,
      name: r'pressure',
      type: IsarType.double,
    ),
    r'recommendedColors': PropertySchema(
      id: 23,
      name: r'recommendedColors',
      type: IsarType.stringList,
    ),
    r'temperature': PropertySchema(
      id: 24,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'temperatureRange': PropertySchema(
      id: 25,
      name: r'temperatureRange',
      type: IsarType.string,
    ),
    r'uvIndex': PropertySchema(
      id: 26,
      name: r'uvIndex',
      type: IsarType.long,
    ),
    r'visibility': PropertySchema(
      id: 27,
      name: r'visibility',
      type: IsarType.double,
    ),
    r'windDescription': PropertySchema(
      id: 28,
      name: r'windDescription',
      type: IsarType.string,
    ),
    r'windSpeed': PropertySchema(
      id: 29,
      name: r'windSpeed',
      type: IsarType.double,
    )
  },
  estimateSize: _weatherDataEstimateSize,
  serialize: _weatherDataSerialize,
  deserialize: _weatherDataDeserialize,
  deserializeProp: _weatherDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _weatherDataGetId,
  getLinks: _weatherDataGetLinks,
  attach: _weatherDataAttach,
  version: '3.1.0+1',
);

int _weatherDataEstimateSize(
  WeatherData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clothingRecommendations.length * 3;
  {
    for (var i = 0; i < object.clothingRecommendations.length; i++) {
      final value = object.clothingRecommendations[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.condition.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.humidityDescription.length * 3;
  {
    final value = object.iconCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.location.length * 3;
  bytesCount += 3 + object.recommendedColors.length * 3;
  {
    for (var i = 0; i < object.recommendedColors.length; i++) {
      final value = object.recommendedColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.temperatureRange.length * 3;
  bytesCount += 3 + object.windDescription.length * 3;
  return bytesCount;
}

void _weatherDataSerialize(
  WeatherData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.airQualityIndex);
  writer.writeStringList(offsets[1], object.clothingRecommendations);
  writer.writeString(offsets[2], object.condition);
  writer.writeDateTime(offsets[3], object.dateTime);
  writer.writeString(offsets[4], object.description);
  writer.writeDouble(offsets[5], object.feelsLike);
  writer.writeLong(offsets[6], object.humidity);
  writer.writeString(offsets[7], object.humidityDescription);
  writer.writeString(offsets[8], object.iconCode);
  writer.writeBool(offsets[9], object.isCloudy);
  writer.writeBool(offsets[10], object.isCold);
  writer.writeBool(offsets[11], object.isFreezingCold);
  writer.writeBool(offsets[12], object.isHot);
  writer.writeBool(offsets[13], object.isHumid);
  writer.writeBool(offsets[14], object.isRainy);
  writer.writeBool(offsets[15], object.isSnowy);
  writer.writeBool(offsets[16], object.isSunny);
  writer.writeBool(offsets[17], object.isWarm);
  writer.writeBool(offsets[18], object.isWindy);
  writer.writeString(offsets[19], object.location);
  writer.writeDouble(offsets[20], object.precipitationChance);
  writer.writeDouble(offsets[21], object.precipitationMm);
  writer.writeDouble(offsets[22], object.pressure);
  writer.writeStringList(offsets[23], object.recommendedColors);
  writer.writeDouble(offsets[24], object.temperature);
  writer.writeString(offsets[25], object.temperatureRange);
  writer.writeLong(offsets[26], object.uvIndex);
  writer.writeDouble(offsets[27], object.visibility);
  writer.writeString(offsets[28], object.windDescription);
  writer.writeDouble(offsets[29], object.windSpeed);
}

WeatherData _weatherDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherData(
    airQualityIndex: reader.readLongOrNull(offsets[0]),
    condition: reader.readString(offsets[2]),
    dateTime: reader.readDateTime(offsets[3]),
    description: reader.readString(offsets[4]),
    feelsLike: reader.readDouble(offsets[5]),
    humidity: reader.readLong(offsets[6]),
    iconCode: reader.readStringOrNull(offsets[8]),
    location: reader.readString(offsets[19]),
    precipitationChance: reader.readDoubleOrNull(offsets[20]),
    precipitationMm: reader.readDoubleOrNull(offsets[21]),
    pressure: reader.readDoubleOrNull(offsets[22]),
    temperature: reader.readDouble(offsets[24]),
    uvIndex: reader.readLongOrNull(offsets[26]),
    visibility: reader.readDoubleOrNull(offsets[27]),
    windSpeed: reader.readDouble(offsets[29]),
  );
  object.id = id;
  return object;
}

P _weatherDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readStringList(offset) ?? []) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readDoubleOrNull(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weatherDataGetId(WeatherData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weatherDataGetLinks(WeatherData object) {
  return [];
}

void _weatherDataAttach(
    IsarCollection<dynamic> col, Id id, WeatherData object) {
  object.id = id;
}

extension WeatherDataQueryWhereSort
    on QueryBuilder<WeatherData, WeatherData, QWhere> {
  QueryBuilder<WeatherData, WeatherData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeatherDataQueryWhere
    on QueryBuilder<WeatherData, WeatherData, QWhereClause> {
  QueryBuilder<WeatherData, WeatherData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeatherDataQueryFilter
    on QueryBuilder<WeatherData, WeatherData, QFilterCondition> {
  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      airQualityIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'airQualityIndex',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      airQualityIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'airQualityIndex',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      airQualityIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'airQualityIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      airQualityIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'airQualityIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      airQualityIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'airQualityIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      airQualityIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'airQualityIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clothingRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clothingRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clothingRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clothingRecommendations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clothingRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clothingRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clothingRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clothingRecommendations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clothingRecommendations',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clothingRecommendations',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clothingRecommendations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clothingRecommendations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clothingRecommendations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clothingRecommendations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clothingRecommendations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      clothingRecommendationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'clothingRecommendations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      conditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      feelsLikeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      feelsLikeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      feelsLikeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      feelsLikeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feelsLike',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> humidityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> humidityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'humidity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidityDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'humidityDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'humidityDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'humidityDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'humidityDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'humidityDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'humidityDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'humidityDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidityDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      humidityDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'humidityDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconCode',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconCode',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> iconCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> iconCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> iconCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      iconCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isCloudyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCloudy',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isColdEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCold',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      isFreezingColdEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFreezingCold',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isHotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHot',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isHumidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHumid',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isRainyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRainy',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isSnowyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSnowy',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isSunnyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSunny',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isWarmEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWarm',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> isWindyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWindy',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> locationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> locationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationChance',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationChance',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationChanceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationChanceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationChanceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationChanceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationMmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationMm',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationMmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationMm',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationMmEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationMm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationMmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationMm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationMmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationMm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      precipitationMmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationMm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      pressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      pressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> pressureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      pressureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      pressureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> pressureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recommendedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recommendedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recommendedColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recommendedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recommendedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recommendedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recommendedColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recommendedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recommendedColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recommendedColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recommendedColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recommendedColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recommendedColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      recommendedColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recommendedColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperatureRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperatureRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperatureRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperatureRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'temperatureRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'temperatureRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'temperatureRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'temperatureRange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperatureRange',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      temperatureRangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'temperatureRange',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      uvIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      uvIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> uvIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      uvIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> uvIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition> uvIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      visibilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      visibilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      visibilityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      visibilityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      visibilityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      visibilityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visibility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'windDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'windDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'windDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'windDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'windDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windSpeedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windSpeedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windSpeedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterFilterCondition>
      windSpeedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WeatherDataQueryObject
    on QueryBuilder<WeatherData, WeatherData, QFilterCondition> {}

extension WeatherDataQueryLinks
    on QueryBuilder<WeatherData, WeatherData, QFilterCondition> {}

extension WeatherDataQuerySortBy
    on QueryBuilder<WeatherData, WeatherData, QSortBy> {
  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByAirQualityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airQualityIndex', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByAirQualityIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airQualityIndex', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByFeelsLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelsLike', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByFeelsLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelsLike', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByHumidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByHumidityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByHumidityDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidityDescription', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByHumidityDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidityDescription', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIconCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIconCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsCloudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCloudy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsCloudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCloudy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsCold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCold', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsColdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCold', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsFreezingCold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreezingCold', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByIsFreezingColdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreezingCold', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHot', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsHotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHot', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsHumid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHumid', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsHumidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHumid', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsRainy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRainy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsRainyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRainy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsSnowy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSnowy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsSnowyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSnowy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsSunny() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSunny', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsSunnyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSunny', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsWarm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWarm', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsWarmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWarm', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsWindy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWindy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByIsWindyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWindy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByPrecipitationChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByPrecipitationChanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByPrecipitationMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByPrecipitationMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByTemperatureRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatureRange', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByTemperatureRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatureRange', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByUvIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uvIndex', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByUvIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uvIndex', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByWindDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windDescription', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      sortByWindDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windDescription', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByWindSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeed', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> sortByWindSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeed', Sort.desc);
    });
  }
}

extension WeatherDataQuerySortThenBy
    on QueryBuilder<WeatherData, WeatherData, QSortThenBy> {
  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByAirQualityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airQualityIndex', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByAirQualityIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'airQualityIndex', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByFeelsLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelsLike', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByFeelsLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelsLike', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByHumidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByHumidityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByHumidityDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidityDescription', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByHumidityDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidityDescription', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIconCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIconCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsCloudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCloudy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsCloudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCloudy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsCold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCold', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsColdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCold', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsFreezingCold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreezingCold', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByIsFreezingColdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreezingCold', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHot', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsHotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHot', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsHumid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHumid', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsHumidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHumid', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsRainy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRainy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsRainyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRainy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsSnowy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSnowy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsSnowyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSnowy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsSunny() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSunny', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsSunnyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSunny', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsWarm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWarm', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsWarmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWarm', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsWindy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWindy', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByIsWindyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWindy', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByPrecipitationChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByPrecipitationChanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByPrecipitationMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByPrecipitationMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByTemperatureRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatureRange', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByTemperatureRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatureRange', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByUvIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uvIndex', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByUvIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uvIndex', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByWindDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windDescription', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy>
      thenByWindDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windDescription', Sort.desc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByWindSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeed', Sort.asc);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QAfterSortBy> thenByWindSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeed', Sort.desc);
    });
  }
}

extension WeatherDataQueryWhereDistinct
    on QueryBuilder<WeatherData, WeatherData, QDistinct> {
  QueryBuilder<WeatherData, WeatherData, QDistinct>
      distinctByAirQualityIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'airQualityIndex');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct>
      distinctByClothingRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clothingRecommendations');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByCondition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condition', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByFeelsLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feelsLike');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByHumidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'humidity');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct>
      distinctByHumidityDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'humidityDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIconCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsCloudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCloudy');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsCold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCold');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsFreezingCold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFreezingCold');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsHot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHot');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsHumid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHumid');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsRainy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRainy');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsSnowy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSnowy');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsSunny() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSunny');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsWarm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWarm');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByIsWindy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWindy');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct>
      distinctByPrecipitationChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationChance');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct>
      distinctByPrecipitationMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationMm');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pressure');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct>
      distinctByRecommendedColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recommendedColors');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByTemperatureRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperatureRange',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByUvIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uvIndex');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visibility');
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByWindDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherData, WeatherData, QDistinct> distinctByWindSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windSpeed');
    });
  }
}

extension WeatherDataQueryProperty
    on QueryBuilder<WeatherData, WeatherData, QQueryProperty> {
  QueryBuilder<WeatherData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeatherData, int?, QQueryOperations> airQualityIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'airQualityIndex');
    });
  }

  QueryBuilder<WeatherData, List<String>, QQueryOperations>
      clothingRecommendationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clothingRecommendations');
    });
  }

  QueryBuilder<WeatherData, String, QQueryOperations> conditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condition');
    });
  }

  QueryBuilder<WeatherData, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<WeatherData, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<WeatherData, double, QQueryOperations> feelsLikeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feelsLike');
    });
  }

  QueryBuilder<WeatherData, int, QQueryOperations> humidityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'humidity');
    });
  }

  QueryBuilder<WeatherData, String, QQueryOperations>
      humidityDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'humidityDescription');
    });
  }

  QueryBuilder<WeatherData, String?, QQueryOperations> iconCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconCode');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isCloudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCloudy');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isColdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCold');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isFreezingColdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFreezingCold');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isHotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHot');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isHumidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHumid');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isRainyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRainy');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isSnowyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSnowy');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isSunnyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSunny');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isWarmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWarm');
    });
  }

  QueryBuilder<WeatherData, bool, QQueryOperations> isWindyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWindy');
    });
  }

  QueryBuilder<WeatherData, String, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<WeatherData, double?, QQueryOperations>
      precipitationChanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationChance');
    });
  }

  QueryBuilder<WeatherData, double?, QQueryOperations>
      precipitationMmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationMm');
    });
  }

  QueryBuilder<WeatherData, double?, QQueryOperations> pressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pressure');
    });
  }

  QueryBuilder<WeatherData, List<String>, QQueryOperations>
      recommendedColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recommendedColors');
    });
  }

  QueryBuilder<WeatherData, double, QQueryOperations> temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<WeatherData, String, QQueryOperations>
      temperatureRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperatureRange');
    });
  }

  QueryBuilder<WeatherData, int?, QQueryOperations> uvIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uvIndex');
    });
  }

  QueryBuilder<WeatherData, double?, QQueryOperations> visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }

  QueryBuilder<WeatherData, String, QQueryOperations>
      windDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windDescription');
    });
  }

  QueryBuilder<WeatherData, double, QQueryOperations> windSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windSpeed');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeatherLocationCollection on Isar {
  IsarCollection<WeatherLocation> get weatherLocations => this.collection();
}

const WeatherLocationSchema = CollectionSchema(
  name: r'WeatherLocation',
  id: -2119113317774320700,
  properties: {
    r'country': PropertySchema(
      id: 0,
      name: r'country',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isCurrentLocation': PropertySchema(
      id: 2,
      name: r'isCurrentLocation',
      type: IsarType.bool,
    ),
    r'isDefault': PropertySchema(
      id: 3,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'lastUsed': PropertySchema(
      id: 4,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 5,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 6,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'region': PropertySchema(
      id: 8,
      name: r'region',
      type: IsarType.string,
    )
  },
  estimateSize: _weatherLocationEstimateSize,
  serialize: _weatherLocationSerialize,
  deserialize: _weatherLocationDeserialize,
  deserializeProp: _weatherLocationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _weatherLocationGetId,
  getLinks: _weatherLocationGetLinks,
  attach: _weatherLocationAttach,
  version: '3.1.0+1',
);

int _weatherLocationEstimateSize(
  WeatherLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.country;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.region;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _weatherLocationSerialize(
  WeatherLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.country);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.isCurrentLocation);
  writer.writeBool(offsets[3], object.isDefault);
  writer.writeDateTime(offsets[4], object.lastUsed);
  writer.writeDouble(offsets[5], object.latitude);
  writer.writeDouble(offsets[6], object.longitude);
  writer.writeString(offsets[7], object.name);
  writer.writeString(offsets[8], object.region);
}

WeatherLocation _weatherLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherLocation();
  object.country = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.isCurrentLocation = reader.readBool(offsets[2]);
  object.isDefault = reader.readBool(offsets[3]);
  object.lastUsed = reader.readDateTimeOrNull(offsets[4]);
  object.latitude = reader.readDouble(offsets[5]);
  object.longitude = reader.readDouble(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.region = reader.readStringOrNull(offsets[8]);
  return object;
}

P _weatherLocationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weatherLocationGetId(WeatherLocation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weatherLocationGetLinks(WeatherLocation object) {
  return [];
}

void _weatherLocationAttach(
    IsarCollection<dynamic> col, Id id, WeatherLocation object) {
  object.id = id;
}

extension WeatherLocationQueryWhereSort
    on QueryBuilder<WeatherLocation, WeatherLocation, QWhere> {
  QueryBuilder<WeatherLocation, WeatherLocation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeatherLocationQueryWhere
    on QueryBuilder<WeatherLocation, WeatherLocation, QWhereClause> {
  QueryBuilder<WeatherLocation, WeatherLocation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeatherLocationQueryFilter
    on QueryBuilder<WeatherLocation, WeatherLocation, QFilterCondition> {
  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      isCurrentLocationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCurrentLocation',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      isDefaultEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      lastUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      lastUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      lastUsedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      lastUsedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      lastUsedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      lastUsedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'region',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'region',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterFilterCondition>
      regionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'region',
        value: '',
      ));
    });
  }
}

extension WeatherLocationQueryObject
    on QueryBuilder<WeatherLocation, WeatherLocation, QFilterCondition> {}

extension WeatherLocationQueryLinks
    on QueryBuilder<WeatherLocation, WeatherLocation, QFilterCondition> {}

extension WeatherLocationQuerySortBy
    on QueryBuilder<WeatherLocation, WeatherLocation, QSortBy> {
  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByIsCurrentLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCurrentLocation', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByIsCurrentLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCurrentLocation', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> sortByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      sortByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }
}

extension WeatherLocationQuerySortThenBy
    on QueryBuilder<WeatherLocation, WeatherLocation, QSortThenBy> {
  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByIsCurrentLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCurrentLocation', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByIsCurrentLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCurrentLocation', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy> thenByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QAfterSortBy>
      thenByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }
}

extension WeatherLocationQueryWhereDistinct
    on QueryBuilder<WeatherLocation, WeatherLocation, QDistinct> {
  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct>
      distinctByIsCurrentLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCurrentLocation');
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct>
      distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct>
      distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct>
      distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct>
      distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherLocation, WeatherLocation, QDistinct> distinctByRegion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'region', caseSensitive: caseSensitive);
    });
  }
}

extension WeatherLocationQueryProperty
    on QueryBuilder<WeatherLocation, WeatherLocation, QQueryProperty> {
  QueryBuilder<WeatherLocation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeatherLocation, String?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<WeatherLocation, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<WeatherLocation, bool, QQueryOperations>
      isCurrentLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCurrentLocation');
    });
  }

  QueryBuilder<WeatherLocation, bool, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<WeatherLocation, DateTime?, QQueryOperations>
      lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<WeatherLocation, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<WeatherLocation, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<WeatherLocation, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<WeatherLocation, String?, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeatherForecastCollection on Isar {
  IsarCollection<WeatherForecast> get weatherForecasts => this.collection();
}

const WeatherForecastSchema = CollectionSchema(
  name: r'WeatherForecast',
  id: 5978684880315636015,
  properties: {
    r'condition': PropertySchema(
      id: 0,
      name: r'condition',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'fetchedAt': PropertySchema(
      id: 2,
      name: r'fetchedAt',
      type: IsarType.dateTime,
    ),
    r'forecastDate': PropertySchema(
      id: 3,
      name: r'forecastDate',
      type: IsarType.dateTime,
    ),
    r'hourlyDataJson': PropertySchema(
      id: 4,
      name: r'hourlyDataJson',
      type: IsarType.string,
    ),
    r'iconCode': PropertySchema(
      id: 5,
      name: r'iconCode',
      type: IsarType.string,
    ),
    r'locationId': PropertySchema(
      id: 6,
      name: r'locationId',
      type: IsarType.string,
    ),
    r'maxTemperature': PropertySchema(
      id: 7,
      name: r'maxTemperature',
      type: IsarType.double,
    ),
    r'minTemperature': PropertySchema(
      id: 8,
      name: r'minTemperature',
      type: IsarType.double,
    ),
    r'precipitationChance': PropertySchema(
      id: 9,
      name: r'precipitationChance',
      type: IsarType.double,
    ),
    r'precipitationMm': PropertySchema(
      id: 10,
      name: r'precipitationMm',
      type: IsarType.double,
    )
  },
  estimateSize: _weatherForecastEstimateSize,
  serialize: _weatherForecastSerialize,
  deserialize: _weatherForecastDeserialize,
  deserializeProp: _weatherForecastDeserializeProp,
  idName: r'id',
  indexes: {
    r'locationId': IndexSchema(
      id: 8924247506386354970,
      name: r'locationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'locationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _weatherForecastGetId,
  getLinks: _weatherForecastGetLinks,
  attach: _weatherForecastAttach,
  version: '3.1.0+1',
);

int _weatherForecastEstimateSize(
  WeatherForecast object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.condition.length * 3;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.hourlyDataJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.iconCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.locationId.length * 3;
  return bytesCount;
}

void _weatherForecastSerialize(
  WeatherForecast object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.condition);
  writer.writeString(offsets[1], object.description);
  writer.writeDateTime(offsets[2], object.fetchedAt);
  writer.writeDateTime(offsets[3], object.forecastDate);
  writer.writeString(offsets[4], object.hourlyDataJson);
  writer.writeString(offsets[5], object.iconCode);
  writer.writeString(offsets[6], object.locationId);
  writer.writeDouble(offsets[7], object.maxTemperature);
  writer.writeDouble(offsets[8], object.minTemperature);
  writer.writeDouble(offsets[9], object.precipitationChance);
  writer.writeDouble(offsets[10], object.precipitationMm);
}

WeatherForecast _weatherForecastDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherForecast();
  object.condition = reader.readString(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.fetchedAt = reader.readDateTime(offsets[2]);
  object.forecastDate = reader.readDateTime(offsets[3]);
  object.hourlyDataJson = reader.readStringOrNull(offsets[4]);
  object.iconCode = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.locationId = reader.readString(offsets[6]);
  object.maxTemperature = reader.readDouble(offsets[7]);
  object.minTemperature = reader.readDouble(offsets[8]);
  object.precipitationChance = reader.readDoubleOrNull(offsets[9]);
  object.precipitationMm = reader.readDoubleOrNull(offsets[10]);
  return object;
}

P _weatherForecastDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weatherForecastGetId(WeatherForecast object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weatherForecastGetLinks(WeatherForecast object) {
  return [];
}

void _weatherForecastAttach(
    IsarCollection<dynamic> col, Id id, WeatherForecast object) {
  object.id = id;
}

extension WeatherForecastQueryWhereSort
    on QueryBuilder<WeatherForecast, WeatherForecast, QWhere> {
  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeatherForecastQueryWhere
    on QueryBuilder<WeatherForecast, WeatherForecast, QWhereClause> {
  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause>
      locationIdEqualTo(String locationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'locationId',
        value: [locationId],
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterWhereClause>
      locationIdNotEqualTo(String locationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [],
              upper: [locationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [locationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [locationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [],
              upper: [locationId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension WeatherForecastQueryFilter
    on QueryBuilder<WeatherForecast, WeatherForecast, QFilterCondition> {
  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      conditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      fetchedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fetchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      fetchedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fetchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      fetchedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fetchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      fetchedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fetchedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      forecastDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'forecastDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      forecastDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'forecastDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      forecastDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'forecastDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      forecastDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'forecastDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hourlyDataJson',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hourlyDataJson',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hourlyDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hourlyDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hourlyDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hourlyDataJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hourlyDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hourlyDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hourlyDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hourlyDataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hourlyDataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      hourlyDataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hourlyDataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconCode',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconCode',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      iconCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      locationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      maxTemperatureEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      maxTemperatureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      maxTemperatureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      maxTemperatureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      minTemperatureEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      minTemperatureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      minTemperatureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      minTemperatureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationChance',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationChance',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationChanceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationChanceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationChanceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationChanceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationMmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationMm',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationMmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationMm',
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationMmEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationMm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationMmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationMm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationMmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationMm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterFilterCondition>
      precipitationMmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationMm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WeatherForecastQueryObject
    on QueryBuilder<WeatherForecast, WeatherForecast, QFilterCondition> {}

extension WeatherForecastQueryLinks
    on QueryBuilder<WeatherForecast, WeatherForecast, QFilterCondition> {}

extension WeatherForecastQuerySortBy
    on QueryBuilder<WeatherForecast, WeatherForecast, QSortBy> {
  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByFetchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByForecastDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByHourlyDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyDataJson', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByHourlyDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyDataJson', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByIconCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByIconCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByMaxTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTemperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByMaxTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTemperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByMinTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minTemperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByMinTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minTemperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByPrecipitationChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByPrecipitationChanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByPrecipitationMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      sortByPrecipitationMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.desc);
    });
  }
}

extension WeatherForecastQuerySortThenBy
    on QueryBuilder<WeatherForecast, WeatherForecast, QSortThenBy> {
  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByFetchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByForecastDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByHourlyDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyDataJson', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByHourlyDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyDataJson', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByIconCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByIconCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCode', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByMaxTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTemperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByMaxTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTemperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByMinTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minTemperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByMinTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minTemperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByPrecipitationChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByPrecipitationChanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationChance', Sort.desc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByPrecipitationMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.asc);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QAfterSortBy>
      thenByPrecipitationMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationMm', Sort.desc);
    });
  }
}

extension WeatherForecastQueryWhereDistinct
    on QueryBuilder<WeatherForecast, WeatherForecast, QDistinct> {
  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct> distinctByCondition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condition', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fetchedAt');
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forecastDate');
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByHourlyDataJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hourlyDataJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct> distinctByIconCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByMaxTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxTemperature');
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByMinTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minTemperature');
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByPrecipitationChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationChance');
    });
  }

  QueryBuilder<WeatherForecast, WeatherForecast, QDistinct>
      distinctByPrecipitationMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationMm');
    });
  }
}

extension WeatherForecastQueryProperty
    on QueryBuilder<WeatherForecast, WeatherForecast, QQueryProperty> {
  QueryBuilder<WeatherForecast, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeatherForecast, String, QQueryOperations> conditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condition');
    });
  }

  QueryBuilder<WeatherForecast, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<WeatherForecast, DateTime, QQueryOperations>
      fetchedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fetchedAt');
    });
  }

  QueryBuilder<WeatherForecast, DateTime, QQueryOperations>
      forecastDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forecastDate');
    });
  }

  QueryBuilder<WeatherForecast, String?, QQueryOperations>
      hourlyDataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hourlyDataJson');
    });
  }

  QueryBuilder<WeatherForecast, String?, QQueryOperations> iconCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconCode');
    });
  }

  QueryBuilder<WeatherForecast, String, QQueryOperations> locationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationId');
    });
  }

  QueryBuilder<WeatherForecast, double, QQueryOperations>
      maxTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxTemperature');
    });
  }

  QueryBuilder<WeatherForecast, double, QQueryOperations>
      minTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minTemperature');
    });
  }

  QueryBuilder<WeatherForecast, double?, QQueryOperations>
      precipitationChanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationChance');
    });
  }

  QueryBuilder<WeatherForecast, double?, QQueryOperations>
      precipitationMmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationMm');
    });
  }
}
