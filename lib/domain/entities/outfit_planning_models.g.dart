// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_planning_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitPlanCollection on Isar {
  IsarCollection<OutfitPlan> get outfitPlans => this.collection();
}

const OutfitPlanSchema = CollectionSchema(
  name: r'OutfitPlan',
  id: -4811924195953950261,
  properties: {
    r'alternativeOutfitIds': PropertySchema(
      id: 0,
      name: r'alternativeOutfitIds',
      type: IsarType.stringList,
    ),
    r'calendarEvents': PropertySchema(
      id: 1,
      name: r'calendarEvents',
      type: IsarType.stringList,
    ),
    r'confidenceScore': PropertySchema(
      id: 2,
      name: r'confidenceScore',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'expectedTemperature': PropertySchema(
      id: 4,
      name: r'expectedTemperature',
      type: IsarType.double,
    ),
    r'feedback': PropertySchema(
      id: 5,
      name: r'feedback',
      type: IsarType.string,
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
    r'primaryEventId': PropertySchema(
      id: 10,
      name: r'primaryEventId',
      type: IsarType.string,
    ),
    r'reminderSent': PropertySchema(
      id: 11,
      name: r'reminderSent',
      type: IsarType.bool,
    ),
    r'reminderSentAt': PropertySchema(
      id: 12,
      name: r'reminderSentAt',
      type: IsarType.dateTime,
    ),
    r'satisfactionRating': PropertySchema(
      id: 13,
      name: r'satisfactionRating',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.string,
      enumMap: _OutfitPlanstatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 16,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasAppropriate': PropertySchema(
      id: 17,
      name: r'wasAppropriate',
      type: IsarType.bool,
    ),
    r'weatherCondition': PropertySchema(
      id: 18,
      name: r'weatherCondition',
      type: IsarType.string,
    ),
    r'weatherTags': PropertySchema(
      id: 19,
      name: r'weatherTags',
      type: IsarType.stringList,
    ),
    r'wornAt': PropertySchema(
      id: 20,
      name: r'wornAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _outfitPlanEstimateSize,
  serialize: _outfitPlanSerialize,
  deserialize: _outfitPlanDeserialize,
  deserializeProp: _outfitPlanDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _outfitPlanGetId,
  getLinks: _outfitPlanGetLinks,
  attach: _outfitPlanAttach,
  version: '3.1.0+1',
);

int _outfitPlanEstimateSize(
  OutfitPlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alternativeOutfitIds.length * 3;
  {
    for (var i = 0; i < object.alternativeOutfitIds.length; i++) {
      final value = object.alternativeOutfitIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.calendarEvents.length * 3;
  {
    for (var i = 0; i < object.calendarEvents.length; i++) {
      final value = object.calendarEvents[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.feedback;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.occasion.length * 3;
  {
    final value = object.outfitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.primaryEventId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
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

void _outfitPlanSerialize(
  OutfitPlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.alternativeOutfitIds);
  writer.writeStringList(offsets[1], object.calendarEvents);
  writer.writeDouble(offsets[2], object.confidenceScore);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.expectedTemperature);
  writer.writeString(offsets[5], object.feedback);
  writer.writeString(offsets[6], object.notes);
  writer.writeString(offsets[7], object.occasion);
  writer.writeString(offsets[8], object.outfitId);
  writer.writeDateTime(offsets[9], object.plannedDate);
  writer.writeString(offsets[10], object.primaryEventId);
  writer.writeBool(offsets[11], object.reminderSent);
  writer.writeDateTime(offsets[12], object.reminderSentAt);
  writer.writeLong(offsets[13], object.satisfactionRating);
  writer.writeString(offsets[14], object.status.name);
  writer.writeDateTime(offsets[15], object.updatedAt);
  writer.writeString(offsets[16], object.userId);
  writer.writeBool(offsets[17], object.wasAppropriate);
  writer.writeString(offsets[18], object.weatherCondition);
  writer.writeStringList(offsets[19], object.weatherTags);
  writer.writeDateTime(offsets[20], object.wornAt);
}

OutfitPlan _outfitPlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitPlan();
  object.alternativeOutfitIds = reader.readStringList(offsets[0]) ?? [];
  object.calendarEvents = reader.readStringList(offsets[1]) ?? [];
  object.confidenceScore = reader.readDoubleOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.expectedTemperature = reader.readDoubleOrNull(offsets[4]);
  object.feedback = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.notes = reader.readString(offsets[6]);
  object.occasion = reader.readString(offsets[7]);
  object.outfitId = reader.readStringOrNull(offsets[8]);
  object.plannedDate = reader.readDateTime(offsets[9]);
  object.primaryEventId = reader.readStringOrNull(offsets[10]);
  object.reminderSent = reader.readBool(offsets[11]);
  object.reminderSentAt = reader.readDateTimeOrNull(offsets[12]);
  object.satisfactionRating = reader.readLongOrNull(offsets[13]);
  object.status =
      _OutfitPlanstatusValueEnumMap[reader.readStringOrNull(offsets[14])] ??
          PlanStatus.none;
  object.updatedAt = reader.readDateTime(offsets[15]);
  object.userId = reader.readString(offsets[16]);
  object.wasAppropriate = reader.readBool(offsets[17]);
  object.weatherCondition = reader.readStringOrNull(offsets[18]);
  object.weatherTags = reader.readStringList(offsets[19]) ?? [];
  object.wornAt = reader.readDateTimeOrNull(offsets[20]);
  return object;
}

P _outfitPlanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (_OutfitPlanstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          PlanStatus.none) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringList(offset) ?? []) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OutfitPlanstatusEnumValueMap = {
  r'none': r'none',
  r'suggested': r'suggested',
  r'planned': r'planned',
  r'autoScheduled': r'autoScheduled',
  r'confirmed': r'confirmed',
  r'completed': r'completed',
  r'skipped': r'skipped',
  r'cancelled': r'cancelled',
};
const _OutfitPlanstatusValueEnumMap = {
  r'none': PlanStatus.none,
  r'suggested': PlanStatus.suggested,
  r'planned': PlanStatus.planned,
  r'autoScheduled': PlanStatus.autoScheduled,
  r'confirmed': PlanStatus.confirmed,
  r'completed': PlanStatus.completed,
  r'skipped': PlanStatus.skipped,
  r'cancelled': PlanStatus.cancelled,
};

Id _outfitPlanGetId(OutfitPlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitPlanGetLinks(OutfitPlan object) {
  return [];
}

void _outfitPlanAttach(IsarCollection<dynamic> col, Id id, OutfitPlan object) {
  object.id = id;
}

extension OutfitPlanQueryWhereSort
    on QueryBuilder<OutfitPlan, OutfitPlan, QWhere> {
  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhere> anyPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'plannedDate'),
      );
    });
  }
}

extension OutfitPlanQueryWhere
    on QueryBuilder<OutfitPlan, OutfitPlan, QWhereClause> {
  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> idBetween(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> userIdNotEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> plannedDateEqualTo(
      DateTime plannedDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'plannedDate',
        value: [plannedDate],
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> plannedDateNotEqualTo(
      DateTime plannedDate) {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> plannedDateLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterWhereClause> plannedDateBetween(
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
}

extension OutfitPlanQueryFilter
    on QueryBuilder<OutfitPlan, OutfitPlan, QFilterCondition> {
  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeOutfitIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeOutfitIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeOutfitIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeOutfitIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeOutfitIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeOutfitIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeOutfitIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      alternativeOutfitIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeOutfitIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarEvents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calendarEvents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calendarEvents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calendarEvents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calendarEvents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calendarEvents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calendarEvents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calendarEvents',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarEvents',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calendarEvents',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calendarEvents',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calendarEvents',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calendarEvents',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calendarEvents',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calendarEvents',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      calendarEventsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calendarEvents',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      confidenceScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'confidenceScore',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      confidenceScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'confidenceScore',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      confidenceScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidenceScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      confidenceScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidenceScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      confidenceScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidenceScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      confidenceScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidenceScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      expectedTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedTemperature',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      expectedTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedTemperature',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      feedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackEqualTo(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackBetween(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackEndsWith(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> feedbackMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      feedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      feedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesEqualTo(
    String value, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesGreaterThan(
    String value, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesLessThan(
    String value, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> occasionEqualTo(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> occasionLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> occasionBetween(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> occasionEndsWith(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> occasionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> occasionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'occasion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      occasionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      occasionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'outfitId',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      outfitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'outfitId',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdEqualTo(
    String? value, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      outfitIdGreaterThan(
    String? value, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdLessThan(
    String? value, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdEndsWith(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> outfitIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outfitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      outfitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      outfitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      plannedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'primaryEventId',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'primaryEventId',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryEventId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'primaryEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'primaryEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'primaryEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'primaryEventId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      primaryEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'primaryEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderSent',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reminderSentAt',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reminderSentAt',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderSentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderSentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderSentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      reminderSentAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderSentAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      satisfactionRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'satisfactionRating',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      satisfactionRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'satisfactionRating',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      satisfactionRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'satisfactionRating',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      satisfactionRatingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'satisfactionRating',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      satisfactionRatingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'satisfactionRating',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      satisfactionRatingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'satisfactionRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusEqualTo(
    PlanStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusGreaterThan(
    PlanStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusLessThan(
    PlanStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusBetween(
    PlanStatus lower,
    PlanStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      wasAppropriateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasAppropriate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherConditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherCondition',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherConditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherCondition',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherConditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherConditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherCondition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherConditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherConditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherTagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherTagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherTags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherTagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherTags',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      weatherTagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherTags',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> wornAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wornAt',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition>
      wornAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wornAt',
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> wornAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wornAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> wornAtGreaterThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> wornAtLessThan(
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

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterFilterCondition> wornAtBetween(
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

extension OutfitPlanQueryObject
    on QueryBuilder<OutfitPlan, OutfitPlan, QFilterCondition> {}

extension OutfitPlanQueryLinks
    on QueryBuilder<OutfitPlan, OutfitPlan, QFilterCondition> {}

extension OutfitPlanQuerySortBy
    on QueryBuilder<OutfitPlan, OutfitPlan, QSortBy> {
  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByExpectedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByExpectedTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByPlannedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByPrimaryEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryEventId', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByPrimaryEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryEventId', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByReminderSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSent', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByReminderSentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSent', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByReminderSentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSentAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByReminderSentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSentAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortBySatisfactionRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortBySatisfactionRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByWasAppropriate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAppropriate', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByWasAppropriateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAppropriate', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByWeatherCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      sortByWeatherConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByWornAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> sortByWornAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.desc);
    });
  }
}

extension OutfitPlanQuerySortThenBy
    on QueryBuilder<OutfitPlan, OutfitPlan, QSortThenBy> {
  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByExpectedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByExpectedTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedTemperature', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByPlannedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByPrimaryEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryEventId', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByPrimaryEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryEventId', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByReminderSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSent', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByReminderSentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSent', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByReminderSentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSentAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByReminderSentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSentAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenBySatisfactionRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenBySatisfactionRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByWasAppropriate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAppropriate', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByWasAppropriateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAppropriate', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByWeatherCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy>
      thenByWeatherConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.desc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByWornAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QAfterSortBy> thenByWornAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wornAt', Sort.desc);
    });
  }
}

extension OutfitPlanQueryWhereDistinct
    on QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> {
  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct>
      distinctByAlternativeOutfitIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternativeOutfitIds');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByCalendarEvents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calendarEvents');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidenceScore');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct>
      distinctByExpectedTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedTemperature');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByFeedback(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByOccasion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occasion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByOutfitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outfitId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedDate');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByPrimaryEventId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryEventId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByReminderSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderSent');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByReminderSentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderSentAt');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct>
      distinctBySatisfactionRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'satisfactionRating');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByWasAppropriate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasAppropriate');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByWeatherCondition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherCondition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByWeatherTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherTags');
    });
  }

  QueryBuilder<OutfitPlan, OutfitPlan, QDistinct> distinctByWornAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wornAt');
    });
  }
}

extension OutfitPlanQueryProperty
    on QueryBuilder<OutfitPlan, OutfitPlan, QQueryProperty> {
  QueryBuilder<OutfitPlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitPlan, List<String>, QQueryOperations>
      alternativeOutfitIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternativeOutfitIds');
    });
  }

  QueryBuilder<OutfitPlan, List<String>, QQueryOperations>
      calendarEventsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calendarEvents');
    });
  }

  QueryBuilder<OutfitPlan, double?, QQueryOperations>
      confidenceScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidenceScore');
    });
  }

  QueryBuilder<OutfitPlan, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutfitPlan, double?, QQueryOperations>
      expectedTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedTemperature');
    });
  }

  QueryBuilder<OutfitPlan, String?, QQueryOperations> feedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedback');
    });
  }

  QueryBuilder<OutfitPlan, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<OutfitPlan, String, QQueryOperations> occasionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occasion');
    });
  }

  QueryBuilder<OutfitPlan, String?, QQueryOperations> outfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outfitId');
    });
  }

  QueryBuilder<OutfitPlan, DateTime, QQueryOperations> plannedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedDate');
    });
  }

  QueryBuilder<OutfitPlan, String?, QQueryOperations> primaryEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryEventId');
    });
  }

  QueryBuilder<OutfitPlan, bool, QQueryOperations> reminderSentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderSent');
    });
  }

  QueryBuilder<OutfitPlan, DateTime?, QQueryOperations>
      reminderSentAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderSentAt');
    });
  }

  QueryBuilder<OutfitPlan, int?, QQueryOperations>
      satisfactionRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'satisfactionRating');
    });
  }

  QueryBuilder<OutfitPlan, PlanStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<OutfitPlan, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<OutfitPlan, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<OutfitPlan, bool, QQueryOperations> wasAppropriateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasAppropriate');
    });
  }

  QueryBuilder<OutfitPlan, String?, QQueryOperations>
      weatherConditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherCondition');
    });
  }

  QueryBuilder<OutfitPlan, List<String>, QQueryOperations>
      weatherTagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherTags');
    });
  }

  QueryBuilder<OutfitPlan, DateTime?, QQueryOperations> wornAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wornAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeeklyOutfitScheduleCollection on Isar {
  IsarCollection<WeeklyOutfitSchedule> get weeklyOutfitSchedules =>
      this.collection();
}

