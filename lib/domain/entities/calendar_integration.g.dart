// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_integration.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitSuggestionCollection on Isar {
  IsarCollection<OutfitSuggestion> get outfitSuggestions => this.collection();
}

const OutfitSuggestionSchema = CollectionSchema(
  name: r'OutfitSuggestion',
  id: -6216235470171341928,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'dressCode': PropertySchema(
      id: 2,
      name: r'dressCode',
      type: IsarType.string,
    ),
    r'eventEnd': PropertySchema(
      id: 3,
      name: r'eventEnd',
      type: IsarType.dateTime,
    ),
    r'eventId': PropertySchema(
      id: 4,
      name: r'eventId',
      type: IsarType.string,
    ),
    r'eventStart': PropertySchema(
      id: 5,
      name: r'eventStart',
      type: IsarType.dateTime,
    ),
    r'eventTitle': PropertySchema(
      id: 6,
      name: r'eventTitle',
      type: IsarType.string,
    ),
    r'expectedTemperature': PropertySchema(
      id: 7,
      name: r'expectedTemperature',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 8,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isConfirmed': PropertySchema(
      id: 9,
      name: r'isConfirmed',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(
      id: 10,
      name: r'location',
      type: IsarType.string,
    ),
    r'occasion': PropertySchema(
      id: 11,
      name: r'occasion',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 12,
      name: r'priority',
      type: IsarType.long,
    ),
    r'suggestedOutfitId': PropertySchema(
      id: 13,
      name: r'suggestedOutfitId',
      type: IsarType.string,
    ),
    r'timeOfDay': PropertySchema(
      id: 14,
      name: r'timeOfDay',
      type: IsarType.string,
      enumMap: _OutfitSuggestiontimeOfDayEnumValueMap,
    ),
    r'weatherConditions': PropertySchema(
      id: 15,
      name: r'weatherConditions',
      type: IsarType.string,
    )
  },
  estimateSize: _outfitSuggestionEstimateSize,
  serialize: _outfitSuggestionSerialize,
  deserialize: _outfitSuggestionDeserialize,
  deserializeProp: _outfitSuggestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _outfitSuggestionGetId,
  getLinks: _outfitSuggestionGetLinks,
  attach: _outfitSuggestionAttach,
  version: '3.1.0+1',
);

int _outfitSuggestionEstimateSize(
  OutfitSuggestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dressCode.length * 3;
  bytesCount += 3 + object.eventId.length * 3;
  bytesCount += 3 + object.eventTitle.length * 3;
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.occasion.length * 3;
  {
    final value = object.suggestedOutfitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.timeOfDay.name.length * 3;
  {
    final value = object.weatherConditions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _outfitSuggestionSerialize(
  OutfitSuggestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.dressCode);
  writer.writeDateTime(offsets[3], object.eventEnd);
  writer.writeString(offsets[4], object.eventId);
  writer.writeDateTime(offsets[5], object.eventStart);
  writer.writeString(offsets[6], object.eventTitle);
  writer.writeDouble(offsets[7], object.expectedTemperature);
  writer.writeBool(offsets[8], object.isCompleted);
  writer.writeBool(offsets[9], object.isConfirmed);
  writer.writeString(offsets[10], object.location);
  writer.writeString(offsets[11], object.occasion);
  writer.writeLong(offsets[12], object.priority);
  writer.writeString(offsets[13], object.suggestedOutfitId);
  writer.writeString(offsets[14], object.timeOfDay.name);
  writer.writeString(offsets[15], object.weatherConditions);
}

OutfitSuggestion _outfitSuggestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitSuggestion();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.dressCode = reader.readString(offsets[2]);
  object.eventEnd = reader.readDateTime(offsets[3]);
  object.eventId = reader.readString(offsets[4]);
  object.eventStart = reader.readDateTime(offsets[5]);
  object.eventTitle = reader.readString(offsets[6]);
  object.expectedTemperature = reader.readDoubleOrNull(offsets[7]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[8]);
  object.isConfirmed = reader.readBool(offsets[9]);
  object.location = reader.readStringOrNull(offsets[10]);
  object.occasion = reader.readString(offsets[11]);
  object.priority = reader.readLong(offsets[12]);
  object.suggestedOutfitId = reader.readStringOrNull(offsets[13]);
  object.timeOfDay = _OutfitSuggestiontimeOfDayValueEnumMap[
          reader.readStringOrNull(offsets[14])] ??
      TimeOfDay.morning;
  object.weatherConditions = reader.readStringOrNull(offsets[15]);
  return object;
}

P _outfitSuggestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (_OutfitSuggestiontimeOfDayValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TimeOfDay.morning) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OutfitSuggestiontimeOfDayEnumValueMap = {
  r'morning': r'morning',
  r'afternoon': r'afternoon',
  r'evening': r'evening',
};
const _OutfitSuggestiontimeOfDayValueEnumMap = {
  r'morning': TimeOfDay.morning,
  r'afternoon': TimeOfDay.afternoon,
  r'evening': TimeOfDay.evening,
};

Id _outfitSuggestionGetId(OutfitSuggestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitSuggestionGetLinks(OutfitSuggestion object) {
  return [];
}

void _outfitSuggestionAttach(
    IsarCollection<dynamic> col, Id id, OutfitSuggestion object) {
  object.id = id;
}

extension OutfitSuggestionQueryWhereSort
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QWhere> {
  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OutfitSuggestionQueryWhere
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QWhereClause> {
  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterWhereClause>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterWhereClause> idBetween(
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

extension OutfitSuggestionQueryFilter
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QFilterCondition> {
  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dressCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dressCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dressCode',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      dressCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dressCode',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventEndEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventEndGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventEndLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventEndBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventStartEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventStart',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventStartGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventStart',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventStartLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventStart',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventStartBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      eventTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      expectedTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedTemperature',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      expectedTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedTemperature',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      expectedTemperatureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      expectedTemperatureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      expectedTemperatureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      expectedTemperatureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      isConfirmedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isConfirmed',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationEqualTo(
    String? value, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationLessThan(
    String? value, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
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

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'occasion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'occasion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      occasionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      priorityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      priorityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'suggestedOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'suggestedOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestedOutfitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestedOutfitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      suggestedOutfitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestedOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayEqualTo(
    TimeOfDay value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayGreaterThan(
    TimeOfDay value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayLessThan(
    TimeOfDay value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayBetween(
    TimeOfDay lower,
    TimeOfDay upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeOfDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeOfDay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfDay',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      timeOfDayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeOfDay',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherConditions',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherConditions',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherConditions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherConditions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherConditions',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterFilterCondition>
      weatherConditionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherConditions',
        value: '',
      ));
    });
  }
}

extension OutfitSuggestionQueryObject
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QFilterCondition> {}

extension OutfitSuggestionQueryLinks
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QFilterCondition> {}

extension OutfitSuggestionQuerySortBy
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QSortBy> {
  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByDressCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dressCode', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByDressCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dressCode', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventEnd', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventEnd', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventStart', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventStart', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByEventTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByExpectedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByExpectedTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByIsConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByIsConfirmedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortBySuggestedOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortBySuggestedOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByTimeOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByTimeOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByWeatherConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      sortByWeatherConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.desc);
    });
  }
}

extension OutfitSuggestionQuerySortThenBy
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QSortThenBy> {
  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByDressCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dressCode', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByDressCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dressCode', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventEnd', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventEnd', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventStart', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventStart', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByEventTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByExpectedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByExpectedTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByIsConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByIsConfirmedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenBySuggestedOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenBySuggestedOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByTimeOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByTimeOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.desc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByWeatherConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.asc);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QAfterSortBy>
      thenByWeatherConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.desc);
    });
  }
}