const WeeklyOutfitScheduleSchema = CollectionSchema(
  name: r'WeeklyOutfitSchedule',
  id: 6678961868233948053,
  properties: {
    r'approvedAt': PropertySchema(
      id: 0,
      name: r'approvedAt',
      type: IsarType.dateTime,
    ),
    r'averageConfidence': PropertySchema(
      id: 1,
      name: r'averageConfidence',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dominantColors': PropertySchema(
      id: 3,
      name: r'dominantColors',
      type: IsarType.stringList,
    ),
    r'dominantStyles': PropertySchema(
      id: 4,
      name: r'dominantStyles',
      type: IsarType.stringList,
    ),
    r'isApproved': PropertySchema(
      id: 5,
      name: r'isApproved',
      type: IsarType.bool,
    ),
    r'isComplete': PropertySchema(
      id: 6,
      name: r'isComplete',
      type: IsarType.bool,
    ),
    r'theme': PropertySchema(
      id: 7,
      name: r'theme',
      type: IsarType.string,
    ),
    r'totalOutfits': PropertySchema(
      id: 8,
      name: r'totalOutfits',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 10,
      name: r'userId',
      type: IsarType.string,
    ),
    r'weekEnd': PropertySchema(
      id: 11,
      name: r'weekEnd',
      type: IsarType.dateTime,
    ),
    r'weekStart': PropertySchema(
      id: 12,
      name: r'weekStart',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _weeklyOutfitScheduleEstimateSize,
  serialize: _weeklyOutfitScheduleSerialize,
  deserialize: _weeklyOutfitScheduleDeserialize,
  deserializeProp: _weeklyOutfitScheduleDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'weekStart': IndexSchema(
      id: 6730028936290595099,
      name: r'weekStart',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'weekStart',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _weeklyOutfitScheduleGetId,
  getLinks: _weeklyOutfitScheduleGetLinks,
  attach: _weeklyOutfitScheduleAttach,
  version: '3.1.0+1',
);

int _weeklyOutfitScheduleEstimateSize(
  WeeklyOutfitSchedule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dominantColors.length * 3;
  {
    for (var i = 0; i < object.dominantColors.length; i++) {
      final value = object.dominantColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.dominantStyles.length * 3;
  {
    for (var i = 0; i < object.dominantStyles.length; i++) {
      final value = object.dominantStyles[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.theme;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _weeklyOutfitScheduleSerialize(
  WeeklyOutfitSchedule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.approvedAt);
  writer.writeDouble(offsets[1], object.averageConfidence);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeStringList(offsets[3], object.dominantColors);
  writer.writeStringList(offsets[4], object.dominantStyles);
  writer.writeBool(offsets[5], object.isApproved);
  writer.writeBool(offsets[6], object.isComplete);
  writer.writeString(offsets[7], object.theme);
  writer.writeLong(offsets[8], object.totalOutfits);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeString(offsets[10], object.userId);
  writer.writeDateTime(offsets[11], object.weekEnd);
  writer.writeDateTime(offsets[12], object.weekStart);
}

WeeklyOutfitSchedule _weeklyOutfitScheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeeklyOutfitSchedule();
  object.approvedAt = reader.readDateTimeOrNull(offsets[0]);
  object.averageConfidence = reader.readDouble(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.dominantColors = reader.readStringList(offsets[3]) ?? [];
  object.dominantStyles = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.isApproved = reader.readBool(offsets[5]);
  object.isComplete = reader.readBool(offsets[6]);
  object.theme = reader.readStringOrNull(offsets[7]);
  object.totalOutfits = reader.readLong(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.userId = reader.readString(offsets[10]);
  object.weekEnd = reader.readDateTime(offsets[11]);
  object.weekStart = reader.readDateTime(offsets[12]);
  return object;
}

P _weeklyOutfitScheduleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weeklyOutfitScheduleGetId(WeeklyOutfitSchedule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weeklyOutfitScheduleGetLinks(
    WeeklyOutfitSchedule object) {
  return [];
}

void _weeklyOutfitScheduleAttach(
    IsarCollection<dynamic> col, Id id, WeeklyOutfitSchedule object) {
  object.id = id;
}

extension WeeklyOutfitScheduleQueryWhereSort
    on QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QWhere> {
  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhere>
      anyWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'weekStart'),
      );
    });
  }
}

extension WeeklyOutfitScheduleQueryWhere
    on QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QWhereClause> {
  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      weekStartEqualTo(DateTime weekStart) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'weekStart',
        value: [weekStart],
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      weekStartNotEqualTo(DateTime weekStart) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [],
              upper: [weekStart],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [weekStart],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [weekStart],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekStart',
              lower: [],
              upper: [weekStart],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      weekStartGreaterThan(
    DateTime weekStart, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'weekStart',
        lower: [weekStart],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      weekStartLessThan(
    DateTime weekStart, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'weekStart',
        lower: [],
        upper: [weekStart],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterWhereClause>
      weekStartBetween(
    DateTime lowerWeekStart,
    DateTime upperWeekStart, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'weekStart',
        lower: [lowerWeekStart],
        includeLower: includeLower,
        upper: [upperWeekStart],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeeklyOutfitScheduleQueryFilter on QueryBuilder<WeeklyOutfitSchedule,
    WeeklyOutfitSchedule, QFilterCondition> {
  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> approvedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedAt',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> approvedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedAt',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> approvedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> approvedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> approvedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> approvedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> averageConfidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> averageConfidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> averageConfidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> averageConfidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageConfidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dominantColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dominantColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dominantColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dominantColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dominantColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      dominantColorsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dominantColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      dominantColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dominantColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantColors',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dominantColors',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dominantStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dominantStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dominantStyles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dominantStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dominantStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      dominantStylesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dominantStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      dominantStylesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dominantStyles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantStyles',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dominantStyles',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantStyles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantStyles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantStyles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantStyles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantStyles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> dominantStylesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dominantStyles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> isApprovedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isApproved',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> isCompleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'theme',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'theme',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      themeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      themeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'theme',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> themeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'theme',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> totalOutfitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> totalOutfitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> totalOutfitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> totalOutfitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalOutfits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekEndEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekEndGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekEndLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekEndBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekStartEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekStartGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekStartLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule,
      QAfterFilterCondition> weekStartBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeeklyOutfitScheduleQueryObject on QueryBuilder<WeeklyOutfitSchedule,
    WeeklyOutfitSchedule, QFilterCondition> {}

extension WeeklyOutfitScheduleQueryLinks on QueryBuilder<WeeklyOutfitSchedule,
    WeeklyOutfitSchedule, QFilterCondition> {}

extension WeeklyOutfitScheduleQuerySortBy
    on QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QSortBy> {
  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByApprovedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByAverageConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByAverageConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByIsApprovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByTotalOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByWeekEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekEnd', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByWeekEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekEnd', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      sortByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension WeeklyOutfitScheduleQuerySortThenBy
    on QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QSortThenBy> {
  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByApprovedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByAverageConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByAverageConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByIsApprovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isApproved', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByTotalOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByWeekEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekEnd', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByWeekEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekEnd', Sort.desc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QAfterSortBy>
      thenByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension WeeklyOutfitScheduleQueryWhereDistinct
    on QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct> {
  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedAt');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByAverageConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageConfidence');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByDominantColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dominantColors');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByDominantStyles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dominantStyles');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByIsApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isApproved');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isComplete');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByTheme({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalOutfits');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByWeekEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekEnd');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, WeeklyOutfitSchedule, QDistinct>
      distinctByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekStart');
    });
  }
}

extension WeeklyOutfitScheduleQueryProperty on QueryBuilder<
    WeeklyOutfitSchedule, WeeklyOutfitSchedule, QQueryProperty> {
  QueryBuilder<WeeklyOutfitSchedule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, DateTime?, QQueryOperations>
      approvedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedAt');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, double, QQueryOperations>
      averageConfidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageConfidence');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, List<String>, QQueryOperations>
      dominantColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dominantColors');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, List<String>, QQueryOperations>
      dominantStylesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dominantStyles');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, bool, QQueryOperations>
      isApprovedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isApproved');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, bool, QQueryOperations>
      isCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isComplete');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, String?, QQueryOperations>
      themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, int, QQueryOperations>
      totalOutfitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalOutfits');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, DateTime, QQueryOperations>
      weekEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekEnd');
    });
  }

  QueryBuilder<WeeklyOutfitSchedule, DateTime, QQueryOperations>
      weekStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekStart');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitReminderCollection on Isar {
  IsarCollection<OutfitReminder> get outfitReminders => this.collection();
}

const OutfitReminderSchema = CollectionSchema(
  name: r'OutfitReminder',
  id: -4628313894115422789,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isRead': PropertySchema(
      id: 1,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'isRecurring': PropertySchema(
      id: 2,
      name: r'isRecurring',
      type: IsarType.bool,
    ),
    r'isSent': PropertySchema(
      id: 3,
      name: r'isSent',
      type: IsarType.bool,
    ),
    r'message': PropertySchema(
      id: 4,
      name: r'message',
      type: IsarType.string,
    ),
    r'readAt': PropertySchema(
      id: 5,
      name: r'readAt',
      type: IsarType.dateTime,
    ),
    r'recurrencePattern': PropertySchema(
      id: 6,
      name: r'recurrencePattern',
      type: IsarType.string,
    ),
    r'responseAt': PropertySchema(
      id: 7,
      name: r'responseAt',
      type: IsarType.dateTime,
    ),
    r'scheduledTime': PropertySchema(
      id: 8,
      name: r'scheduledTime',
      type: IsarType.dateTime,
    ),
    r'sentAt': PropertySchema(
      id: 9,
      name: r'sentAt',
      type: IsarType.dateTime,
    ),
    r'targetDate': PropertySchema(
      id: 10,
      name: r'targetDate',
      type: IsarType.dateTime,
    ),
    r'targetOutfitId': PropertySchema(
      id: 11,
      name: r'targetOutfitId',
      type: IsarType.string,
    ),
    r'targetPlanId': PropertySchema(
      id: 12,
      name: r'targetPlanId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 13,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 14,
      name: r'type',
      type: IsarType.string,
      enumMap: _OutfitRemindertypeEnumValueMap,
    ),
    r'userId': PropertySchema(
      id: 15,
      name: r'userId',
      type: IsarType.string,
    ),
    r'userResponse': PropertySchema(
      id: 16,
      name: r'userResponse',
      type: IsarType.string,
    )
  },
  estimateSize: _outfitReminderEstimateSize,
  serialize: _outfitReminderSerialize,
  deserialize: _outfitReminderDeserialize,
  deserializeProp: _outfitReminderDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'scheduledTime': IndexSchema(
      id: 4528483578431344364,
      name: r'scheduledTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scheduledTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _outfitReminderGetId,
  getLinks: _outfitReminderGetLinks,
  attach: _outfitReminderAttach,
  version: '3.1.0+1',
);

int _outfitReminderEstimateSize(
  OutfitReminder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.message.length * 3;
  {
    final value = object.recurrencePattern;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.targetOutfitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.targetPlanId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  {
    final value = object.userResponse;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _outfitReminderSerialize(
  OutfitReminder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeBool(offsets[1], object.isRead);
  writer.writeBool(offsets[2], object.isRecurring);
  writer.writeBool(offsets[3], object.isSent);
  writer.writeString(offsets[4], object.message);
  writer.writeDateTime(offsets[5], object.readAt);
  writer.writeString(offsets[6], object.recurrencePattern);
  writer.writeDateTime(offsets[7], object.responseAt);
  writer.writeDateTime(offsets[8], object.scheduledTime);
  writer.writeDateTime(offsets[9], object.sentAt);
  writer.writeDateTime(offsets[10], object.targetDate);
  writer.writeString(offsets[11], object.targetOutfitId);
  writer.writeString(offsets[12], object.targetPlanId);
  writer.writeString(offsets[13], object.title);
  writer.writeString(offsets[14], object.type.name);
  writer.writeString(offsets[15], object.userId);
  writer.writeString(offsets[16], object.userResponse);
}

OutfitReminder _outfitReminderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitReminder();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isRead = reader.readBool(offsets[1]);
  object.isRecurring = reader.readBool(offsets[2]);
  object.isSent = reader.readBool(offsets[3]);
  object.message = reader.readString(offsets[4]);
  object.readAt = reader.readDateTimeOrNull(offsets[5]);
  object.recurrencePattern = reader.readStringOrNull(offsets[6]);
  object.responseAt = reader.readDateTimeOrNull(offsets[7]);
  object.scheduledTime = reader.readDateTime(offsets[8]);
  object.sentAt = reader.readDateTimeOrNull(offsets[9]);
  object.targetDate = reader.readDateTimeOrNull(offsets[10]);
  object.targetOutfitId = reader.readStringOrNull(offsets[11]);
  object.targetPlanId = reader.readStringOrNull(offsets[12]);
  object.title = reader.readString(offsets[13]);
  object.type =
      _OutfitRemindertypeValueEnumMap[reader.readStringOrNull(offsets[14])] ??
          ReminderType.planOutfit;
  object.userId = reader.readString(offsets[15]);
  object.userResponse = reader.readStringOrNull(offsets[16]);
  return object;
}

P _outfitReminderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (_OutfitRemindertypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ReminderType.planOutfit) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OutfitRemindertypeEnumValueMap = {
  r'planOutfit': r'planOutfit',
  r'weatherUpdate': r'weatherUpdate',
  r'occasionReminder': r'occasionReminder',
  r'laundryReminder': r'laundryReminder',
  r'seasonalUpdate': r'seasonalUpdate',
};
const _OutfitRemindertypeValueEnumMap = {
  r'planOutfit': ReminderType.planOutfit,
  r'weatherUpdate': ReminderType.weatherUpdate,
  r'occasionReminder': ReminderType.occasionReminder,
  r'laundryReminder': ReminderType.laundryReminder,
  r'seasonalUpdate': ReminderType.seasonalUpdate,
};

Id _outfitReminderGetId(OutfitReminder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitReminderGetLinks(OutfitReminder object) {
  return [];
}

void _outfitReminderAttach(
    IsarCollection<dynamic> col, Id id, OutfitReminder object) {
  object.id = id;
}

extension OutfitReminderQueryWhereSort
    on QueryBuilder<OutfitReminder, OutfitReminder, QWhere> {
  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhere> anyScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scheduledTime'),
      );
    });
  }
}

extension OutfitReminderQueryWhere
    on QueryBuilder<OutfitReminder, OutfitReminder, QWhereClause> {
  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause> idBetween(
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause>
      scheduledTimeEqualTo(DateTime scheduledTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scheduledTime',
        value: [scheduledTime],
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause>
      scheduledTimeNotEqualTo(DateTime scheduledTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [],
              upper: [scheduledTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [scheduledTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [scheduledTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledTime',
              lower: [],
              upper: [scheduledTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause>
      scheduledTimeGreaterThan(
    DateTime scheduledTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledTime',
        lower: [scheduledTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause>
      scheduledTimeLessThan(
    DateTime scheduledTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledTime',
        lower: [],
        upper: [scheduledTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterWhereClause>
      scheduledTimeBetween(
    DateTime lowerScheduledTime,
    DateTime upperScheduledTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledTime',
        lower: [lowerScheduledTime],
        includeLower: includeLower,
        upper: [upperScheduledTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OutfitReminderQueryFilter
    on QueryBuilder<OutfitReminder, OutfitReminder, QFilterCondition> {
  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      isReadEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      isRecurringEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRecurring',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      isSentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSent',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      readAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'readAt',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      readAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'readAt',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      readAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      readAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      readAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      readAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurrencePattern',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurrencePattern',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrencePattern',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurrencePattern',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePattern',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      recurrencePatternIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurrencePattern',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      responseAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'responseAt',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      responseAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'responseAt',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      responseAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      responseAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'responseAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      responseAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'responseAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      responseAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'responseAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      scheduledTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      scheduledTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      scheduledTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      scheduledTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      sentAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sentAt',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      sentAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sentAt',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      sentAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      sentAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      sentAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sentAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      sentAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sentAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetDate',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetDate',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetOutfitId',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetOutfitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetOutfitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetOutfitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetOutfitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetOutfitId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetPlanId',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetPlanId',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPlanId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetPlanId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetPlanId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPlanId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      targetPlanIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetPlanId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
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

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeEqualTo(
    ReminderType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeGreaterThan(
    ReminderType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeLessThan(
    ReminderType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeBetween(
    ReminderType lower,
    ReminderType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userResponse',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userResponse',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userResponse',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userResponse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userResponse',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userResponse',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterFilterCondition>
      userResponseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userResponse',
        value: '',
      ));
    });
  }
}

extension OutfitReminderQueryObject
    on QueryBuilder<OutfitReminder, OutfitReminder, QFilterCondition> {}

extension OutfitReminderQueryLinks
    on QueryBuilder<OutfitReminder, OutfitReminder, QFilterCondition> {}

extension OutfitReminderQuerySortBy
    on QueryBuilder<OutfitReminder, OutfitReminder, QSortBy> {
  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByIsSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByIsSentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByRecurrencePatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByResponseAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByResponseAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByScheduledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByTargetDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByTargetDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByTargetOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByTargetOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByTargetPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPlanId', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByTargetPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPlanId', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByUserResponse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userResponse', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      sortByUserResponseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userResponse', Sort.desc);
    });
  }
}

extension OutfitReminderQuerySortThenBy
    on QueryBuilder<OutfitReminder, OutfitReminder, QSortThenBy> {
  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByIsSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByIsSentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSent', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByRecurrencePatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByResponseAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByResponseAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByScheduledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledTime', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenBySentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sentAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByTargetDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByTargetDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByTargetOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByTargetOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByTargetPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPlanId', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByTargetPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPlanId', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByUserResponse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userResponse', Sort.asc);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QAfterSortBy>
      thenByUserResponseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userResponse', Sort.desc);
    });
  }
}

extension OutfitReminderQueryWhereDistinct
    on QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> {
  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRecurring');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByIsSent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSent');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readAt');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByRecurrencePattern({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrencePattern',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByResponseAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseAt');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByScheduledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledTime');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctBySentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sentAt');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByTargetDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetDate');
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByTargetOutfitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetOutfitId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByTargetPlanId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPlanId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitReminder, OutfitReminder, QDistinct>
      distinctByUserResponse({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userResponse', caseSensitive: caseSensitive);
    });
  }
}

extension OutfitReminderQueryProperty
    on QueryBuilder<OutfitReminder, OutfitReminder, QQueryProperty> {
  QueryBuilder<OutfitReminder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitReminder, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutfitReminder, bool, QQueryOperations> isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<OutfitReminder, bool, QQueryOperations> isRecurringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRecurring');
    });
  }

  QueryBuilder<OutfitReminder, bool, QQueryOperations> isSentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSent');
    });
  }

  QueryBuilder<OutfitReminder, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<OutfitReminder, DateTime?, QQueryOperations> readAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readAt');
    });
  }

  QueryBuilder<OutfitReminder, String?, QQueryOperations>
      recurrencePatternProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrencePattern');
    });
  }

  QueryBuilder<OutfitReminder, DateTime?, QQueryOperations>
      responseAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseAt');
    });
  }

  QueryBuilder<OutfitReminder, DateTime, QQueryOperations>
      scheduledTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledTime');
    });
  }

  QueryBuilder<OutfitReminder, DateTime?, QQueryOperations> sentAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sentAt');
    });
  }

  QueryBuilder<OutfitReminder, DateTime?, QQueryOperations>
      targetDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetDate');
    });
  }

  QueryBuilder<OutfitReminder, String?, QQueryOperations>
      targetOutfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetOutfitId');
    });
  }

  QueryBuilder<OutfitReminder, String?, QQueryOperations>
      targetPlanIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPlanId');
    });
  }

  QueryBuilder<OutfitReminder, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<OutfitReminder, ReminderType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<OutfitReminder, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<OutfitReminder, String?, QQueryOperations>
      userResponseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userResponse');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitTemplateCollection on Isar {
  IsarCollection<OutfitTemplate> get outfitTemplates => this.collection();
}

const OutfitTemplateSchema = CollectionSchema(
  name: r'OutfitTemplate',
  id: -3211116480809353590,
  properties: {
    r'allowedColors': PropertySchema(
      id: 0,
      name: r'allowedColors',
      type: IsarType.stringList,
    ),
    r'averageRating': PropertySchema(
      id: 1,
      name: r'averageRating',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'forbiddenColors': PropertySchema(
      id: 4,
      name: r'forbiddenColors',
      type: IsarType.stringList,
    ),
    r'lastUsed': PropertySchema(
      id: 5,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'occasions': PropertySchema(
      id: 7,
      name: r'occasions',
      type: IsarType.stringList,
    ),
    r'optionalCategories': PropertySchema(
      id: 8,
      name: r'optionalCategories',
      type: IsarType.stringList,
    ),
    r'requiredCategories': PropertySchema(
      id: 9,
      name: r'requiredCategories',
      type: IsarType.stringList,
    ),
    r'seasons': PropertySchema(
      id: 10,
      name: r'seasons',
      type: IsarType.stringList,
      enumMap: _OutfitTemplateseasonsEnumValueMap,
    ),
    r'timesUsed': PropertySchema(
      id: 11,
      name: r'timesUsed',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 12,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _outfitTemplateEstimateSize,
  serialize: _outfitTemplateSerialize,
  deserialize: _outfitTemplateDeserialize,
  deserializeProp: _outfitTemplateDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _outfitTemplateGetId,
  getLinks: _outfitTemplateGetLinks,
  attach: _outfitTemplateAttach,
  version: '3.1.0+1',
);

int _outfitTemplateEstimateSize(
  OutfitTemplate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.allowedColors.length * 3;
  {
    for (var i = 0; i < object.allowedColors.length; i++) {
      final value = object.allowedColors[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.forbiddenColors.length * 3;
  {
    for (var i = 0; i < object.forbiddenColors.length; i++) {
      final value = object.forbiddenColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.occasions.length * 3;
  {
    for (var i = 0; i < object.occasions.length; i++) {
      final value = object.occasions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.optionalCategories.length * 3;
  {
    for (var i = 0; i < object.optionalCategories.length; i++) {
      final value = object.optionalCategories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.requiredCategories.length * 3;
  {
    for (var i = 0; i < object.requiredCategories.length; i++) {
      final value = object.requiredCategories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.seasons.length * 3;
  {
    for (var i = 0; i < object.seasons.length; i++) {
      final value = object.seasons[i];
      bytesCount += value.name.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _outfitTemplateSerialize(
  OutfitTemplate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.allowedColors);
  writer.writeDouble(offsets[1], object.averageRating);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.description);
  writer.writeStringList(offsets[4], object.forbiddenColors);
  writer.writeDateTime(offsets[5], object.lastUsed);
  writer.writeString(offsets[6], object.name);
  writer.writeStringList(offsets[7], object.occasions);
  writer.writeStringList(offsets[8], object.optionalCategories);
  writer.writeStringList(offsets[9], object.requiredCategories);
  writer.writeStringList(
      offsets[10], object.seasons.map((e) => e.name).toList());
  writer.writeLong(offsets[11], object.timesUsed);
  writer.writeString(offsets[12], object.userId);
}

OutfitTemplate _outfitTemplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitTemplate();
  object.allowedColors = reader.readStringList(offsets[0]) ?? [];
  object.averageRating = reader.readDouble(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.forbiddenColors = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.lastUsed = reader.readDateTimeOrNull(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.occasions = reader.readStringList(offsets[7]) ?? [];
  object.optionalCategories = reader.readStringList(offsets[8]) ?? [];
  object.requiredCategories = reader.readStringList(offsets[9]) ?? [];
  object.seasons = reader
          .readStringList(offsets[10])
          ?.map((e) => _OutfitTemplateseasonsValueEnumMap[e] ?? Season.spring)
          .toList() ??
      [];
  object.timesUsed = reader.readLong(offsets[11]);
  object.userId = reader.readString(offsets[12]);
  return object;
}

P _outfitTemplateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader
              .readStringList(offset)
              ?.map(
                  (e) => _OutfitTemplateseasonsValueEnumMap[e] ?? Season.spring)
              .toList() ??
          []) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OutfitTemplateseasonsEnumValueMap = {
  r'spring': r'spring',
  r'summer': r'summer',
  r'autumn': r'autumn',
  r'winter': r'winter',
  r'allSeason': r'allSeason',
};
const _OutfitTemplateseasonsValueEnumMap = {
  r'spring': Season.spring,
  r'summer': Season.summer,
  r'autumn': Season.autumn,
  r'winter': Season.winter,
  r'allSeason': Season.allSeason,
};

Id _outfitTemplateGetId(OutfitTemplate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitTemplateGetLinks(OutfitTemplate object) {
  return [];
}

void _outfitTemplateAttach(
    IsarCollection<dynamic> col, Id id, OutfitTemplate object) {
  object.id = id;
}

extension OutfitTemplateQueryWhereSort
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QWhere> {
  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OutfitTemplateQueryWhere
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QWhereClause> {
  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause> idBetween(
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension OutfitTemplateQueryFilter
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QFilterCondition> {
  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowedColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowedColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      allowedColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      averageRatingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      averageRatingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      averageRatingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      averageRatingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'forbiddenColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'forbiddenColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'forbiddenColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'forbiddenColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'forbiddenColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'forbiddenColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'forbiddenColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'forbiddenColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'forbiddenColors',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'forbiddenColors',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forbiddenColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forbiddenColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forbiddenColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forbiddenColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forbiddenColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      forbiddenColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forbiddenColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      lastUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      lastUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      lastUsedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
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

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'occasions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'occasions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasions',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'occasions',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'occasions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'occasions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'occasions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'occasions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'occasions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      occasionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'occasions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionalCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionalCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionalCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionalCategories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'optionalCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'optionalCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'optionalCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'optionalCategories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionalCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'optionalCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionalCategories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionalCategories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionalCategories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionalCategories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionalCategories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      optionalCategoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'optionalCategories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requiredCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requiredCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requiredCategories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'requiredCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'requiredCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'requiredCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'requiredCategories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'requiredCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredCategories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredCategories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredCategories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredCategories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredCategories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      requiredCategoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredCategories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementEqualTo(
    Season value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementGreaterThan(
    Season value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementLessThan(
    Season value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementBetween(
    Season lower,
    Season upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seasons',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seasons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seasons',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seasons',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seasons',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'seasons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'seasons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'seasons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'seasons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'seasons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      seasonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'seasons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      timesUsedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      timesUsedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      timesUsedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      timesUsedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension OutfitTemplateQueryObject
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QFilterCondition> {}

extension OutfitTemplateQueryLinks
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QFilterCondition> {}

extension OutfitTemplateQuerySortBy
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QSortBy> {
  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByAverageRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByAverageRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> sortByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByTimesUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OutfitTemplateQuerySortThenBy
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QSortThenBy> {
  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByAverageRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByAverageRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageRating', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByTimesUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.desc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OutfitTemplateQueryWhereDistinct
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct> {
  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByAllowedColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowedColors');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByAverageRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageRating');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByForbiddenColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forbiddenColors');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct> distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByOccasions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occasions');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByOptionalCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'optionalCategories');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByRequiredCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiredCategories');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct> distinctBySeasons() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seasons');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct>
      distinctByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesUsed');
    });
  }

  QueryBuilder<OutfitTemplate, OutfitTemplate, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension OutfitTemplateQueryProperty
    on QueryBuilder<OutfitTemplate, OutfitTemplate, QQueryProperty> {
  QueryBuilder<OutfitTemplate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitTemplate, List<String>, QQueryOperations>
      allowedColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowedColors');
    });
  }

  QueryBuilder<OutfitTemplate, double, QQueryOperations>
      averageRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageRating');
    });
  }

  QueryBuilder<OutfitTemplate, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutfitTemplate, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<OutfitTemplate, List<String>, QQueryOperations>
      forbiddenColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forbiddenColors');
    });
  }

  QueryBuilder<OutfitTemplate, DateTime?, QQueryOperations> lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<OutfitTemplate, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<OutfitTemplate, List<String>, QQueryOperations>
      occasionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occasions');
    });
  }

  QueryBuilder<OutfitTemplate, List<String>, QQueryOperations>
      optionalCategoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'optionalCategories');
    });
  }

  QueryBuilder<OutfitTemplate, List<String>, QQueryOperations>
      requiredCategoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiredCategories');
    });
  }

  QueryBuilder<OutfitTemplate, List<Season>, QQueryOperations>
      seasonsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seasons');
    });
  }

  QueryBuilder<OutfitTemplate, int, QQueryOperations> timesUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesUsed');
    });
  }

  QueryBuilder<OutfitTemplate, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSeasonalWardrobeCollection on Isar {
  IsarCollection<SeasonalWardrobe> get seasonalWardrobes => this.collection();
}