extension OutfitSuggestionQueryWhereDistinct
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct> {
  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByDressCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dressCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByEventEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventEnd');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct> distinctByEventId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByEventStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventStart');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByEventTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByExpectedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedTemperature');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByIsConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isConfirmed');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByLocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByOccasion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occasion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctBySuggestedOutfitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestedOutfitId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByTimeOfDay({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeOfDay', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitSuggestion, OutfitSuggestion, QDistinct>
      distinctByWeatherConditions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherConditions',
          caseSensitive: caseSensitive);
    });
  }
}

extension OutfitSuggestionQueryProperty
    on QueryBuilder<OutfitSuggestion, OutfitSuggestion, QQueryProperty> {
  QueryBuilder<OutfitSuggestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitSuggestion, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutfitSuggestion, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<OutfitSuggestion, String, QQueryOperations> dressCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dressCode');
    });
  }

  QueryBuilder<OutfitSuggestion, DateTime, QQueryOperations>
      eventEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventEnd');
    });
  }

  QueryBuilder<OutfitSuggestion, String, QQueryOperations> eventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventId');
    });
  }

  QueryBuilder<OutfitSuggestion, DateTime, QQueryOperations>
      eventStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventStart');
    });
  }

  QueryBuilder<OutfitSuggestion, String, QQueryOperations>
      eventTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventTitle');
    });
  }

  QueryBuilder<OutfitSuggestion, double?, QQueryOperations>
      expectedTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedTemperature');
    });
  }

  QueryBuilder<OutfitSuggestion, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<OutfitSuggestion, bool, QQueryOperations> isConfirmedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isConfirmed');
    });
  }

  QueryBuilder<OutfitSuggestion, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<OutfitSuggestion, String, QQueryOperations> occasionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occasion');
    });
  }

  QueryBuilder<OutfitSuggestion, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<OutfitSuggestion, String?, QQueryOperations>
      suggestedOutfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestedOutfitId');
    });
  }

  QueryBuilder<OutfitSuggestion, TimeOfDay, QQueryOperations>
      timeOfDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeOfDay');
    });
  }

  QueryBuilder<OutfitSuggestion, String?, QQueryOperations>
      weatherConditionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherConditions');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCalendarIntegrationSettingsCollection on Isar {
  IsarCollection<CalendarIntegrationSettings> get calendarIntegrationSettings =>
      this.collection();
}