const SeasonalWardrobeSchema = CollectionSchema(
  name: r'SeasonalWardrobe',
  id: -2928634153394813521,
  properties: {
    r'activeItemIds': PropertySchema(
      id: 0,
      name: r'activeItemIds',
      type: IsarType.stringList,
    ),
    r'colorPalette': PropertySchema(
      id: 1,
      name: r'colorPalette',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'goals': PropertySchema(
      id: 3,
      name: r'goals',
      type: IsarType.stringList,
    ),
    r'leastWornItems': PropertySchema(
      id: 4,
      name: r'leastWornItems',
      type: IsarType.stringList,
    ),
    r'mostWornItems': PropertySchema(
      id: 5,
      name: r'mostWornItems',
      type: IsarType.stringList,
    ),
    r'neededItems': PropertySchema(
      id: 6,
      name: r'neededItems',
      type: IsarType.stringList,
    ),
    r'plannedOutfitIds': PropertySchema(
      id: 7,
      name: r'plannedOutfitIds',
      type: IsarType.stringList,
    ),
    r'season': PropertySchema(
      id: 8,
      name: r'season',
      type: IsarType.string,
      enumMap: _SeasonalWardrobeseasonEnumValueMap,
    ),
    r'seasonalTheme': PropertySchema(
      id: 9,
      name: r'seasonalTheme',
      type: IsarType.string,
    ),
    r'storedItemIds': PropertySchema(
      id: 10,
      name: r'storedItemIds',
      type: IsarType.stringList,
    ),
    r'totalOutfits': PropertySchema(
      id: 11,
      name: r'totalOutfits',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 13,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wishlistItems': PropertySchema(
      id: 14,
      name: r'wishlistItems',
      type: IsarType.stringList,
    ),
    r'year': PropertySchema(
      id: 15,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _seasonalWardrobeEstimateSize,
  serialize: _seasonalWardrobeSerialize,
  deserialize: _seasonalWardrobeDeserialize,
  deserializeProp: _seasonalWardrobeDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _seasonalWardrobeGetId,
  getLinks: _seasonalWardrobeGetLinks,
  attach: _seasonalWardrobeAttach,
  version: '3.1.0+1',
);

int _seasonalWardrobeEstimateSize(
  SeasonalWardrobe object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeItemIds.length * 3;
  {
    for (var i = 0; i < object.activeItemIds.length; i++) {
      final value = object.activeItemIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.colorPalette.length * 3;
  {
    for (var i = 0; i < object.colorPalette.length; i++) {
      final value = object.colorPalette[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.goals.length * 3;
  {
    for (var i = 0; i < object.goals.length; i++) {
      final value = object.goals[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.leastWornItems.length * 3;
  {
    for (var i = 0; i < object.leastWornItems.length; i++) {
      final value = object.leastWornItems[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.mostWornItems.length * 3;
  {
    for (var i = 0; i < object.mostWornItems.length; i++) {
      final value = object.mostWornItems[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.neededItems.length * 3;
  {
    for (var i = 0; i < object.neededItems.length; i++) {
      final value = object.neededItems[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.plannedOutfitIds.length * 3;
  {
    for (var i = 0; i < object.plannedOutfitIds.length; i++) {
      final value = object.plannedOutfitIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.season.name.length * 3;
  {
    final value = object.seasonalTheme;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.storedItemIds.length * 3;
  {
    for (var i = 0; i < object.storedItemIds.length; i++) {
      final value = object.storedItemIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.wishlistItems.length * 3;
  {
    for (var i = 0; i < object.wishlistItems.length; i++) {
      final value = object.wishlistItems[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _seasonalWardrobeSerialize(
  SeasonalWardrobe object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.activeItemIds);
  writer.writeStringList(offsets[1], object.colorPalette);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeStringList(offsets[3], object.goals);
  writer.writeStringList(offsets[4], object.leastWornItems);
  writer.writeStringList(offsets[5], object.mostWornItems);
  writer.writeStringList(offsets[6], object.neededItems);
  writer.writeStringList(offsets[7], object.plannedOutfitIds);
  writer.writeString(offsets[8], object.season.name);
  writer.writeString(offsets[9], object.seasonalTheme);
  writer.writeStringList(offsets[10], object.storedItemIds);
  writer.writeLong(offsets[11], object.totalOutfits);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.userId);
  writer.writeStringList(offsets[14], object.wishlistItems);
  writer.writeLong(offsets[15], object.year);
}

SeasonalWardrobe _seasonalWardrobeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SeasonalWardrobe();
  object.activeItemIds = reader.readStringList(offsets[0]) ?? [];
  object.colorPalette = reader.readStringList(offsets[1]) ?? [];
  object.createdAt = reader.readDateTime(offsets[2]);
  object.goals = reader.readStringList(offsets[3]) ?? [];
  object.id = id;
  object.leastWornItems = reader.readStringList(offsets[4]) ?? [];
  object.mostWornItems = reader.readStringList(offsets[5]) ?? [];
  object.neededItems = reader.readStringList(offsets[6]) ?? [];
  object.plannedOutfitIds = reader.readStringList(offsets[7]) ?? [];
  object.season = _SeasonalWardrobeseasonValueEnumMap[
          reader.readStringOrNull(offsets[8])] ??
      Season.spring;
  object.seasonalTheme = reader.readStringOrNull(offsets[9]);
  object.storedItemIds = reader.readStringList(offsets[10]) ?? [];
  object.totalOutfits = reader.readLong(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.userId = reader.readString(offsets[13]);
  object.wishlistItems = reader.readStringList(offsets[14]) ?? [];
  object.year = reader.readLong(offsets[15]);
  return object;
}

P _seasonalWardrobeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (_SeasonalWardrobeseasonValueEnumMap[
              reader.readStringOrNull(offset)] ??
          Season.spring) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringList(offset) ?? []) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SeasonalWardrobeseasonEnumValueMap = {
  r'spring': r'spring',
  r'summer': r'summer',
  r'autumn': r'autumn',
  r'winter': r'winter',
  r'allSeason': r'allSeason',
};
const _SeasonalWardrobeseasonValueEnumMap = {
  r'spring': Season.spring,
  r'summer': Season.summer,
  r'autumn': Season.autumn,
  r'winter': Season.winter,
  r'allSeason': Season.allSeason,
};

Id _seasonalWardrobeGetId(SeasonalWardrobe object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _seasonalWardrobeGetLinks(SeasonalWardrobe object) {
  return [];
}

void _seasonalWardrobeAttach(
    IsarCollection<dynamic> col, Id id, SeasonalWardrobe object) {
  object.id = id;
}

extension SeasonalWardrobeQueryWhereSort
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QWhere> {
  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SeasonalWardrobeQueryWhere
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QWhereClause> {
  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause> idBetween(
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SeasonalWardrobeQueryFilter
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QFilterCondition> {
  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeItemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeItemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeItemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeItemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeItemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeItemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeItemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      activeItemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeItemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPalette',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorPalette',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorPalette',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorPalette',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorPalette',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorPalette',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorPalette',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorPalette',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPalette',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorPalette',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colorPalette',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colorPalette',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colorPalette',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colorPalette',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colorPalette',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      colorPaletteLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colorPalette',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goals',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'goals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'goals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'goals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'goals',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goals',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'goals',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goals',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goals',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goals',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goals',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goals',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      goalsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'goals',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leastWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leastWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leastWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leastWornItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'leastWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'leastWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'leastWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'leastWornItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leastWornItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'leastWornItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leastWornItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leastWornItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leastWornItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leastWornItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leastWornItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      leastWornItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leastWornItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mostWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mostWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mostWornItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mostWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mostWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mostWornItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mostWornItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostWornItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mostWornItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostWornItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostWornItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostWornItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostWornItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostWornItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      mostWornItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostWornItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'neededItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'neededItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'neededItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'neededItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'neededItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'neededItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'neededItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'neededItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'neededItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'neededItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'neededItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'neededItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'neededItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'neededItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'neededItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      neededItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'neededItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedOutfitIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plannedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plannedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plannedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plannedOutfitIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plannedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plannedOutfitIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plannedOutfitIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plannedOutfitIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plannedOutfitIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plannedOutfitIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      plannedOutfitIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plannedOutfitIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonEqualTo(
    Season value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonGreaterThan(
    Season value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonLessThan(
    Season value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonBetween(
    Season lower,
    Season upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'season',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'season',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seasonalTheme',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seasonalTheme',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seasonalTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seasonalTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seasonalTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seasonalTheme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seasonalTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seasonalTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seasonalTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seasonalTheme',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seasonalTheme',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      seasonalThemeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seasonalTheme',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storedItemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storedItemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storedItemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storedItemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storedItemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storedItemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storedItemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      storedItemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'storedItemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      totalOutfitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      totalOutfitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      totalOutfitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      totalOutfitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalOutfits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
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

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wishlistItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wishlistItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wishlistItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wishlistItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wishlistItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wishlistItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wishlistItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wishlistItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wishlistItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wishlistItems',
        value: '',
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wishlistItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wishlistItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wishlistItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wishlistItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wishlistItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      wishlistItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wishlistItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      yearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterFilterCondition>
      yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SeasonalWardrobeQueryObject
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QFilterCondition> {}

extension SeasonalWardrobeQueryLinks
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QFilterCondition> {}

extension SeasonalWardrobeQuerySortBy
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QSortBy> {
  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortBySeasonalTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seasonalTheme', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortBySeasonalThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seasonalTheme', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByTotalOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension SeasonalWardrobeQuerySortThenBy
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QSortThenBy> {
  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenBySeasonalTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seasonalTheme', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenBySeasonalThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seasonalTheme', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByTotalOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QAfterSortBy>
      thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension SeasonalWardrobeQueryWhereDistinct
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct> {
  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByActiveItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeItemIds');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByColorPalette() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorPalette');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByGoals() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goals');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByLeastWornItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leastWornItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByMostWornItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mostWornItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByNeededItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'neededItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByPlannedOutfitIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedOutfitIds');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct> distinctBySeason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctBySeasonalTheme({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seasonalTheme',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByStoredItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storedItemIds');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalOutfits');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct>
      distinctByWishlistItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wishlistItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension SeasonalWardrobeQueryProperty
    on QueryBuilder<SeasonalWardrobe, SeasonalWardrobe, QQueryProperty> {
  QueryBuilder<SeasonalWardrobe, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      activeItemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeItemIds');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      colorPaletteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorPalette');
    });
  }

  QueryBuilder<SeasonalWardrobe, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      goalsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goals');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      leastWornItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leastWornItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      mostWornItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mostWornItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      neededItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'neededItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      plannedOutfitIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedOutfitIds');
    });
  }

  QueryBuilder<SeasonalWardrobe, Season, QQueryOperations> seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<SeasonalWardrobe, String?, QQueryOperations>
      seasonalThemeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seasonalTheme');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      storedItemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storedItemIds');
    });
  }

  QueryBuilder<SeasonalWardrobe, int, QQueryOperations> totalOutfitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalOutfits');
    });
  }

  QueryBuilder<SeasonalWardrobe, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SeasonalWardrobe, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<SeasonalWardrobe, List<String>, QQueryOperations>
      wishlistItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wishlistItems');
    });
  }

  QueryBuilder<SeasonalWardrobe, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitChallengeCollection on Isar {
  IsarCollection<OutfitChallenge> get outfitChallenges => this.collection();
}

const OutfitChallengeSchema = CollectionSchema(
  name: r'OutfitChallenge',
  id: -4344496018206652881,
  properties: {
    r'achievements': PropertySchema(
      id: 0,
      name: r'achievements',
      type: IsarType.stringList,
    ),
    r'completedAt': PropertySchema(
      id: 1,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'creativityScore': PropertySchema(
      id: 3,
      name: r'creativityScore',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 5,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'isActive': PropertySchema(
      id: 6,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isCompleted': PropertySchema(
      id: 7,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'maxItems': PropertySchema(
      id: 8,
      name: r'maxItems',
      type: IsarType.long,
    ),
    r'rules': PropertySchema(
      id: 9,
      name: r'rules',
      type: IsarType.stringList,
    ),
    r'startDate': PropertySchema(
      id: 10,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'targetCategories': PropertySchema(
      id: 11,
      name: r'targetCategories',
      type: IsarType.stringList,
    ),
    r'targetOutfits': PropertySchema(
      id: 12,
      name: r'targetOutfits',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 13,
      name: r'title',
      type: IsarType.string,
    ),
    r'totalOutfits': PropertySchema(
      id: 14,
      name: r'totalOutfits',
      type: IsarType.long,
    ),
    r'uniqueItems': PropertySchema(
      id: 15,
      name: r'uniqueItems',
      type: IsarType.long,
    ),
    r'usedItemIds': PropertySchema(
      id: 16,
      name: r'usedItemIds',
      type: IsarType.stringList,
    ),
    r'usedOutfitIds': PropertySchema(
      id: 17,
      name: r'usedOutfitIds',
      type: IsarType.stringList,
    ),
    r'userId': PropertySchema(
      id: 18,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _outfitChallengeEstimateSize,
  serialize: _outfitChallengeSerialize,
  deserialize: _outfitChallengeDeserialize,
  deserializeProp: _outfitChallengeDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'startDate': IndexSchema(
      id: 7723980484494730382,
      name: r'startDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'endDate': IndexSchema(
      id: 422088669960424970,
      name: r'endDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'endDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _outfitChallengeGetId,
  getLinks: _outfitChallengeGetLinks,
  attach: _outfitChallengeAttach,
  version: '3.1.0+1',
);

int _outfitChallengeEstimateSize(
  OutfitChallenge object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.achievements.length * 3;
  {
    for (var i = 0; i < object.achievements.length; i++) {
      final value = object.achievements[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.rules.length * 3;
  {
    for (var i = 0; i < object.rules.length; i++) {
      final value = object.rules[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.targetCategories.length * 3;
  {
    for (var i = 0; i < object.targetCategories.length; i++) {
      final value = object.targetCategories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.usedItemIds.length * 3;
  {
    for (var i = 0; i < object.usedItemIds.length; i++) {
      final value = object.usedItemIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.usedOutfitIds.length * 3;
  {
    for (var i = 0; i < object.usedOutfitIds.length; i++) {
      final value = object.usedOutfitIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _outfitChallengeSerialize(
  OutfitChallenge object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.achievements);
  writer.writeDateTime(offsets[1], object.completedAt);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.creativityScore);
  writer.writeString(offsets[4], object.description);
  writer.writeDateTime(offsets[5], object.endDate);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeBool(offsets[7], object.isCompleted);
  writer.writeLong(offsets[8], object.maxItems);
  writer.writeStringList(offsets[9], object.rules);
  writer.writeDateTime(offsets[10], object.startDate);
  writer.writeStringList(offsets[11], object.targetCategories);
  writer.writeLong(offsets[12], object.targetOutfits);
  writer.writeString(offsets[13], object.title);
  writer.writeLong(offsets[14], object.totalOutfits);
  writer.writeLong(offsets[15], object.uniqueItems);
  writer.writeStringList(offsets[16], object.usedItemIds);
  writer.writeStringList(offsets[17], object.usedOutfitIds);
  writer.writeString(offsets[18], object.userId);
}

OutfitChallenge _outfitChallengeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitChallenge();
  object.achievements = reader.readStringList(offsets[0]) ?? [];
  object.completedAt = reader.readDateTimeOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.creativityScore = reader.readDouble(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.endDate = reader.readDateTime(offsets[5]);
  object.id = id;
  object.isActive = reader.readBool(offsets[6]);
  object.isCompleted = reader.readBool(offsets[7]);
  object.maxItems = reader.readLongOrNull(offsets[8]);
  object.rules = reader.readStringList(offsets[9]) ?? [];
  object.startDate = reader.readDateTime(offsets[10]);
  object.targetCategories = reader.readStringList(offsets[11]) ?? [];
  object.targetOutfits = reader.readLongOrNull(offsets[12]);
  object.title = reader.readString(offsets[13]);
  object.totalOutfits = reader.readLong(offsets[14]);
  object.uniqueItems = reader.readLong(offsets[15]);
  object.usedItemIds = reader.readStringList(offsets[16]) ?? [];
  object.usedOutfitIds = reader.readStringList(offsets[17]) ?? [];
  object.userId = reader.readString(offsets[18]);
  return object;
}

P _outfitChallengeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readStringList(offset) ?? []) as P;
    case 17:
      return (reader.readStringList(offset) ?? []) as P;
    case 18:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _outfitChallengeGetId(OutfitChallenge object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitChallengeGetLinks(OutfitChallenge object) {
  return [];
}

void _outfitChallengeAttach(
    IsarCollection<dynamic> col, Id id, OutfitChallenge object) {
  object.id = id;
}

extension OutfitChallengeQueryWhereSort
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QWhere> {
  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhere> anyStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startDate'),
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhere> anyEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'endDate'),
      );
    });
  }
}

extension OutfitChallengeQueryWhere
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QWhereClause> {
  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause> idBetween(
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      startDateEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startDate',
        value: [startDate],
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      startDateNotEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      startDateGreaterThan(
    DateTime startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [startDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      startDateLessThan(
    DateTime startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [],
        upper: [startDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      startDateBetween(
    DateTime lowerStartDate,
    DateTime upperStartDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [lowerStartDate],
        includeLower: includeLower,
        upper: [upperStartDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      endDateEqualTo(DateTime endDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'endDate',
        value: [endDate],
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      endDateNotEqualTo(DateTime endDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'endDate',
              lower: [],
              upper: [endDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'endDate',
              lower: [endDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'endDate',
              lower: [endDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'endDate',
              lower: [],
              upper: [endDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      endDateGreaterThan(
    DateTime endDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'endDate',
        lower: [endDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      endDateLessThan(
    DateTime endDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'endDate',
        lower: [],
        upper: [endDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterWhereClause>
      endDateBetween(
    DateTime lowerEndDate,
    DateTime upperEndDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'endDate',
        lower: [lowerEndDate],
        includeLower: includeLower,
        upper: [upperEndDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OutfitChallengeQueryFilter
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QFilterCondition> {
  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'achievements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'achievements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'achievements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'achievements',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'achievements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'achievements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'achievements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'achievements',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'achievements',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'achievements',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      achievementsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      creativityScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creativityScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      creativityScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creativityScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      creativityScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creativityScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      creativityScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creativityScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      maxItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxItems',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      maxItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxItems',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      maxItemsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxItems',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      maxItemsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxItems',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      maxItemsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxItems',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      maxItemsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rules',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rules',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rules',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rules',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      rulesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCategories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetCategories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetCategories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetCategories',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetCategories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetCategories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetCategories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetCategories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetCategories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetCategoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetCategories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetOutfitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetOutfits',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetOutfitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetOutfits',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetOutfitsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetOutfitsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetOutfitsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      targetOutfitsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetOutfits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
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

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      totalOutfitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      totalOutfitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      totalOutfitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalOutfits',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      totalOutfitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalOutfits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      uniqueItemsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uniqueItems',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      uniqueItemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uniqueItems',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      uniqueItemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uniqueItems',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      uniqueItemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uniqueItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedItemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usedItemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedItemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedItemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedItemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedItemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedItemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedItemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedItemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedOutfitIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usedOutfitIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedOutfitIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedOutfitIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedOutfitIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedOutfitIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedOutfitIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      usedOutfitIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedOutfitIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension OutfitChallengeQueryObject
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QFilterCondition> {}

extension OutfitChallengeQueryLinks
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QFilterCondition> {}

extension OutfitChallengeQuerySortBy
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QSortBy> {
  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByCreativityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creativityScore', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByCreativityScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creativityScore', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByMaxItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItems', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByMaxItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItems', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByTargetOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfits', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByTargetOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfits', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByTotalOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByUniqueItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueItems', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByUniqueItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueItems', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OutfitChallengeQuerySortThenBy
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QSortThenBy> {
  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByCreativityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creativityScore', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByCreativityScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creativityScore', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByMaxItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItems', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByMaxItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItems', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByTargetOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfits', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByTargetOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetOutfits', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByTotalOutfitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOutfits', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByUniqueItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueItems', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByUniqueItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueItems', Sort.desc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OutfitChallengeQueryWhereDistinct
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct> {
  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'achievements');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByCreativityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creativityScore');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByMaxItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxItems');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct> distinctByRules() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rules');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByTargetCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCategories');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByTargetOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetOutfits');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByTotalOutfits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalOutfits');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByUniqueItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uniqueItems');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByUsedItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedItemIds');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct>
      distinctByUsedOutfitIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedOutfitIds');
    });
  }

  QueryBuilder<OutfitChallenge, OutfitChallenge, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension OutfitChallengeQueryProperty
    on QueryBuilder<OutfitChallenge, OutfitChallenge, QQueryProperty> {
  QueryBuilder<OutfitChallenge, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitChallenge, List<String>, QQueryOperations>
      achievementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'achievements');
    });
  }

  QueryBuilder<OutfitChallenge, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<OutfitChallenge, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutfitChallenge, double, QQueryOperations>
      creativityScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creativityScore');
    });
  }

  QueryBuilder<OutfitChallenge, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<OutfitChallenge, DateTime, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<OutfitChallenge, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<OutfitChallenge, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<OutfitChallenge, int?, QQueryOperations> maxItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxItems');
    });
  }

  QueryBuilder<OutfitChallenge, List<String>, QQueryOperations>
      rulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rules');
    });
  }

  QueryBuilder<OutfitChallenge, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<OutfitChallenge, List<String>, QQueryOperations>
      targetCategoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCategories');
    });
  }

  QueryBuilder<OutfitChallenge, int?, QQueryOperations>
      targetOutfitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetOutfits');
    });
  }

  QueryBuilder<OutfitChallenge, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<OutfitChallenge, int, QQueryOperations> totalOutfitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalOutfits');
    });
  }

  QueryBuilder<OutfitChallenge, int, QQueryOperations> uniqueItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uniqueItems');
    });
  }

  QueryBuilder<OutfitChallenge, List<String>, QQueryOperations>
      usedItemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedItemIds');
    });
  }

  QueryBuilder<OutfitChallenge, List<String>, QQueryOperations>
      usedOutfitIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedOutfitIds');
    });
  }

  QueryBuilder<OutfitChallenge, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLaundryPlanCollection on Isar {
  IsarCollection<LaundryPlan> get laundryPlans => this.collection();
}

const LaundryPlanSchema = CollectionSchema(
  name: r'LaundryPlan',
  id: -8593429766236650553,
  properties: {
    r'affectedOutfitIds': PropertySchema(
      id: 0,
      name: r'affectedOutfitIds',
      type: IsarType.stringList,
    ),
    r'availableAgainAt': PropertySchema(
      id: 1,
      name: r'availableAgainAt',
      type: IsarType.dateTime,
    ),
    r'completedAt': PropertySchema(
      id: 2,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 4,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'itemIds': PropertySchema(
      id: 5,
      name: r'itemIds',
      type: IsarType.stringList,
    ),
    r'plannedDate': PropertySchema(
      id: 6,
      name: r'plannedDate',
      type: IsarType.dateTime,
    ),
    r'reminderSet': PropertySchema(
      id: 7,
      name: r'reminderSet',
      type: IsarType.bool,
    ),
    r'reminderTime': PropertySchema(
      id: 8,
      name: r'reminderTime',
      type: IsarType.dateTime,
    ),
    r'separateColors': PropertySchema(
      id: 9,
      name: r'separateColors',
      type: IsarType.bool,
    ),
    r'temperature': PropertySchema(
      id: 10,
      name: r'temperature',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.string,
    ),
    r'washCycle': PropertySchema(
      id: 12,
      name: r'washCycle',
      type: IsarType.string,
    )
  },
  estimateSize: _laundryPlanEstimateSize,
  serialize: _laundryPlanSerialize,
  deserialize: _laundryPlanDeserialize,
  deserializeProp: _laundryPlanDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _laundryPlanGetId,
  getLinks: _laundryPlanGetLinks,
  attach: _laundryPlanAttach,
  version: '3.1.0+1',
);

int _laundryPlanEstimateSize(
  LaundryPlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.affectedOutfitIds.length * 3;
  {
    for (var i = 0; i < object.affectedOutfitIds.length; i++) {
      final value = object.affectedOutfitIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.itemIds.length * 3;
  {
    for (var i = 0; i < object.itemIds.length; i++) {
      final value = object.itemIds[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.temperature;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  {
    final value = object.washCycle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _laundryPlanSerialize(
  LaundryPlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.affectedOutfitIds);
  writer.writeDateTime(offsets[1], object.availableAgainAt);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeBool(offsets[4], object.isCompleted);
  writer.writeStringList(offsets[5], object.itemIds);
  writer.writeDateTime(offsets[6], object.plannedDate);
  writer.writeBool(offsets[7], object.reminderSet);
  writer.writeDateTime(offsets[8], object.reminderTime);
  writer.writeBool(offsets[9], object.separateColors);
  writer.writeString(offsets[10], object.temperature);
  writer.writeString(offsets[11], object.userId);
  writer.writeString(offsets[12], object.washCycle);
}

LaundryPlan _laundryPlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LaundryPlan();
  object.affectedOutfitIds = reader.readStringList(offsets[0]) ?? [];
  object.availableAgainAt = reader.readDateTimeOrNull(offsets[1]);
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[4]);
  object.itemIds = reader.readStringList(offsets[5]) ?? [];
  object.plannedDate = reader.readDateTime(offsets[6]);
  object.reminderSet = reader.readBool(offsets[7]);
  object.reminderTime = reader.readDateTimeOrNull(offsets[8]);
  object.separateColors = reader.readBool(offsets[9]);
  object.temperature = reader.readStringOrNull(offsets[10]);
  object.userId = reader.readString(offsets[11]);
  object.washCycle = reader.readStringOrNull(offsets[12]);
  return object;
}

P _laundryPlanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _laundryPlanGetId(LaundryPlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _laundryPlanGetLinks(LaundryPlan object) {
  return [];
}

void _laundryPlanAttach(
    IsarCollection<dynamic> col, Id id, LaundryPlan object) {
  object.id = id;
}

extension LaundryPlanQueryWhereSort
    on QueryBuilder<LaundryPlan, LaundryPlan, QWhere> {
  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhere> anyPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'plannedDate'),
      );
    });
  }
}

extension LaundryPlanQueryWhere
    on QueryBuilder<LaundryPlan, LaundryPlan, QWhereClause> {
  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> idBetween(
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> userIdNotEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> plannedDateEqualTo(
      DateTime plannedDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'plannedDate',
        value: [plannedDate],
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> plannedDateLessThan(
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterWhereClause> plannedDateBetween(
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
}

extension LaundryPlanQueryFilter
    on QueryBuilder<LaundryPlan, LaundryPlan, QFilterCondition> {
  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'affectedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'affectedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'affectedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'affectedOutfitIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'affectedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'affectedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'affectedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'affectedOutfitIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'affectedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'affectedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'affectedOutfitIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'affectedOutfitIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'affectedOutfitIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'affectedOutfitIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'affectedOutfitIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      affectedOutfitIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'affectedOutfitIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      availableAgainAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'availableAgainAt',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      availableAgainAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'availableAgainAt',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      availableAgainAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableAgainAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      availableAgainAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'availableAgainAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      availableAgainAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'availableAgainAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      availableAgainAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'availableAgainAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      itemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      plannedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
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

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderSetEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderSet',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reminderTime',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reminderTime',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      reminderTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      separateColorsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'separateColors',
        value: value,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'temperature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'temperature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'temperature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'temperature',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      temperatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'temperature',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'washCycle',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'washCycle',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'washCycle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'washCycle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'washCycle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'washCycle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'washCycle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'washCycle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'washCycle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'washCycle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'washCycle',
        value: '',
      ));
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterFilterCondition>
      washCycleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'washCycle',
        value: '',
      ));
    });
  }
}

extension LaundryPlanQueryObject
    on QueryBuilder<LaundryPlan, LaundryPlan, QFilterCondition> {}

extension LaundryPlanQueryLinks
    on QueryBuilder<LaundryPlan, LaundryPlan, QFilterCondition> {}

extension LaundryPlanQuerySortBy
    on QueryBuilder<LaundryPlan, LaundryPlan, QSortBy> {
  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      sortByAvailableAgainAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAgainAt', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      sortByAvailableAgainAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAgainAt', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByPlannedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByReminderSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSet', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByReminderSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSet', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      sortByReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortBySeparateColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'separateColors', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      sortBySeparateColorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'separateColors', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByWashCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'washCycle', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> sortByWashCycleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'washCycle', Sort.desc);
    });
  }
}

extension LaundryPlanQuerySortThenBy
    on QueryBuilder<LaundryPlan, LaundryPlan, QSortThenBy> {
  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      thenByAvailableAgainAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAgainAt', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      thenByAvailableAgainAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAgainAt', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByPlannedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDate', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByReminderSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSet', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByReminderSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderSet', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      thenByReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenBySeparateColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'separateColors', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy>
      thenBySeparateColorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'separateColors', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByWashCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'washCycle', Sort.asc);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QAfterSortBy> thenByWashCycleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'washCycle', Sort.desc);
    });
  }
}

extension LaundryPlanQueryWhereDistinct
    on QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> {
  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct>
      distinctByAffectedOutfitIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'affectedOutfitIds');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct>
      distinctByAvailableAgainAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'availableAgainAt');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemIds');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByPlannedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedDate');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByReminderSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderSet');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderTime');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctBySeparateColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'separateColors');
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByTemperature(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LaundryPlan, LaundryPlan, QDistinct> distinctByWashCycle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'washCycle', caseSensitive: caseSensitive);
    });
  }
}

extension LaundryPlanQueryProperty
    on QueryBuilder<LaundryPlan, LaundryPlan, QQueryProperty> {
  QueryBuilder<LaundryPlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LaundryPlan, List<String>, QQueryOperations>
      affectedOutfitIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'affectedOutfitIds');
    });
  }

  QueryBuilder<LaundryPlan, DateTime?, QQueryOperations>
      availableAgainAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'availableAgainAt');
    });
  }

  QueryBuilder<LaundryPlan, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<LaundryPlan, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LaundryPlan, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<LaundryPlan, List<String>, QQueryOperations> itemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemIds');
    });
  }

  QueryBuilder<LaundryPlan, DateTime, QQueryOperations> plannedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedDate');
    });
  }

  QueryBuilder<LaundryPlan, bool, QQueryOperations> reminderSetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderSet');
    });
  }

  QueryBuilder<LaundryPlan, DateTime?, QQueryOperations>
      reminderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderTime');
    });
  }

  QueryBuilder<LaundryPlan, bool, QQueryOperations> separateColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'separateColors');
    });
  }

  QueryBuilder<LaundryPlan, String?, QQueryOperations> temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<LaundryPlan, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<LaundryPlan, String?, QQueryOperations> washCycleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'washCycle');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClosetMaintenanceCollection on Isar {
  IsarCollection<ClosetMaintenance> get closetMaintenances => this.collection();
}