const CalendarIntegrationSettingsSchema = CollectionSchema(
  name: r'CalendarIntegrationSettings',
  id: 469592414893995900,
  properties: {
    r'analyzeEventTitles': PropertySchema(
      id: 0,
      name: r'analyzeEventTitles',
      type: IsarType.bool,
    ),
    r'autoSuggestOutfits': PropertySchema(
      id: 1,
      name: r'autoSuggestOutfits',
      type: IsarType.bool,
    ),
    r'casualKeywords': PropertySchema(
      id: 2,
      name: r'casualKeywords',
      type: IsarType.stringList,
    ),
    r'considerWeather': PropertySchema(
      id: 3,
      name: r'considerWeather',
      type: IsarType.bool,
    ),
    r'formalKeywords': PropertySchema(
      id: 4,
      name: r'formalKeywords',
      type: IsarType.stringList,
    ),
    r'gymKeywords': PropertySchema(
      id: 5,
      name: r'gymKeywords',
      type: IsarType.stringList,
    ),
    r'lastSyncAt': PropertySchema(
      id: 6,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'notificationHoursBefore': PropertySchema(
      id: 7,
      name: r'notificationHoursBefore',
      type: IsarType.long,
    ),
    r'partyKeywords': PropertySchema(
      id: 8,
      name: r'partyKeywords',
      type: IsarType.stringList,
    ),
    r'planningDaysAhead': PropertySchema(
      id: 9,
      name: r'planningDaysAhead',
      type: IsarType.long,
    ),
    r'selectedCalendarId': PropertySchema(
      id: 10,
      name: r'selectedCalendarId',
      type: IsarType.string,
    ),
    r'selectedCalendarName': PropertySchema(
      id: 11,
      name: r'selectedCalendarName',
      type: IsarType.string,
    ),
    r'sendNotifications': PropertySchema(
      id: 12,
      name: r'sendNotifications',
      type: IsarType.bool,
    ),
    r'workKeywords': PropertySchema(
      id: 13,
      name: r'workKeywords',
      type: IsarType.stringList,
    )
  },
  estimateSize: _calendarIntegrationSettingsEstimateSize,
  serialize: _calendarIntegrationSettingsSerialize,
  deserialize: _calendarIntegrationSettingsDeserialize,
  deserializeProp: _calendarIntegrationSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _calendarIntegrationSettingsGetId,
  getLinks: _calendarIntegrationSettingsGetLinks,
  attach: _calendarIntegrationSettingsAttach,
  version: '3.1.0+1',
);

int _calendarIntegrationSettingsEstimateSize(
  CalendarIntegrationSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.casualKeywords.length * 3;
  {
    for (var i = 0; i < object.casualKeywords.length; i++) {
      final value = object.casualKeywords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.formalKeywords.length * 3;
  {
    for (var i = 0; i < object.formalKeywords.length; i++) {
      final value = object.formalKeywords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.gymKeywords.length * 3;
  {
    for (var i = 0; i < object.gymKeywords.length; i++) {
      final value = object.gymKeywords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.partyKeywords.length * 3;
  {
    for (var i = 0; i < object.partyKeywords.length; i++) {
      final value = object.partyKeywords[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.selectedCalendarId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.selectedCalendarName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.workKeywords.length * 3;
  {
    for (var i = 0; i < object.workKeywords.length; i++) {
      final value = object.workKeywords[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _calendarIntegrationSettingsSerialize(
  CalendarIntegrationSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.analyzeEventTitles);
  writer.writeBool(offsets[1], object.autoSuggestOutfits);
  writer.writeStringList(offsets[2], object.casualKeywords);
  writer.writeBool(offsets[3], object.considerWeather);
  writer.writeStringList(offsets[4], object.formalKeywords);
  writer.writeStringList(offsets[5], object.gymKeywords);
  writer.writeDateTime(offsets[6], object.lastSyncAt);
  writer.writeLong(offsets[7], object.notificationHoursBefore);
  writer.writeStringList(offsets[8], object.partyKeywords);
  writer.writeLong(offsets[9], object.planningDaysAhead);
  writer.writeString(offsets[10], object.selectedCalendarId);
  writer.writeString(offsets[11], object.selectedCalendarName);
  writer.writeBool(offsets[12], object.sendNotifications);
  writer.writeStringList(offsets[13], object.workKeywords);
}

CalendarIntegrationSettings _calendarIntegrationSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CalendarIntegrationSettings();
  object.analyzeEventTitles = reader.readBool(offsets[0]);
  object.autoSuggestOutfits = reader.readBool(offsets[1]);
  object.casualKeywords = reader.readStringList(offsets[2]) ?? [];
  object.considerWeather = reader.readBool(offsets[3]);
  object.formalKeywords = reader.readStringList(offsets[4]) ?? [];
  object.gymKeywords = reader.readStringList(offsets[5]) ?? [];
  object.id = id;
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[6]);
  object.notificationHoursBefore = reader.readLong(offsets[7]);
  object.partyKeywords = reader.readStringList(offsets[8]) ?? [];
  object.planningDaysAhead = reader.readLong(offsets[9]);
  object.selectedCalendarId = reader.readStringOrNull(offsets[10]);
  object.selectedCalendarName = reader.readStringOrNull(offsets[11]);
  object.sendNotifications = reader.readBool(offsets[12]);
  object.workKeywords = reader.readStringList(offsets[13]) ?? [];
  return object;
}

P _calendarIntegrationSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _calendarIntegrationSettingsGetId(CalendarIntegrationSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _calendarIntegrationSettingsGetLinks(
    CalendarIntegrationSettings object) {
  return [];
}

void _calendarIntegrationSettingsAttach(
    IsarCollection<dynamic> col, Id id, CalendarIntegrationSettings object) {
  object.id = id;
}

extension CalendarIntegrationSettingsQueryWhereSort on QueryBuilder<
    CalendarIntegrationSettings, CalendarIntegrationSettings, QWhere> {
  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CalendarIntegrationSettingsQueryWhere on QueryBuilder<
    CalendarIntegrationSettings, CalendarIntegrationSettings, QWhereClause> {
  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterWhereClause> idBetween(
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

extension CalendarIntegrationSettingsQueryFilter on QueryBuilder<
    CalendarIntegrationSettings,
    CalendarIntegrationSettings,
    QFilterCondition> {
  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> analyzeEventTitlesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analyzeEventTitles',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> autoSuggestOutfitsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoSuggestOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'casualKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'casualKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'casualKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'casualKeywords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'casualKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'casualKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      casualKeywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'casualKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      casualKeywordsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'casualKeywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'casualKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'casualKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casualKeywords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casualKeywords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casualKeywords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casualKeywords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casualKeywords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> casualKeywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casualKeywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> considerWeatherEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'considerWeather',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formalKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formalKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formalKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formalKeywords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formalKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formalKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      formalKeywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formalKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      formalKeywordsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formalKeywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formalKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formalKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formalKeywords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formalKeywords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formalKeywords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formalKeywords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formalKeywords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> formalKeywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formalKeywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gymKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gymKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gymKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gymKeywords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gymKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gymKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      gymKeywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gymKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      gymKeywordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gymKeywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gymKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gymKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gymKeywords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gymKeywords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gymKeywords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gymKeywords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gymKeywords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> gymKeywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gymKeywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> lastSyncAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> lastSyncAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> lastSyncAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> notificationHoursBeforeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationHoursBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> notificationHoursBeforeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationHoursBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> notificationHoursBeforeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationHoursBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> notificationHoursBeforeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationHoursBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partyKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partyKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partyKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partyKeywords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partyKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partyKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      partyKeywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partyKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      partyKeywordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partyKeywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partyKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partyKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partyKeywords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partyKeywords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partyKeywords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partyKeywords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partyKeywords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> partyKeywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partyKeywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> planningDaysAheadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planningDaysAhead',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> planningDaysAheadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'planningDaysAhead',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> planningDaysAheadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'planningDaysAhead',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> planningDaysAheadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'planningDaysAhead',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedCalendarId',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedCalendarId',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedCalendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedCalendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedCalendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedCalendarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedCalendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedCalendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      selectedCalendarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedCalendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      selectedCalendarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedCalendarId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedCalendarId',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedCalendarId',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedCalendarName',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedCalendarName',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedCalendarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedCalendarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedCalendarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedCalendarName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedCalendarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedCalendarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      selectedCalendarNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedCalendarName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      selectedCalendarNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedCalendarName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedCalendarName',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> selectedCalendarNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedCalendarName',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> sendNotificationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sendNotifications',
        value: value,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workKeywords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      workKeywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workKeywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
          QAfterFilterCondition>
      workKeywordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workKeywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workKeywords',
        value: '',
      ));
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workKeywords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workKeywords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workKeywords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workKeywords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workKeywords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterFilterCondition> workKeywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workKeywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CalendarIntegrationSettingsQueryObject on QueryBuilder<
    CalendarIntegrationSettings,
    CalendarIntegrationSettings,
    QFilterCondition> {}

extension CalendarIntegrationSettingsQueryLinks on QueryBuilder<
    CalendarIntegrationSettings,
    CalendarIntegrationSettings,
    QFilterCondition> {}

extension CalendarIntegrationSettingsQuerySortBy on QueryBuilder<
    CalendarIntegrationSettings, CalendarIntegrationSettings, QSortBy> {
  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByAnalyzeEventTitles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzeEventTitles', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByAnalyzeEventTitlesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzeEventTitles', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByAutoSuggestOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSuggestOutfits', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByAutoSuggestOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSuggestOutfits', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByConsiderWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByConsiderWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByNotificationHoursBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHoursBefore', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByNotificationHoursBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHoursBefore', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByPlanningDaysAhead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortByPlanningDaysAheadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortBySelectedCalendarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarId', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortBySelectedCalendarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarId', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortBySelectedCalendarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarName', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortBySelectedCalendarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarName', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortBySendNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendNotifications', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> sortBySendNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendNotifications', Sort.desc);
    });
  }
}

extension CalendarIntegrationSettingsQuerySortThenBy on QueryBuilder<
    CalendarIntegrationSettings, CalendarIntegrationSettings, QSortThenBy> {
  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByAnalyzeEventTitles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzeEventTitles', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByAnalyzeEventTitlesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzeEventTitles', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByAutoSuggestOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSuggestOutfits', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByAutoSuggestOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSuggestOutfits', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByConsiderWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByConsiderWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByNotificationHoursBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHoursBefore', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByNotificationHoursBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHoursBefore', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByPlanningDaysAhead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenByPlanningDaysAheadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenBySelectedCalendarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarId', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenBySelectedCalendarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarId', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenBySelectedCalendarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarName', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenBySelectedCalendarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCalendarName', Sort.desc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenBySendNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendNotifications', Sort.asc);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QAfterSortBy> thenBySendNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendNotifications', Sort.desc);
    });
  }
}

extension CalendarIntegrationSettingsQueryWhereDistinct on QueryBuilder<
    CalendarIntegrationSettings, CalendarIntegrationSettings, QDistinct> {
  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByAnalyzeEventTitles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'analyzeEventTitles');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByAutoSuggestOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoSuggestOutfits');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByCasualKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'casualKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByConsiderWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'considerWeather');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByFormalKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formalKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByGymKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gymKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByNotificationHoursBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationHoursBefore');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByPartyKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partyKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByPlanningDaysAhead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planningDaysAhead');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctBySelectedCalendarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedCalendarId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctBySelectedCalendarName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedCalendarName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctBySendNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sendNotifications');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, CalendarIntegrationSettings,
      QDistinct> distinctByWorkKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workKeywords');
    });
  }
}