const ClosetMaintenanceSchema = CollectionSchema(
  name: r'ClosetMaintenance',
  id: 6690947760253628021,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'donatedItemIds': PropertySchema(
      id: 3,
      name: r'donatedItemIds',
      type: IsarType.stringList,
    ),
    r'isCompleted': PropertySchema(
      id: 4,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isRecurring': PropertySchema(
      id: 5,
      name: r'isRecurring',
      type: IsarType.bool,
    ),
    r'itemIds': PropertySchema(
      id: 6,
      name: r'itemIds',
      type: IsarType.stringList,
    ),
    r'notes': PropertySchema(
      id: 7,
      name: r'notes',
      type: IsarType.string,
    ),
    r'recurrencePattern': PropertySchema(
      id: 8,
      name: r'recurrencePattern',
      type: IsarType.string,
    ),
    r'repairedItemIds': PropertySchema(
      id: 9,
      name: r'repairedItemIds',
      type: IsarType.stringList,
    ),
    r'replacedItemIds': PropertySchema(
      id: 10,
      name: r'replacedItemIds',
      type: IsarType.stringList,
    ),
    r'scheduledDate': PropertySchema(
      id: 11,
      name: r'scheduledDate',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 12,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 13,
      name: r'type',
      type: IsarType.string,
      enumMap: _ClosetMaintenancetypeEnumValueMap,
    ),
    r'userId': PropertySchema(
      id: 14,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _closetMaintenanceEstimateSize,
  serialize: _closetMaintenanceSerialize,
  deserialize: _closetMaintenanceDeserialize,
  deserializeProp: _closetMaintenanceDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'scheduledDate': IndexSchema(
      id: -6773496565145745994,
      name: r'scheduledDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scheduledDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _closetMaintenanceGetId,
  getLinks: _closetMaintenanceGetLinks,
  attach: _closetMaintenanceAttach,
  version: '3.1.0+1',
);

int _closetMaintenanceEstimateSize(
  ClosetMaintenance object,
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
  bytesCount += 3 + object.donatedItemIds.length * 3;
  {
    for (var i = 0; i < object.donatedItemIds.length; i++) {
      final value = object.donatedItemIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.itemIds.length * 3;
  {
    for (var i = 0; i < object.itemIds.length; i++) {
      final value = object.itemIds[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.recurrencePattern;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.repairedItemIds.length * 3;
  {
    for (var i = 0; i < object.repairedItemIds.length; i++) {
      final value = object.repairedItemIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.replacedItemIds.length * 3;
  {
    for (var i = 0; i < object.replacedItemIds.length; i++) {
      final value = object.replacedItemIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _closetMaintenanceSerialize(
  ClosetMaintenance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeStringList(offsets[3], object.donatedItemIds);
  writer.writeBool(offsets[4], object.isCompleted);
  writer.writeBool(offsets[5], object.isRecurring);
  writer.writeStringList(offsets[6], object.itemIds);
  writer.writeString(offsets[7], object.notes);
  writer.writeString(offsets[8], object.recurrencePattern);
  writer.writeStringList(offsets[9], object.repairedItemIds);
  writer.writeStringList(offsets[10], object.replacedItemIds);
  writer.writeDateTime(offsets[11], object.scheduledDate);
  writer.writeString(offsets[12], object.title);
  writer.writeString(offsets[13], object.type.name);
  writer.writeString(offsets[14], object.userId);
}

ClosetMaintenance _closetMaintenanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClosetMaintenance();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.donatedItemIds = reader.readStringList(offsets[3]) ?? [];
  object.id = id;
  object.isCompleted = reader.readBool(offsets[4]);
  object.isRecurring = reader.readBool(offsets[5]);
  object.itemIds = reader.readStringList(offsets[6]) ?? [];
  object.notes = reader.readStringOrNull(offsets[7]);
  object.recurrencePattern = reader.readStringOrNull(offsets[8]);
  object.repairedItemIds = reader.readStringList(offsets[9]) ?? [];
  object.replacedItemIds = reader.readStringList(offsets[10]) ?? [];
  object.scheduledDate = reader.readDateTime(offsets[11]);
  object.title = reader.readString(offsets[12]);
  object.type = _ClosetMaintenancetypeValueEnumMap[
          reader.readStringOrNull(offsets[13])] ??
      MaintenanceType.seasonalRotation;
  object.userId = reader.readString(offsets[14]);
  return object;
}

P _closetMaintenanceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (_ClosetMaintenancetypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MaintenanceType.seasonalRotation) as P;
    case 14:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ClosetMaintenancetypeEnumValueMap = {
  r'seasonalRotation': r'seasonalRotation',
  r'deepClean': r'deepClean',
  r'organization': r'organization',
  r'damageAssessment': r'damageAssessment',
  r'sizeReview': r'sizeReview',
  r'styleUpdate': r'styleUpdate',
};
const _ClosetMaintenancetypeValueEnumMap = {
  r'seasonalRotation': MaintenanceType.seasonalRotation,
  r'deepClean': MaintenanceType.deepClean,
  r'organization': MaintenanceType.organization,
  r'damageAssessment': MaintenanceType.damageAssessment,
  r'sizeReview': MaintenanceType.sizeReview,
  r'styleUpdate': MaintenanceType.styleUpdate,
};

Id _closetMaintenanceGetId(ClosetMaintenance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _closetMaintenanceGetLinks(
    ClosetMaintenance object) {
  return [];
}

void _closetMaintenanceAttach(
    IsarCollection<dynamic> col, Id id, ClosetMaintenance object) {
  object.id = id;
}

extension ClosetMaintenanceQueryWhereSort
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QWhere> {
  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhere>
      anyScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scheduledDate'),
      );
    });
  }
}

extension ClosetMaintenanceQueryWhere
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QWhereClause> {
  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      scheduledDateEqualTo(DateTime scheduledDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scheduledDate',
        value: [scheduledDate],
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      scheduledDateNotEqualTo(DateTime scheduledDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledDate',
              lower: [],
              upper: [scheduledDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledDate',
              lower: [scheduledDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledDate',
              lower: [scheduledDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledDate',
              lower: [],
              upper: [scheduledDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      scheduledDateGreaterThan(
    DateTime scheduledDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledDate',
        lower: [scheduledDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      scheduledDateLessThan(
    DateTime scheduledDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledDate',
        lower: [],
        upper: [scheduledDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterWhereClause>
      scheduledDateBetween(
    DateTime lowerScheduledDate,
    DateTime upperScheduledDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledDate',
        lower: [lowerScheduledDate],
        includeLower: includeLower,
        upper: [upperScheduledDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClosetMaintenanceQueryFilter
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QFilterCondition> {
  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'donatedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'donatedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'donatedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'donatedItemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'donatedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'donatedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'donatedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'donatedItemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'donatedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'donatedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'donatedItemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'donatedItemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'donatedItemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'donatedItemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'donatedItemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      donatedItemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'donatedItemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      isRecurringEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRecurring',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      itemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurrencePattern',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurrencePattern',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrencePattern',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurrencePattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurrencePattern',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePattern',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      recurrencePatternIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurrencePattern',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repairedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repairedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repairedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repairedItemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'repairedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'repairedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'repairedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'repairedItemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repairedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'repairedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repairedItemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repairedItemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repairedItemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repairedItemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repairedItemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      repairedItemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repairedItemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'replacedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'replacedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'replacedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'replacedItemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'replacedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'replacedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'replacedItemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'replacedItemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'replacedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'replacedItemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'replacedItemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'replacedItemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'replacedItemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'replacedItemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'replacedItemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      replacedItemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'replacedItemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      scheduledDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      scheduledDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      scheduledDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      scheduledDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
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

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeEqualTo(
    MaintenanceType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeGreaterThan(
    MaintenanceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeLessThan(
    MaintenanceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeBetween(
    MaintenanceType lower,
    MaintenanceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension ClosetMaintenanceQueryObject
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QFilterCondition> {}

extension ClosetMaintenanceQueryLinks
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QFilterCondition> {}

extension ClosetMaintenanceQuerySortBy
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QSortBy> {
  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByRecurrencePatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByScheduledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ClosetMaintenanceQuerySortThenBy
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QSortThenBy> {
  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByRecurrencePattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByRecurrencePatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePattern', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByScheduledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ClosetMaintenanceQueryWhereDistinct
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct> {
  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByDonatedItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'donatedItemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRecurring');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByRecurrencePattern({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrencePattern',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByRepairedItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repairedItemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByReplacedItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'replacedItemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledDate');
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClosetMaintenance, ClosetMaintenance, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension ClosetMaintenanceQueryProperty
    on QueryBuilder<ClosetMaintenance, ClosetMaintenance, QQueryProperty> {
  QueryBuilder<ClosetMaintenance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClosetMaintenance, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<ClosetMaintenance, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ClosetMaintenance, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ClosetMaintenance, List<String>, QQueryOperations>
      donatedItemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'donatedItemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<ClosetMaintenance, bool, QQueryOperations>
      isRecurringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRecurring');
    });
  }

  QueryBuilder<ClosetMaintenance, List<String>, QQueryOperations>
      itemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<ClosetMaintenance, String?, QQueryOperations>
      recurrencePatternProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrencePattern');
    });
  }

  QueryBuilder<ClosetMaintenance, List<String>, QQueryOperations>
      repairedItemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repairedItemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, List<String>, QQueryOperations>
      replacedItemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'replacedItemIds');
    });
  }

  QueryBuilder<ClosetMaintenance, DateTime, QQueryOperations>
      scheduledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledDate');
    });
  }

  QueryBuilder<ClosetMaintenance, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ClosetMaintenance, MaintenanceType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ClosetMaintenance, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlanningPreferencesCollection on Isar {
  IsarCollection<PlanningPreferences> get planningPreferences =>
      this.collection();
}

const PlanningPreferencesSchema = CollectionSchema(
  name: r'PlanningPreferences',
  id: -4090929792110169289,
  properties: {
    r'allowExactRepetition': PropertySchema(
      id: 0,
      name: r'allowExactRepetition',
      type: IsarType.bool,
    ),
    r'autoScheduleEnabled': PropertySchema(
      id: 1,
      name: r'autoScheduleEnabled',
      type: IsarType.bool,
    ),
    r'avoidedBrands': PropertySchema(
      id: 2,
      name: r'avoidedBrands',
      type: IsarType.stringList,
    ),
    r'calendarNotifications': PropertySchema(
      id: 3,
      name: r'calendarNotifications',
      type: IsarType.bool,
    ),
    r'calendarWeight': PropertySchema(
      id: 4,
      name: r'calendarWeight',
      type: IsarType.double,
    ),
    r'considerCalendar': PropertySchema(
      id: 5,
      name: r'considerCalendar',
      type: IsarType.bool,
    ),
    r'considerWeather': PropertySchema(
      id: 6,
      name: r'considerWeather',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 7,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'laundryReminders': PropertySchema(
      id: 8,
      name: r'laundryReminders',
      type: IsarType.bool,
    ),
    r'maxBudgetPerOutfit': PropertySchema(
      id: 9,
      name: r'maxBudgetPerOutfit',
      type: IsarType.double,
    ),
    r'minDaysBetweenSameItem': PropertySchema(
      id: 10,
      name: r'minDaysBetweenSameItem',
      type: IsarType.long,
    ),
    r'minDaysBetweenSameOutfit': PropertySchema(
      id: 11,
      name: r'minDaysBetweenSameOutfit',
      type: IsarType.long,
    ),
    r'planningDaysAhead': PropertySchema(
      id: 12,
      name: r'planningDaysAhead',
      type: IsarType.long,
    ),
    r'planningReminders': PropertySchema(
      id: 13,
      name: r'planningReminders',
      type: IsarType.bool,
    ),
    r'preferredBrands': PropertySchema(
      id: 14,
      name: r'preferredBrands',
      type: IsarType.stringList,
    ),
    r'prioritizeComfort': PropertySchema(
      id: 15,
      name: r'prioritizeComfort',
      type: IsarType.bool,
    ),
    r'prioritizeOccasion': PropertySchema(
      id: 16,
      name: r'prioritizeOccasion',
      type: IsarType.bool,
    ),
    r'prioritizeStyle': PropertySchema(
      id: 17,
      name: r'prioritizeStyle',
      type: IsarType.bool,
    ),
    r'prioritizeWeather': PropertySchema(
      id: 18,
      name: r'prioritizeWeather',
      type: IsarType.bool,
    ),
    r'reminderHoursBefore': PropertySchema(
      id: 19,
      name: r'reminderHoursBefore',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 20,
      name: r'userId',
      type: IsarType.string,
    ),
    r'weatherNotifications': PropertySchema(
      id: 21,
      name: r'weatherNotifications',
      type: IsarType.bool,
    ),
    r'weatherUpdateNotifications': PropertySchema(
      id: 22,
      name: r'weatherUpdateNotifications',
      type: IsarType.bool,
    ),
    r'weatherWeight': PropertySchema(
      id: 23,
      name: r'weatherWeight',
      type: IsarType.double,
    )
  },
  estimateSize: _planningPreferencesEstimateSize,
  serialize: _planningPreferencesSerialize,
  deserialize: _planningPreferencesDeserialize,
  deserializeProp: _planningPreferencesDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _planningPreferencesGetId,
  getLinks: _planningPreferencesGetLinks,
  attach: _planningPreferencesAttach,
  version: '3.1.0+1',
);

int _planningPreferencesEstimateSize(
  PlanningPreferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.avoidedBrands.length * 3;
  {
    for (var i = 0; i < object.avoidedBrands.length; i++) {
      final value = object.avoidedBrands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredBrands.length * 3;
  {
    for (var i = 0; i < object.preferredBrands.length; i++) {
      final value = object.preferredBrands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _planningPreferencesSerialize(
  PlanningPreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.allowExactRepetition);
  writer.writeBool(offsets[1], object.autoScheduleEnabled);
  writer.writeStringList(offsets[2], object.avoidedBrands);
  writer.writeBool(offsets[3], object.calendarNotifications);
  writer.writeDouble(offsets[4], object.calendarWeight);
  writer.writeBool(offsets[5], object.considerCalendar);
  writer.writeBool(offsets[6], object.considerWeather);
  writer.writeDateTime(offsets[7], object.lastUpdated);
  writer.writeBool(offsets[8], object.laundryReminders);
  writer.writeDouble(offsets[9], object.maxBudgetPerOutfit);
  writer.writeLong(offsets[10], object.minDaysBetweenSameItem);
  writer.writeLong(offsets[11], object.minDaysBetweenSameOutfit);
  writer.writeLong(offsets[12], object.planningDaysAhead);
  writer.writeBool(offsets[13], object.planningReminders);
  writer.writeStringList(offsets[14], object.preferredBrands);
  writer.writeBool(offsets[15], object.prioritizeComfort);
  writer.writeBool(offsets[16], object.prioritizeOccasion);
  writer.writeBool(offsets[17], object.prioritizeStyle);
  writer.writeBool(offsets[18], object.prioritizeWeather);
  writer.writeLong(offsets[19], object.reminderHoursBefore);
  writer.writeString(offsets[20], object.userId);
  writer.writeBool(offsets[21], object.weatherNotifications);
  writer.writeBool(offsets[22], object.weatherUpdateNotifications);
  writer.writeDouble(offsets[23], object.weatherWeight);
}

PlanningPreferences _planningPreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlanningPreferences();
  object.allowExactRepetition = reader.readBool(offsets[0]);
  object.autoScheduleEnabled = reader.readBool(offsets[1]);
  object.avoidedBrands = reader.readStringList(offsets[2]) ?? [];
  object.calendarNotifications = reader.readBool(offsets[3]);
  object.calendarWeight = reader.readDouble(offsets[4]);
  object.considerCalendar = reader.readBool(offsets[5]);
  object.considerWeather = reader.readBool(offsets[6]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[7]);
  object.laundryReminders = reader.readBool(offsets[8]);
  object.maxBudgetPerOutfit = reader.readDouble(offsets[9]);
  object.minDaysBetweenSameItem = reader.readLong(offsets[10]);
  object.minDaysBetweenSameOutfit = reader.readLong(offsets[11]);
  object.planningDaysAhead = reader.readLong(offsets[12]);
  object.planningReminders = reader.readBool(offsets[13]);
  object.preferredBrands = reader.readStringList(offsets[14]) ?? [];
  object.prioritizeComfort = reader.readBool(offsets[15]);
  object.prioritizeOccasion = reader.readBool(offsets[16]);
  object.prioritizeStyle = reader.readBool(offsets[17]);
  object.prioritizeWeather = reader.readBool(offsets[18]);
  object.reminderHoursBefore = reader.readLong(offsets[19]);
  object.userId = reader.readString(offsets[20]);
  object.weatherNotifications = reader.readBool(offsets[21]);
  object.weatherUpdateNotifications = reader.readBool(offsets[22]);
  object.weatherWeight = reader.readDouble(offsets[23]);
  return object;
}

P _planningPreferencesDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringList(offset) ?? []) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readBool(offset)) as P;
    case 22:
      return (reader.readBool(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _planningPreferencesGetId(PlanningPreferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _planningPreferencesGetLinks(
    PlanningPreferences object) {
  return [];
}

void _planningPreferencesAttach(
    IsarCollection<dynamic> col, Id id, PlanningPreferences object) {
  object.id = id;
}

extension PlanningPreferencesByIndex on IsarCollection<PlanningPreferences> {
  Future<PlanningPreferences?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  PlanningPreferences? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<PlanningPreferences?>> getAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<PlanningPreferences?> getAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(PlanningPreferences object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(PlanningPreferences object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<PlanningPreferences> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<PlanningPreferences> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension PlanningPreferencesQueryWhereSort
    on QueryBuilder<PlanningPreferences, PlanningPreferences, QWhere> {
  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlanningPreferencesQueryWhere
    on QueryBuilder<PlanningPreferences, PlanningPreferences, QWhereClause> {
  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PlanningPreferencesQueryFilter on QueryBuilder<PlanningPreferences,
    PlanningPreferences, QFilterCondition> {
  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      allowExactRepetitionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowExactRepetition',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      autoScheduleEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoScheduleEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avoidedBrands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avoidedBrands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avoidedBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avoidedBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedBrands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedBrands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedBrands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedBrands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedBrands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      avoidedBrandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedBrands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      calendarNotificationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarNotifications',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      calendarWeightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calendarWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      calendarWeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calendarWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      calendarWeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calendarWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      calendarWeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calendarWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      considerCalendarEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'considerCalendar',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      considerWeatherEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'considerWeather',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      laundryRemindersEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laundryReminders',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      maxBudgetPerOutfitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxBudgetPerOutfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      maxBudgetPerOutfitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxBudgetPerOutfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      maxBudgetPerOutfitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxBudgetPerOutfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      maxBudgetPerOutfitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxBudgetPerOutfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameItemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minDaysBetweenSameItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameItemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minDaysBetweenSameItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameItemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minDaysBetweenSameItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameItemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minDaysBetweenSameItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameOutfitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minDaysBetweenSameOutfit',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameOutfitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minDaysBetweenSameOutfit',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameOutfitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minDaysBetweenSameOutfit',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      minDaysBetweenSameOutfitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minDaysBetweenSameOutfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      planningDaysAheadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planningDaysAhead',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      planningDaysAheadGreaterThan(
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      planningDaysAheadLessThan(
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      planningDaysAheadBetween(
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

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      planningRemindersEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planningReminders',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredBrands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredBrands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredBrands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredBrands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredBrands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredBrands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredBrands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      preferredBrandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredBrands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      prioritizeComfortEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioritizeComfort',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      prioritizeOccasionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioritizeOccasion',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      prioritizeStyleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioritizeStyle',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      prioritizeWeatherEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioritizeWeather',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      reminderHoursBeforeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderHoursBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      reminderHoursBeforeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderHoursBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      reminderHoursBeforeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderHoursBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      reminderHoursBeforeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderHoursBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      weatherNotificationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherNotifications',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      weatherUpdateNotificationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherUpdateNotifications',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      weatherWeightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      weatherWeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      weatherWeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterFilterCondition>
      weatherWeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlanningPreferencesQueryObject on QueryBuilder<PlanningPreferences,
    PlanningPreferences, QFilterCondition> {}

extension PlanningPreferencesQueryLinks on QueryBuilder<PlanningPreferences,
    PlanningPreferences, QFilterCondition> {}

extension PlanningPreferencesQuerySortBy
    on QueryBuilder<PlanningPreferences, PlanningPreferences, QSortBy> {
  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByAllowExactRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowExactRepetition', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByAllowExactRepetitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowExactRepetition', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByAutoScheduleEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScheduleEnabled', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByAutoScheduleEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScheduleEnabled', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByCalendarNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarNotifications', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByCalendarNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarNotifications', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByCalendarWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarWeight', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByCalendarWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarWeight', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByConsiderCalendar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerCalendar', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByConsiderCalendarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerCalendar', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByConsiderWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByConsiderWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByLaundryReminders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laundryReminders', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByLaundryRemindersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laundryReminders', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByMaxBudgetPerOutfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBudgetPerOutfit', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByMaxBudgetPerOutfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBudgetPerOutfit', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByMinDaysBetweenSameItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameItem', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByMinDaysBetweenSameItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameItem', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByMinDaysBetweenSameOutfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameOutfit', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByMinDaysBetweenSameOutfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameOutfit', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPlanningDaysAhead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPlanningDaysAheadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPlanningReminders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningReminders', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPlanningRemindersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningReminders', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeComfort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeComfort', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeComfortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeComfort', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeOccasion', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeOccasion', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeStyle', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeStyle', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeWeather', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByPrioritizeWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeWeather', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByReminderHoursBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderHoursBefore', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByReminderHoursBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderHoursBefore', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByWeatherNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherNotifications', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByWeatherNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherNotifications', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByWeatherUpdateNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherUpdateNotifications', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByWeatherUpdateNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherUpdateNotifications', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByWeatherWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherWeight', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      sortByWeatherWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherWeight', Sort.desc);
    });
  }
}

extension PlanningPreferencesQuerySortThenBy
    on QueryBuilder<PlanningPreferences, PlanningPreferences, QSortThenBy> {
  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByAllowExactRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowExactRepetition', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByAllowExactRepetitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowExactRepetition', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByAutoScheduleEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScheduleEnabled', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByAutoScheduleEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScheduleEnabled', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByCalendarNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarNotifications', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByCalendarNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarNotifications', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByCalendarWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarWeight', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByCalendarWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calendarWeight', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByConsiderCalendar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerCalendar', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByConsiderCalendarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerCalendar', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByConsiderWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByConsiderWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'considerWeather', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByLaundryReminders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laundryReminders', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByLaundryRemindersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laundryReminders', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByMaxBudgetPerOutfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBudgetPerOutfit', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByMaxBudgetPerOutfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBudgetPerOutfit', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByMinDaysBetweenSameItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameItem', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByMinDaysBetweenSameItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameItem', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByMinDaysBetweenSameOutfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameOutfit', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByMinDaysBetweenSameOutfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDaysBetweenSameOutfit', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPlanningDaysAhead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPlanningDaysAheadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningDaysAhead', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPlanningReminders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningReminders', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPlanningRemindersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planningReminders', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeComfort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeComfort', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeComfortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeComfort', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeOccasion', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeOccasion', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeStyle', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeStyle', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeWeather', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByPrioritizeWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioritizeWeather', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByReminderHoursBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderHoursBefore', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByReminderHoursBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderHoursBefore', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByWeatherNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherNotifications', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByWeatherNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherNotifications', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByWeatherUpdateNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherUpdateNotifications', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByWeatherUpdateNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherUpdateNotifications', Sort.desc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByWeatherWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherWeight', Sort.asc);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QAfterSortBy>
      thenByWeatherWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherWeight', Sort.desc);
    });
  }
}

extension PlanningPreferencesQueryWhereDistinct
    on QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct> {
  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByAllowExactRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowExactRepetition');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByAutoScheduleEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoScheduleEnabled');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByAvoidedBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avoidedBrands');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByCalendarNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calendarNotifications');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByCalendarWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calendarWeight');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByConsiderCalendar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'considerCalendar');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByConsiderWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'considerWeather');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByLaundryReminders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'laundryReminders');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByMaxBudgetPerOutfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxBudgetPerOutfit');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByMinDaysBetweenSameItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minDaysBetweenSameItem');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByMinDaysBetweenSameOutfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minDaysBetweenSameOutfit');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPlanningDaysAhead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planningDaysAhead');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPlanningReminders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planningReminders');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPreferredBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredBrands');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPrioritizeComfort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioritizeComfort');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPrioritizeOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioritizeOccasion');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPrioritizeStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioritizeStyle');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByPrioritizeWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioritizeWeather');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByReminderHoursBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderHoursBefore');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByWeatherNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherNotifications');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByWeatherUpdateNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherUpdateNotifications');
    });
  }

  QueryBuilder<PlanningPreferences, PlanningPreferences, QDistinct>
      distinctByWeatherWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherWeight');
    });
  }
}

extension PlanningPreferencesQueryProperty
    on QueryBuilder<PlanningPreferences, PlanningPreferences, QQueryProperty> {
  QueryBuilder<PlanningPreferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      allowExactRepetitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowExactRepetition');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      autoScheduleEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoScheduleEnabled');
    });
  }

  QueryBuilder<PlanningPreferences, List<String>, QQueryOperations>
      avoidedBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avoidedBrands');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      calendarNotificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calendarNotifications');
    });
  }

  QueryBuilder<PlanningPreferences, double, QQueryOperations>
      calendarWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calendarWeight');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      considerCalendarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'considerCalendar');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      considerWeatherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'considerWeather');
    });
  }

  QueryBuilder<PlanningPreferences, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      laundryRemindersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laundryReminders');
    });
  }

  QueryBuilder<PlanningPreferences, double, QQueryOperations>
      maxBudgetPerOutfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxBudgetPerOutfit');
    });
  }

  QueryBuilder<PlanningPreferences, int, QQueryOperations>
      minDaysBetweenSameItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minDaysBetweenSameItem');
    });
  }

  QueryBuilder<PlanningPreferences, int, QQueryOperations>
      minDaysBetweenSameOutfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minDaysBetweenSameOutfit');
    });
  }

  QueryBuilder<PlanningPreferences, int, QQueryOperations>
      planningDaysAheadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planningDaysAhead');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      planningRemindersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planningReminders');
    });
  }

  QueryBuilder<PlanningPreferences, List<String>, QQueryOperations>
      preferredBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredBrands');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      prioritizeComfortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioritizeComfort');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      prioritizeOccasionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioritizeOccasion');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      prioritizeStyleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioritizeStyle');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      prioritizeWeatherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioritizeWeather');
    });
  }

  QueryBuilder<PlanningPreferences, int, QQueryOperations>
      reminderHoursBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderHoursBefore');
    });
  }

  QueryBuilder<PlanningPreferences, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      weatherNotificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherNotifications');
    });
  }

  QueryBuilder<PlanningPreferences, bool, QQueryOperations>
      weatherUpdateNotificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherUpdateNotifications');
    });
  }

  QueryBuilder<PlanningPreferences, double, QQueryOperations>
      weatherWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherWeight');
    });
  }
}