extension CalendarIntegrationSettingsQueryProperty on QueryBuilder<
    CalendarIntegrationSettings, CalendarIntegrationSettings, QQueryProperty> {
  QueryBuilder<CalendarIntegrationSettings, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, bool, QQueryOperations>
      analyzeEventTitlesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'analyzeEventTitles');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, bool, QQueryOperations>
      autoSuggestOutfitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoSuggestOutfits');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, List<String>, QQueryOperations>
      casualKeywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'casualKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, bool, QQueryOperations>
      considerWeatherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'considerWeather');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, List<String>, QQueryOperations>
      formalKeywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formalKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, List<String>, QQueryOperations>
      gymKeywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gymKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, int, QQueryOperations>
      notificationHoursBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationHoursBefore');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, List<String>, QQueryOperations>
      partyKeywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partyKeywords');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, int, QQueryOperations>
      planningDaysAheadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planningDaysAhead');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, String?, QQueryOperations>
      selectedCalendarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedCalendarId');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, String?, QQueryOperations>
      selectedCalendarNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedCalendarName');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, bool, QQueryOperations>
      sendNotificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sendNotifications');
    });
  }

  QueryBuilder<CalendarIntegrationSettings, List<String>, QQueryOperations>
      workKeywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workKeywords');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlannedOutfitCollection on Isar {
  IsarCollection<PlannedOutfit> get plannedOutfits => this.collection();
}

const PlannedOutfitSchema = CollectionSchema(
  name: r'PlannedOutfit',
  id: -647195269403458734,
  properties: {
    r'comfortRating': PropertySchema(
      id: 0,
      name: r'comfortRating',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'eventId': PropertySchema(
      id: 2,
      name: r'eventId',
      type: IsarType.string,
    ),
    r'eventTitle': PropertySchema(
      id: 3,
      name: r'eventTitle',
      type: IsarType.string,
    ),
    r'feedback': PropertySchema(
      id: 4,
      name: r'feedback',
      type: IsarType.string,
    ),
    r'isWorn': PropertySchema(
      id: 5,
      name: r'isWorn',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 6,
      name: r'notes',
      type: IsarType.string,
    ),
    r'occasion': PropertySchema(
      id: 7,
      name: r'occasion',
      type: IsarType.string,
    ),
    r'outfitId': PropertySchema(
      id: 8,
      name: r'outfitId',
      type: IsarType.string,
    ),
    r'plannedDate': PropertySchema(
      id: 9,
      name: r'plannedDate',
      type: IsarType.dateTime,
    ),
    r'plannedTemperature': PropertySchema(
      id: 10,
      name: r'plannedTemperature',
      type: IsarType.double,
    ),
    r'plannedWeatherConditions': PropertySchema(
      id: 11,
      name: r'plannedWeatherConditions',
      type: IsarType.string,
    ),
    r'styleRating': PropertySchema(
      id: 12,
      name: r'styleRating',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'wornAt': PropertySchema(
      id: 14,
      name: r'wornAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _plannedOutfitEstimateSize,
  serialize: _plannedOutfitSerialize,
  deserialize: _plannedOutfitDeserialize,
  deserializeProp: _plannedOutfitDeserializeProp,
  idName: r'id',
  indexes: {
    r'plannedDate': IndexSchema(
      id: -6358396177190863895,
      name: r'plannedDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'plannedDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'outfitId': IndexSchema(
      id: 2088527764185479769,
      name: r'outfitId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'outfitId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _plannedOutfitGetId,
  getLinks: _plannedOutfitGetLinks,
  attach: _plannedOutfitAttach,
  version: '3.1.0+1',
);

int _plannedOutfitEstimateSize(
  PlannedOutfit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.eventId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.eventTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.feedback;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.occasion.length * 3;
  bytesCount += 3 + object.outfitId.length * 3;
  {
    final value = object.plannedWeatherConditions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _plannedOutfitSerialize(
  PlannedOutfit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.comfortRating);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.eventId);
  writer.writeString(offsets[3], object.eventTitle);
  writer.writeString(offsets[4], object.feedback);
  writer.writeBool(offsets[5], object.isWorn);
  writer.writeString(offsets[6], object.notes);
  writer.writeString(offsets[7], object.occasion);
  writer.writeString(offsets[8], object.outfitId);
  writer.writeDateTime(offsets[9], object.plannedDate);
  writer.writeDouble(offsets[10], object.plannedTemperature);
  writer.writeString(offsets[11], object.plannedWeatherConditions);
  writer.writeLong(offsets[12], object.styleRating);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeDateTime(offsets[14], object.wornAt);
}

PlannedOutfit _plannedOutfitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlannedOutfit();
  object.comfortRating = reader.readLongOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.eventId = reader.readStringOrNull(offsets[2]);
  object.eventTitle = reader.readStringOrNull(offsets[3]);
  object.feedback = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.isWorn = reader.readBool(offsets[5]);
  object.notes = reader.readStringOrNull(offsets[6]);
  object.occasion = reader.readString(offsets[7]);
  object.outfitId = reader.readString(offsets[8]);
  object.plannedDate = reader.readDateTime(offsets[9]);
  object.plannedTemperature = reader.readDoubleOrNull(offsets[10]);
  object.plannedWeatherConditions = reader.readStringOrNull(offsets[11]);
  object.styleRating = reader.readLongOrNull(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.wornAt = reader.readDateTimeOrNull(offsets[14]);
  return object;
}

P _plannedOutfitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plannedOutfitGetId(PlannedOutfit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plannedOutfitGetLinks(PlannedOutfit object) {
  return [];
}

void _plannedOutfitAttach(
    IsarCollection<dynamic> col, Id id, PlannedOutfit object) {
  object.id = id;
}

extension PlannedOutfitQueryWhereSort
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QWhere> {
  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhere> anyPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'plannedDate'),
      );
    });
  }
}

extension PlannedOutfitQueryWhere
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QWhereClause> {
  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause> idBetween(
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause>
      plannedDateEqualTo(DateTime plannedDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'plannedDate',
        value: [plannedDate],
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause>
      plannedDateNotEqualTo(DateTime plannedDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'plannedDate',
              lower: [],
              upper: [plannedDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'plannedDate',
              lower: [plannedDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'plannedDate',
              lower: [plannedDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'plannedDate',
              lower: [],
              upper: [plannedDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause>
      plannedDateGreaterThan(
    DateTime plannedDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'plannedDate',
        lower: [plannedDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause>
      plannedDateLessThan(
    DateTime plannedDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'plannedDate',
        lower: [],
        upper: [plannedDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause>
      plannedDateBetween(
    DateTime lowerPlannedDate,
    DateTime upperPlannedDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'plannedDate',
        lower: [lowerPlannedDate],
        includeLower: includeLower,
        upper: [upperPlannedDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause> outfitIdEqualTo(
      String outfitId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'outfitId',
        value: [outfitId],
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterWhereClause>
      outfitIdNotEqualTo(String outfitId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [],
              upper: [outfitId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [outfitId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [outfitId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [],
              upper: [outfitId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PlannedOutfitQueryFilter
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QFilterCondition> {
  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      comfortRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comfortRating',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      comfortRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comfortRating',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      comfortRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comfortRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      comfortRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comfortRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      comfortRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comfortRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      comfortRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comfortRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventId',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventId',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventTitle',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventTitle',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      eventTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      feedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      isWornEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWorn',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'occasion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'occasion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      occasionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outfitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outfitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      outfitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedTemperature',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedTemperature',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedTemperatureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedTemperatureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedTemperatureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedTemperatureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedWeatherConditions',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedWeatherConditions',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedWeatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedWeatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedWeatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedWeatherConditions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plannedWeatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plannedWeatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plannedWeatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plannedWeatherConditions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedWeatherConditions',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      plannedWeatherConditionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plannedWeatherConditions',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      styleRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'styleRating',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      styleRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'styleRating',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      styleRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'styleRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      styleRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'styleRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      styleRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'styleRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      styleRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'styleRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      wornAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wornAt',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      wornAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wornAt',
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      wornAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wornAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      wornAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wornAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      wornAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wornAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterFilterCondition>
      wornAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wornAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlannedOutfitQueryObject
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QFilterCondition> {}

extension PlannedOutfitQueryLinks
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QFilterCondition> {}

extension PlannedOutfitQuerySortBy
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QSortBy> {
  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByComfortRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comfortRating', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByComfortRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comfortRating', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByEventTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByEventTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByIsWorn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWorn', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByIsWornDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWorn', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByPlannedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByPlannedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedTemperature', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByPlannedTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedTemperature', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByPlannedWeatherConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedWeatherConditions', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByPlannedWeatherConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedWeatherConditions', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByStyleRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleRating', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByStyleRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleRating', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByWornAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> sortByWornAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.desc);
    });
  }
}

extension PlannedOutfitQuerySortThenBy
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QSortThenBy> {
  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByComfortRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comfortRating', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByComfortRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comfortRating', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventId', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByEventTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByEventTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventTitle', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByIsWorn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWorn', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByIsWornDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWorn', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByPlannedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByPlannedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedTemperature', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByPlannedTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedTemperature', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByPlannedWeatherConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedWeatherConditions', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByPlannedWeatherConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedWeatherConditions', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByStyleRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleRating', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByStyleRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleRating', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByWornAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QAfterSortBy> thenByWornAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.desc);
    });
  }
}

extension PlannedOutfitQueryWhereDistinct
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> {
  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct>
      distinctByComfortRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comfortRating');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByEventId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByEventTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByFeedback(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByIsWorn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWorn');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByOccasion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occasion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByOutfitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outfitId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct>
      distinctByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedDate');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct>
      distinctByPlannedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedTemperature');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct>
      distinctByPlannedWeatherConditions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedWeatherConditions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct>
      distinctByStyleRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'styleRating');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<PlannedOutfit, PlannedOutfit, QDistinct> distinctByWornAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wornAt');
    });
  }
}

extension PlannedOutfitQueryProperty
    on QueryBuilder<PlannedOutfit, PlannedOutfit, QQueryProperty> {
  QueryBuilder<PlannedOutfit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlannedOutfit, int?, QQueryOperations> comfortRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comfortRating');
    });
  }

  QueryBuilder<PlannedOutfit, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PlannedOutfit, String?, QQueryOperations> eventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventId');
    });
  }

  QueryBuilder<PlannedOutfit, String?, QQueryOperations> eventTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventTitle');
    });
  }

  QueryBuilder<PlannedOutfit, String?, QQueryOperations> feedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedback');
    });
  }

  QueryBuilder<PlannedOutfit, bool, QQueryOperations> isWornProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWorn');
    });
  }

  QueryBuilder<PlannedOutfit, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<PlannedOutfit, String, QQueryOperations> occasionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occasion');
    });
  }

  QueryBuilder<PlannedOutfit, String, QQueryOperations> outfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outfitId');
    });
  }

  QueryBuilder<PlannedOutfit, DateTime, QQueryOperations>
      plannedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedDate');
    });
  }

  QueryBuilder<PlannedOutfit, double?, QQueryOperations>
      plannedTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedTemperature');
    });
  }

  QueryBuilder<PlannedOutfit, String?, QQueryOperations>
      plannedWeatherConditionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedWeatherConditions');
    });
  }

  QueryBuilder<PlannedOutfit, int?, QQueryOperations> styleRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'styleRating');
    });
  }

  QueryBuilder<PlannedOutfit, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<PlannedOutfit, DateTime?, QQueryOperations> wornAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wornAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitCalendarEventCollection on Isar {
  IsarCollection<OutfitCalendarEvent> get outfitCalendarEvents =>
      this.collection();
}

const OutfitCalendarEventSchema = CollectionSchema(
  name: r'OutfitCalendarEvent',
  id: 5127008436735840347,
  properties: {
    r'alternativeOutfitId': PropertySchema(
      id: 0,
      name: r'alternativeOutfitId',
      type: IsarType.string,
    ),
    r'calendarEventId': PropertySchema(
      id: 1,
      name: r'calendarEventId',
      type: IsarType.string,
    ),
    r'calendarId': PropertySchema(
      id: 2,
      name: r'calendarId',
      type: IsarType.string,
    ),
    r'completedAt': PropertySchema(
      id: 3,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'detectedOccasion': PropertySchema(
      id: 6,
      name: r'detectedOccasion',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 7,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'eventCompleted': PropertySchema(
      id: 8,
      name: r'eventCompleted',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 9,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'location': PropertySchema(
      id: 10,
      name: r'location',
      type: IsarType.string,
    ),
    r'outfitConfirmed': PropertySchema(
      id: 11,
      name: r'outfitConfirmed',
      type: IsarType.bool,
    ),
    r'outfitConfirmedAt': PropertySchema(
      id: 12,
      name: r'outfitConfirmedAt',
      type: IsarType.dateTime,
    ),
    r'outfitWasAppropriate': PropertySchema(
      id: 13,
      name: r'outfitWasAppropriate',
      type: IsarType.bool,
    ),
    r'plannedOutfitId': PropertySchema(
      id: 14,
      name: r'plannedOutfitId',
      type: IsarType.string,
    ),
    r'postEventFeedback': PropertySchema(
      id: 15,
      name: r'postEventFeedback',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 16,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'suggestedDressCode': PropertySchema(
      id: 17,
      name: r'suggestedDressCode',
      type: IsarType.string,
    ),
    r'timeOfDay': PropertySchema(
      id: 18,
      name: r'timeOfDay',
      type: IsarType.string,
      enumMap: _OutfitCalendarEventtimeOfDayEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 19,
      name: r'title',
      type: IsarType.string,
    ),
    r'weatherCondition': PropertySchema(
      id: 20,
      name: r'weatherCondition',
      type: IsarType.string,
    ),
    r'weatherTags': PropertySchema(
      id: 21,
      name: r'weatherTags',
      type: IsarType.stringList,
    ),
    r'weatherTemperature': PropertySchema(
      id: 22,
      name: r'weatherTemperature',
      type: IsarType.double,
    )
  },
  estimateSize: _outfitCalendarEventEstimateSize,
  serialize: _outfitCalendarEventSerialize,
  deserialize: _outfitCalendarEventDeserialize,
  deserializeProp: _outfitCalendarEventDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _outfitCalendarEventGetId,
  getLinks: _outfitCalendarEventGetLinks,
  attach: _outfitCalendarEventAttach,
  version: '3.1.0+1',
);

int _outfitCalendarEventEstimateSize(
  OutfitCalendarEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.alternativeOutfitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.calendarEventId.length * 3;
  bytesCount += 3 + object.calendarId.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.detectedOccasion.length * 3;
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plannedOutfitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.postEventFeedback;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.suggestedDressCode.length * 3;
  bytesCount += 3 + object.timeOfDay.name.length * 3;
  bytesCount += 3 + object.title.length * 3;
  {
    final value = object.weatherCondition;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.weatherTags.length * 3;
  {
    for (var i = 0; i < object.weatherTags.length; i++) {
      final value = object.weatherTags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _outfitCalendarEventSerialize(
  OutfitCalendarEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alternativeOutfitId);
  writer.writeString(offsets[1], object.calendarEventId);
  writer.writeString(offsets[2], object.calendarId);
  writer.writeDateTime(offsets[3], object.completedAt);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.description);
  writer.writeString(offsets[6], object.detectedOccasion);
  writer.writeDateTime(offsets[7], object.endTime);
  writer.writeBool(offsets[8], object.eventCompleted);
  writer.writeDateTime(offsets[9], object.lastUpdated);
  writer.writeString(offsets[10], object.location);
  writer.writeBool(offsets[11], object.outfitConfirmed);
  writer.writeDateTime(offsets[12], object.outfitConfirmedAt);
  writer.writeBool(offsets[13], object.outfitWasAppropriate);
  writer.writeString(offsets[14], object.plannedOutfitId);
  writer.writeString(offsets[15], object.postEventFeedback);
  writer.writeDateTime(offsets[16], object.startTime);
  writer.writeString(offsets[17], object.suggestedDressCode);
  writer.writeString(offsets[18], object.timeOfDay.name);
  writer.writeString(offsets[19], object.title);
  writer.writeString(offsets[20], object.weatherCondition);
  writer.writeStringList(offsets[21], object.weatherTags);
  writer.writeDouble(offsets[22], object.weatherTemperature);
}

OutfitCalendarEvent _outfitCalendarEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitCalendarEvent();
  object.alternativeOutfitId = reader.readStringOrNull(offsets[0]);
  object.calendarEventId = reader.readString(offsets[1]);
  object.calendarId = reader.readString(offsets[2]);
  object.completedAt = reader.readDateTimeOrNull(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.detectedOccasion = reader.readString(offsets[6]);
  object.endTime = reader.readDateTime(offsets[7]);
  object.eventCompleted = reader.readBool(offsets[8]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[9]);
  object.location = reader.readStringOrNull(offsets[10]);
  object.outfitConfirmed = reader.readBool(offsets[11]);
  object.outfitConfirmedAt = reader.readDateTimeOrNull(offsets[12]);
  object.outfitWasAppropriate = reader.readBool(offsets[13]);
  object.plannedOutfitId = reader.readStringOrNull(offsets[14]);
  object.postEventFeedback = reader.readStringOrNull(offsets[15]);
  object.startTime = reader.readDateTime(offsets[16]);
  object.suggestedDressCode = reader.readString(offsets[17]);
  object.timeOfDay = _OutfitCalendarEventtimeOfDayValueEnumMap[
          reader.readStringOrNull(offsets[18])] ??
      TimeOfDay.morning;
  object.title = reader.readString(offsets[19]);
  object.weatherCondition = reader.readStringOrNull(offsets[20]);
  object.weatherTags = reader.readStringList(offsets[21]) ?? [];
  object.weatherTemperature = reader.readDoubleOrNull(offsets[22]);
  return object;
}

P _outfitCalendarEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (_OutfitCalendarEventtimeOfDayValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TimeOfDay.morning) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringList(offset) ?? []) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OutfitCalendarEventtimeOfDayEnumValueMap = {
  r'morning': r'morning',
  r'afternoon': r'afternoon',
  r'evening': r'evening',
};
const _OutfitCalendarEventtimeOfDayValueEnumMap = {
  r'morning': TimeOfDay.morning,
  r'afternoon': TimeOfDay.afternoon,
  r'evening': TimeOfDay.evening,
};

Id _outfitCalendarEventGetId(OutfitCalendarEvent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitCalendarEventGetLinks(
    OutfitCalendarEvent object) {
  return [];
}

void _outfitCalendarEventAttach(
    IsarCollection<dynamic> col, Id id, OutfitCalendarEvent object) {
  object.id = id;
}

extension OutfitCalendarEventQueryWhereSort
    on QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QWhere> {
  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OutfitCalendarEventQueryWhere
    on QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QWhereClause> {
  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterWhereClause>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterWhereClause>
      idBetween(
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

extension OutfitCalendarEventQueryFilter on QueryBuilder<OutfitCalendarEvent,
    OutfitCalendarEvent, QFilterCondition> {
  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternativeOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternativeOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeOutfitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeOutfitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      alternativeOutfitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calendarEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calendarEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calendarEventId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calendarEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calendarEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calendarEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calendarEventId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calendarEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calendarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calendarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calendarId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      calendarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calendarId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedOccasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detectedOccasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detectedOccasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detectedOccasion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detectedOccasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detectedOccasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detectedOccasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detectedOccasion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedOccasion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      detectedOccasionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detectedOccasion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      endTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      eventCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationEqualTo(
    String? value, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationLessThan(
    String? value, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
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

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitConfirmed',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'outfitConfirmedAt',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'outfitConfirmedAt',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitConfirmedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outfitConfirmedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outfitConfirmedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitConfirmedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outfitConfirmedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      outfitWasAppropriateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitWasAppropriate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedOutfitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plannedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plannedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plannedOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plannedOutfitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      plannedOutfitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plannedOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'postEventFeedback',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'postEventFeedback',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postEventFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postEventFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postEventFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postEventFeedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'postEventFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'postEventFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'postEventFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'postEventFeedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postEventFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      postEventFeedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'postEventFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedDressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestedDressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestedDressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestedDressCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestedDressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestedDressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestedDressCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestedDressCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedDressCode',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      suggestedDressCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestedDressCode',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayEqualTo(
    TimeOfDay value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayGreaterThan(
    TimeOfDay value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayLessThan(
    TimeOfDay value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayBetween(
    TimeOfDay lower,
    TimeOfDay upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeOfDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeOfDay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfDay',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      timeOfDayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeOfDay',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherCondition',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherCondition',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherCondition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherCondition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherConditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherTags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherTags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherTags',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherTags',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherTags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherTags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherTags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherTags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherTags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherTags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherTemperature',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherTemperature',
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTemperatureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTemperatureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTemperatureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterFilterCondition>
      weatherTemperatureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension OutfitCalendarEventQueryObject on QueryBuilder<OutfitCalendarEvent,
    OutfitCalendarEvent, QFilterCondition> {}

extension OutfitCalendarEventQueryLinks on QueryBuilder<OutfitCalendarEvent,
    OutfitCalendarEvent, QFilterCondition> {}

extension OutfitCalendarEventQuerySortBy
    on QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QSortBy> {
  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByAlternativeOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByAlternativeOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCalendarEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarEventId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCalendarEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarEventId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCalendarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCalendarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByDetectedOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedOccasion', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByDetectedOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedOccasion', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByEventCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompleted', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByEventCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompleted', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByOutfitConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmed', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByOutfitConfirmedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmed', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByOutfitConfirmedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByOutfitConfirmedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByOutfitWasAppropriate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitWasAppropriate', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByOutfitWasAppropriateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitWasAppropriate', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByPlannedOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByPlannedOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByPostEventFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEventFeedback', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByPostEventFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEventFeedback', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortBySuggestedDressCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDressCode', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortBySuggestedDressCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDressCode', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByTimeOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByTimeOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByWeatherCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByWeatherConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByWeatherTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherTemperature', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      sortByWeatherTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherTemperature', Sort.desc);
    });
  }
}

extension OutfitCalendarEventQuerySortThenBy
    on QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QSortThenBy> {
  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByAlternativeOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByAlternativeOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativeOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCalendarEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarEventId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCalendarEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarEventId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCalendarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCalendarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByDetectedOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedOccasion', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByDetectedOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedOccasion', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByEventCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompleted', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByEventCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompleted', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByOutfitConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmed', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByOutfitConfirmedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmed', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByOutfitConfirmedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByOutfitConfirmedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitConfirmedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByOutfitWasAppropriate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitWasAppropriate', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByOutfitWasAppropriateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitWasAppropriate', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByPlannedOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByPlannedOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByPostEventFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEventFeedback', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByPostEventFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEventFeedback', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenBySuggestedDressCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDressCode', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenBySuggestedDressCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDressCode', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByTimeOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByTimeOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfDay', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByWeatherCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByWeatherConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.desc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByWeatherTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherTemperature', Sort.asc);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QAfterSortBy>
      thenByWeatherTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherTemperature', Sort.desc);
    });
  }
}

extension OutfitCalendarEventQueryWhereDistinct
    on QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct> {
  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByAlternativeOutfitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternativeOutfitId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByCalendarEventId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calendarEventId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByCalendarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calendarId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByDetectedOccasion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detectedOccasion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByEventCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventCompleted');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByLocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByOutfitConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outfitConfirmed');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByOutfitConfirmedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outfitConfirmedAt');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByOutfitWasAppropriate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outfitWasAppropriate');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByPlannedOutfitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedOutfitId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByPostEventFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postEventFeedback',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctBySuggestedDressCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestedDressCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByTimeOfDay({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeOfDay', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByWeatherCondition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherCondition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByWeatherTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherTags');
    });
  }

  QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QDistinct>
      distinctByWeatherTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherTemperature');
    });
  }
}

extension OutfitCalendarEventQueryProperty
    on QueryBuilder<OutfitCalendarEvent, OutfitCalendarEvent, QQueryProperty> {
  QueryBuilder<OutfitCalendarEvent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String?, QQueryOperations>
      alternativeOutfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternativeOutfitId');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String, QQueryOperations>
      calendarEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calendarEventId');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String, QQueryOperations>
      calendarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calendarId');
    });
  }

  QueryBuilder<OutfitCalendarEvent, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<OutfitCalendarEvent, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String, QQueryOperations>
      detectedOccasionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detectedOccasion');
    });
  }

  QueryBuilder<OutfitCalendarEvent, DateTime, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<OutfitCalendarEvent, bool, QQueryOperations>
      eventCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventCompleted');
    });
  }

  QueryBuilder<OutfitCalendarEvent, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String?, QQueryOperations>
      locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<OutfitCalendarEvent, bool, QQueryOperations>
      outfitConfirmedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outfitConfirmed');
    });
  }

  QueryBuilder<OutfitCalendarEvent, DateTime?, QQueryOperations>
      outfitConfirmedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outfitConfirmedAt');
    });
  }

  QueryBuilder<OutfitCalendarEvent, bool, QQueryOperations>
      outfitWasAppropriateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outfitWasAppropriate');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String?, QQueryOperations>
      plannedOutfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedOutfitId');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String?, QQueryOperations>
      postEventFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postEventFeedback');
    });
  }

  QueryBuilder<OutfitCalendarEvent, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String, QQueryOperations>
      suggestedDressCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestedDressCode');
    });
  }

  QueryBuilder<OutfitCalendarEvent, TimeOfDay, QQueryOperations>
      timeOfDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeOfDay');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<OutfitCalendarEvent, String?, QQueryOperations>
      weatherConditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherCondition');
    });
  }

  QueryBuilder<OutfitCalendarEvent, List<String>, QQueryOperations>
      weatherTagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherTags');
    });
  }

  QueryBuilder<OutfitCalendarEvent, double?, QQueryOperations>
      weatherTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherTemperature');
    });
  }
}
