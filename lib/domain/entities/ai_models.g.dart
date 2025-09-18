// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIAnalysisHistoryCollection on Isar {
  IsarCollection<AIAnalysisHistory> get aIAnalysisHistorys => this.collection();
}

const AIAnalysisHistorySchema = CollectionSchema(
  name: r'AIAnalysisHistory',
  id: -1739424198236981676,
  properties: {
    r'aiService': PropertySchema(
      id: 0,
      name: r'aiService',
      type: IsarType.string,
    ),
    r'analysisType': PropertySchema(
      id: 1,
      name: r'analysisType',
      type: IsarType.string,
    ),
    r'analyzedAt': PropertySchema(
      id: 2,
      name: r'analyzedAt',
      type: IsarType.dateTime,
    ),
    r'confidence': PropertySchema(
      id: 3,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'itemId': PropertySchema(
      id: 4,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'modelVersion': PropertySchema(
      id: 5,
      name: r'modelVersion',
      type: IsarType.string,
    ),
    r'processingTime': PropertySchema(
      id: 6,
      name: r'processingTime',
      type: IsarType.long,
    ),
    r'userFeedback': PropertySchema(
      id: 7,
      name: r'userFeedback',
      type: IsarType.string,
    ),
    r'wasAccurate': PropertySchema(
      id: 8,
      name: r'wasAccurate',
      type: IsarType.bool,
    )
  },
  estimateSize: _aIAnalysisHistoryEstimateSize,
  serialize: _aIAnalysisHistorySerialize,
  deserialize: _aIAnalysisHistoryDeserialize,
  deserializeProp: _aIAnalysisHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'itemId': IndexSchema(
      id: -5342806140158601489,
      name: r'itemId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'itemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'analyzedAt': IndexSchema(
      id: -3138546819942808333,
      name: r'analyzedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'analyzedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _aIAnalysisHistoryGetId,
  getLinks: _aIAnalysisHistoryGetLinks,
  attach: _aIAnalysisHistoryAttach,
  version: '3.1.0+1',
);

int _aIAnalysisHistoryEstimateSize(
  AIAnalysisHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aiService.length * 3;
  bytesCount += 3 + object.analysisType.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  {
    final value = object.modelVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userFeedback;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _aIAnalysisHistorySerialize(
  AIAnalysisHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aiService);
  writer.writeString(offsets[1], object.analysisType);
  writer.writeDateTime(offsets[2], object.analyzedAt);
  writer.writeDouble(offsets[3], object.confidence);
  writer.writeString(offsets[4], object.itemId);
  writer.writeString(offsets[5], object.modelVersion);
  writer.writeLong(offsets[6], object.processingTime);
  writer.writeString(offsets[7], object.userFeedback);
  writer.writeBool(offsets[8], object.wasAccurate);
}

AIAnalysisHistory _aIAnalysisHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIAnalysisHistory();
  object.aiService = reader.readString(offsets[0]);
  object.analysisType = reader.readString(offsets[1]);
  object.analyzedAt = reader.readDateTime(offsets[2]);
  object.confidence = reader.readDouble(offsets[3]);
  object.id = id;
  object.itemId = reader.readString(offsets[4]);
  object.modelVersion = reader.readStringOrNull(offsets[5]);
  object.processingTime = reader.readLongOrNull(offsets[6]);
  object.userFeedback = reader.readStringOrNull(offsets[7]);
  object.wasAccurate = reader.readBoolOrNull(offsets[8]);
  return object;
}

P _aIAnalysisHistoryDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aIAnalysisHistoryGetId(AIAnalysisHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIAnalysisHistoryGetLinks(
    AIAnalysisHistory object) {
  return [];
}

void _aIAnalysisHistoryAttach(
    IsarCollection<dynamic> col, Id id, AIAnalysisHistory object) {
  object.id = id;
}

extension AIAnalysisHistoryQueryWhereSort
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QWhere> {
  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhere>
      anyAnalyzedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'analyzedAt'),
      );
    });
  }
}

extension AIAnalysisHistoryQueryWhere
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QWhereClause> {
  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
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

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
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

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      itemIdEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      itemIdNotEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      analyzedAtEqualTo(DateTime analyzedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'analyzedAt',
        value: [analyzedAt],
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      analyzedAtNotEqualTo(DateTime analyzedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyzedAt',
              lower: [],
              upper: [analyzedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyzedAt',
              lower: [analyzedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyzedAt',
              lower: [analyzedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'analyzedAt',
              lower: [],
              upper: [analyzedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      analyzedAtGreaterThan(
    DateTime analyzedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'analyzedAt',
        lower: [analyzedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      analyzedAtLessThan(
    DateTime analyzedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'analyzedAt',
        lower: [],
        upper: [analyzedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterWhereClause>
      analyzedAtBetween(
    DateTime lowerAnalyzedAt,
    DateTime upperAnalyzedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'analyzedAt',
        lower: [lowerAnalyzedAt],
        includeLower: includeLower,
        upper: [upperAnalyzedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AIAnalysisHistoryQueryFilter
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QFilterCondition> {
  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiService',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aiService',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aiService',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aiService',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aiService',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aiService',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aiService',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aiService',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiService',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      aiServiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aiService',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analysisType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'analysisType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'analysisType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'analysisType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'analysisType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'analysisType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'analysisType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'analysisType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analysisType',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analysisTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'analysisType',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analyzedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analyzedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analyzedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'analyzedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analyzedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'analyzedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      analyzedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'analyzedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      confidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      confidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      confidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      confidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
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

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
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

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
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

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'modelVersion',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'modelVersion',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      modelVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      processingTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingTime',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      processingTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingTime',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      processingTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      processingTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      processingTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      processingTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userFeedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userFeedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      userFeedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      wasAccurateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wasAccurate',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      wasAccurateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wasAccurate',
      ));
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterFilterCondition>
      wasAccurateEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasAccurate',
        value: value,
      ));
    });
  }
}

extension AIAnalysisHistoryQueryObject
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QFilterCondition> {}

extension AIAnalysisHistoryQueryLinks
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QFilterCondition> {}

extension AIAnalysisHistoryQuerySortBy
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QSortBy> {
  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByAiService() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiService', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByAiServiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiService', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByAnalysisType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisType', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByAnalysisTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisType', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByAnalyzedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzedAt', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByAnalyzedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzedAt', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByProcessingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByWasAccurate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      sortByWasAccurateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.desc);
    });
  }
}

extension AIAnalysisHistoryQuerySortThenBy
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QSortThenBy> {
  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByAiService() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiService', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByAiServiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiService', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByAnalysisType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisType', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByAnalysisTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisType', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByAnalyzedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzedAt', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByAnalyzedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analyzedAt', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByProcessingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByWasAccurate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.asc);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QAfterSortBy>
      thenByWasAccurateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.desc);
    });
  }
}

extension AIAnalysisHistoryQueryWhereDistinct
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct> {
  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByAiService({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiService', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByAnalysisType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'analysisType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByAnalyzedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'analyzedAt');
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByModelVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelVersion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processingTime');
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByUserFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userFeedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QDistinct>
      distinctByWasAccurate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasAccurate');
    });
  }
}

extension AIAnalysisHistoryQueryProperty
    on QueryBuilder<AIAnalysisHistory, AIAnalysisHistory, QQueryProperty> {
  QueryBuilder<AIAnalysisHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIAnalysisHistory, String, QQueryOperations>
      aiServiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiService');
    });
  }

  QueryBuilder<AIAnalysisHistory, String, QQueryOperations>
      analysisTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'analysisType');
    });
  }

  QueryBuilder<AIAnalysisHistory, DateTime, QQueryOperations>
      analyzedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'analyzedAt');
    });
  }

  QueryBuilder<AIAnalysisHistory, double, QQueryOperations>
      confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<AIAnalysisHistory, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<AIAnalysisHistory, String?, QQueryOperations>
      modelVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelVersion');
    });
  }

  QueryBuilder<AIAnalysisHistory, int?, QQueryOperations>
      processingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processingTime');
    });
  }

  QueryBuilder<AIAnalysisHistory, String?, QQueryOperations>
      userFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userFeedback');
    });
  }

  QueryBuilder<AIAnalysisHistory, bool?, QQueryOperations>
      wasAccurateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasAccurate');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAITrainingDataCollection on Isar {
  IsarCollection<AITrainingData> get aITrainingDatas => this.collection();
}

const AITrainingDataSchema = CollectionSchema(
  name: r'AITrainingData',
  id: -3026658755366667437,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'imagePath': PropertySchema(
      id: 1,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isUsedForTraining': PropertySchema(
      id: 2,
      name: r'isUsedForTraining',
      type: IsarType.bool,
    ),
    r'itemId': PropertySchema(
      id: 3,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'trainedAt': PropertySchema(
      id: 4,
      name: r'trainedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _aITrainingDataEstimateSize,
  serialize: _aITrainingDataSerialize,
  deserialize: _aITrainingDataDeserialize,
  deserializeProp: _aITrainingDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'itemId': IndexSchema(
      id: -5342806140158601489,
      name: r'itemId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'itemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _aITrainingDataGetId,
  getLinks: _aITrainingDataGetLinks,
  attach: _aITrainingDataAttach,
  version: '3.1.0+1',
);

int _aITrainingDataEstimateSize(
  AITrainingData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imagePath.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  return bytesCount;
}

void _aITrainingDataSerialize(
  AITrainingData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.imagePath);
  writer.writeBool(offsets[2], object.isUsedForTraining);
  writer.writeString(offsets[3], object.itemId);
  writer.writeDateTime(offsets[4], object.trainedAt);
}

AITrainingData _aITrainingDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AITrainingData();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.imagePath = reader.readString(offsets[1]);
  object.isUsedForTraining = reader.readBool(offsets[2]);
  object.itemId = reader.readString(offsets[3]);
  object.trainedAt = reader.readDateTimeOrNull(offsets[4]);
  return object;
}

P _aITrainingDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aITrainingDataGetId(AITrainingData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aITrainingDataGetLinks(AITrainingData object) {
  return [];
}

void _aITrainingDataAttach(
    IsarCollection<dynamic> col, Id id, AITrainingData object) {
  object.id = id;
}

extension AITrainingDataQueryWhereSort
    on QueryBuilder<AITrainingData, AITrainingData, QWhere> {
  QueryBuilder<AITrainingData, AITrainingData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AITrainingDataQueryWhere
    on QueryBuilder<AITrainingData, AITrainingData, QWhereClause> {
  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause> idBetween(
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause> itemIdEqualTo(
      String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterWhereClause>
      itemIdNotEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AITrainingDataQueryFilter
    on QueryBuilder<AITrainingData, AITrainingData, QFilterCondition> {
  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      isUsedForTrainingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUsedForTraining',
        value: value,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      trainedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trainedAt',
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      trainedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trainedAt',
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      trainedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      trainedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      trainedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterFilterCondition>
      trainedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AITrainingDataQueryObject
    on QueryBuilder<AITrainingData, AITrainingData, QFilterCondition> {}

extension AITrainingDataQueryLinks
    on QueryBuilder<AITrainingData, AITrainingData, QFilterCondition> {}

extension AITrainingDataQuerySortBy
    on QueryBuilder<AITrainingData, AITrainingData, QSortBy> {
  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      sortByIsUsedForTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsedForTraining', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      sortByIsUsedForTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsedForTraining', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> sortByTrainedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainedAt', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      sortByTrainedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainedAt', Sort.desc);
    });
  }
}

extension AITrainingDataQuerySortThenBy
    on QueryBuilder<AITrainingData, AITrainingData, QSortThenBy> {
  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      thenByIsUsedForTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsedForTraining', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      thenByIsUsedForTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsedForTraining', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy> thenByTrainedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainedAt', Sort.asc);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QAfterSortBy>
      thenByTrainedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainedAt', Sort.desc);
    });
  }
}

extension AITrainingDataQueryWhereDistinct
    on QueryBuilder<AITrainingData, AITrainingData, QDistinct> {
  QueryBuilder<AITrainingData, AITrainingData, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QDistinct>
      distinctByIsUsedForTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUsedForTraining');
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QDistinct> distinctByItemId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AITrainingData, AITrainingData, QDistinct>
      distinctByTrainedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainedAt');
    });
  }
}

extension AITrainingDataQueryProperty
    on QueryBuilder<AITrainingData, AITrainingData, QQueryProperty> {
  QueryBuilder<AITrainingData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AITrainingData, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AITrainingData, String, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<AITrainingData, bool, QQueryOperations>
      isUsedForTrainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUsedForTraining');
    });
  }

  QueryBuilder<AITrainingData, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<AITrainingData, DateTime?, QQueryOperations>
      trainedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIModelMetricsCollection on Isar {
  IsarCollection<AIModelMetrics> get aIModelMetrics => this.collection();
}

const AIModelMetricsSchema = CollectionSchema(
  name: r'AIModelMetrics',
  id: -6821105749247453465,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'commonMistakes': PropertySchema(
      id: 1,
      name: r'commonMistakes',
      type: IsarType.stringList,
    ),
    r'evaluatedAt': PropertySchema(
      id: 2,
      name: r'evaluatedAt',
      type: IsarType.dateTime,
    ),
    r'f1Score': PropertySchema(
      id: 3,
      name: r'f1Score',
      type: IsarType.double,
    ),
    r'modelName': PropertySchema(
      id: 4,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'modelVersion': PropertySchema(
      id: 5,
      name: r'modelVersion',
      type: IsarType.string,
    ),
    r'precision': PropertySchema(
      id: 6,
      name: r'precision',
      type: IsarType.double,
    ),
    r'recall': PropertySchema(
      id: 7,
      name: r'recall',
      type: IsarType.double,
    ),
    r'totalFeedback': PropertySchema(
      id: 8,
      name: r'totalFeedback',
      type: IsarType.long,
    ),
    r'userSatisfaction': PropertySchema(
      id: 9,
      name: r'userSatisfaction',
      type: IsarType.double,
    )
  },
  estimateSize: _aIModelMetricsEstimateSize,
  serialize: _aIModelMetricsSerialize,
  deserialize: _aIModelMetricsDeserialize,
  deserializeProp: _aIModelMetricsDeserializeProp,
  idName: r'id',
  indexes: {
    r'evaluatedAt': IndexSchema(
      id: -8596707528798101232,
      name: r'evaluatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'evaluatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _aIModelMetricsGetId,
  getLinks: _aIModelMetricsGetLinks,
  attach: _aIModelMetricsAttach,
  version: '3.1.0+1',
);

int _aIModelMetricsEstimateSize(
  AIModelMetrics object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.commonMistakes.length * 3;
  {
    for (var i = 0; i < object.commonMistakes.length; i++) {
      final value = object.commonMistakes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.modelName.length * 3;
  bytesCount += 3 + object.modelVersion.length * 3;
  return bytesCount;
}

void _aIModelMetricsSerialize(
  AIModelMetrics object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeStringList(offsets[1], object.commonMistakes);
  writer.writeDateTime(offsets[2], object.evaluatedAt);
  writer.writeDouble(offsets[3], object.f1Score);
  writer.writeString(offsets[4], object.modelName);
  writer.writeString(offsets[5], object.modelVersion);
  writer.writeDouble(offsets[6], object.precision);
  writer.writeDouble(offsets[7], object.recall);
  writer.writeLong(offsets[8], object.totalFeedback);
  writer.writeDouble(offsets[9], object.userSatisfaction);
}

AIModelMetrics _aIModelMetricsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIModelMetrics();
  object.accuracy = reader.readDouble(offsets[0]);
  object.commonMistakes = reader.readStringList(offsets[1]) ?? [];
  object.evaluatedAt = reader.readDateTime(offsets[2]);
  object.f1Score = reader.readDouble(offsets[3]);
  object.id = id;
  object.modelName = reader.readString(offsets[4]);
  object.modelVersion = reader.readString(offsets[5]);
  object.precision = reader.readDouble(offsets[6]);
  object.recall = reader.readDouble(offsets[7]);
  object.totalFeedback = reader.readLong(offsets[8]);
  object.userSatisfaction = reader.readDouble(offsets[9]);
  return object;
}

P _aIModelMetricsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aIModelMetricsGetId(AIModelMetrics object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIModelMetricsGetLinks(AIModelMetrics object) {
  return [];
}

void _aIModelMetricsAttach(
    IsarCollection<dynamic> col, Id id, AIModelMetrics object) {
  object.id = id;
}

extension AIModelMetricsQueryWhereSort
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QWhere> {
  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhere> anyEvaluatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'evaluatedAt'),
      );
    });
  }
}

extension AIModelMetricsQueryWhere
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QWhereClause> {
  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause> idBetween(
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

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause>
      evaluatedAtEqualTo(DateTime evaluatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'evaluatedAt',
        value: [evaluatedAt],
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause>
      evaluatedAtNotEqualTo(DateTime evaluatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'evaluatedAt',
              lower: [],
              upper: [evaluatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'evaluatedAt',
              lower: [evaluatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'evaluatedAt',
              lower: [evaluatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'evaluatedAt',
              lower: [],
              upper: [evaluatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause>
      evaluatedAtGreaterThan(
    DateTime evaluatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'evaluatedAt',
        lower: [evaluatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause>
      evaluatedAtLessThan(
    DateTime evaluatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'evaluatedAt',
        lower: [],
        upper: [evaluatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterWhereClause>
      evaluatedAtBetween(
    DateTime lowerEvaluatedAt,
    DateTime upperEvaluatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'evaluatedAt',
        lower: [lowerEvaluatedAt],
        includeLower: includeLower,
        upper: [upperEvaluatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AIModelMetricsQueryFilter
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QFilterCondition> {
  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commonMistakes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commonMistakes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonMistakes',
        value: '',
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commonMistakes',
        value: '',
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonMistakes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonMistakes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonMistakes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonMistakes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonMistakes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      commonMistakesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonMistakes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      evaluatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evaluatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      evaluatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'evaluatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      evaluatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'evaluatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      evaluatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'evaluatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      f1ScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'f1Score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      f1ScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'f1Score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      f1ScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'f1Score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      f1ScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'f1Score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
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

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
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

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: '',
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelName',
        value: '',
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      modelVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      precisionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precision',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      precisionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precision',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      precisionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precision',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      precisionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      recallEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recall',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      recallGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recall',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      recallLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recall',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      recallBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recall',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      totalFeedbackEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFeedback',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      totalFeedbackGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFeedback',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      totalFeedbackLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFeedback',
        value: value,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      totalFeedbackBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFeedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      userSatisfactionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userSatisfaction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      userSatisfactionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userSatisfaction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      userSatisfactionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userSatisfaction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterFilterCondition>
      userSatisfactionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userSatisfaction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension AIModelMetricsQueryObject
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QFilterCondition> {}

extension AIModelMetricsQueryLinks
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QFilterCondition> {}

extension AIModelMetricsQuerySortBy
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QSortBy> {
  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> sortByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByEvaluatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluatedAt', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByEvaluatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluatedAt', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> sortByF1Score() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f1Score', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByF1ScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f1Score', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> sortByPrecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precision', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByPrecisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precision', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> sortByRecall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recall', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByRecallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recall', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByTotalFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFeedback', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByTotalFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFeedback', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByUserSatisfaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSatisfaction', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      sortByUserSatisfactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSatisfaction', Sort.desc);
    });
  }
}

extension AIModelMetricsQuerySortThenBy
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QSortThenBy> {
  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByEvaluatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluatedAt', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByEvaluatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluatedAt', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenByF1Score() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f1Score', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByF1ScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f1Score', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenByPrecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precision', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByPrecisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precision', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy> thenByRecall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recall', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByRecallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recall', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByTotalFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFeedback', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByTotalFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFeedback', Sort.desc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByUserSatisfaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSatisfaction', Sort.asc);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QAfterSortBy>
      thenByUserSatisfactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSatisfaction', Sort.desc);
    });
  }
}

extension AIModelMetricsQueryWhereDistinct
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct> {
  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct> distinctByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracy');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct>
      distinctByCommonMistakes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonMistakes');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct>
      distinctByEvaluatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evaluatedAt');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct> distinctByF1Score() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'f1Score');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct> distinctByModelName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct>
      distinctByModelVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelVersion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct>
      distinctByPrecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precision');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct> distinctByRecall() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recall');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct>
      distinctByTotalFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFeedback');
    });
  }

  QueryBuilder<AIModelMetrics, AIModelMetrics, QDistinct>
      distinctByUserSatisfaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userSatisfaction');
    });
  }
}

extension AIModelMetricsQueryProperty
    on QueryBuilder<AIModelMetrics, AIModelMetrics, QQueryProperty> {
  QueryBuilder<AIModelMetrics, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIModelMetrics, double, QQueryOperations> accuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracy');
    });
  }

  QueryBuilder<AIModelMetrics, List<String>, QQueryOperations>
      commonMistakesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonMistakes');
    });
  }

  QueryBuilder<AIModelMetrics, DateTime, QQueryOperations>
      evaluatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evaluatedAt');
    });
  }

  QueryBuilder<AIModelMetrics, double, QQueryOperations> f1ScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'f1Score');
    });
  }

  QueryBuilder<AIModelMetrics, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<AIModelMetrics, String, QQueryOperations>
      modelVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelVersion');
    });
  }

  QueryBuilder<AIModelMetrics, double, QQueryOperations> precisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precision');
    });
  }

  QueryBuilder<AIModelMetrics, double, QQueryOperations> recallProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recall');
    });
  }

  QueryBuilder<AIModelMetrics, int, QQueryOperations> totalFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFeedback');
    });
  }

  QueryBuilder<AIModelMetrics, double, QQueryOperations>
      userSatisfactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userSatisfaction');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCustomTaggingRuleCollection on Isar {
  IsarCollection<CustomTaggingRule> get customTaggingRules => this.collection();
}

const CustomTaggingRuleSchema = CollectionSchema(
  name: r'CustomTaggingRule',
  id: 2899862106483161159,
  properties: {
    r'categoryToAssign': PropertySchema(
      id: 0,
      name: r'categoryToAssign',
      type: IsarType.string,
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
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'lastTriggered': PropertySchema(
      id: 4,
      name: r'lastTriggered',
      type: IsarType.dateTime,
    ),
    r'priority': PropertySchema(
      id: 5,
      name: r'priority',
      type: IsarType.long,
    ),
    r'ruleName': PropertySchema(
      id: 6,
      name: r'ruleName',
      type: IsarType.string,
    ),
    r'tagsToAdd': PropertySchema(
      id: 7,
      name: r'tagsToAdd',
      type: IsarType.stringList,
    ),
    r'tagsToRemove': PropertySchema(
      id: 8,
      name: r'tagsToRemove',
      type: IsarType.stringList,
    ),
    r'timesTriggered': PropertySchema(
      id: 9,
      name: r'timesTriggered',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _customTaggingRuleEstimateSize,
  serialize: _customTaggingRuleSerialize,
  deserialize: _customTaggingRuleDeserialize,
  deserializeProp: _customTaggingRuleDeserializeProp,
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
  getId: _customTaggingRuleGetId,
  getLinks: _customTaggingRuleGetLinks,
  attach: _customTaggingRuleAttach,
  version: '3.1.0+1',
);

int _customTaggingRuleEstimateSize(
  CustomTaggingRule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.categoryToAssign;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ruleName.length * 3;
  bytesCount += 3 + object.tagsToAdd.length * 3;
  {
    for (var i = 0; i < object.tagsToAdd.length; i++) {
      final value = object.tagsToAdd[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.tagsToRemove.length * 3;
  {
    for (var i = 0; i < object.tagsToRemove.length; i++) {
      final value = object.tagsToRemove[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _customTaggingRuleSerialize(
  CustomTaggingRule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryToAssign);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeDateTime(offsets[4], object.lastTriggered);
  writer.writeLong(offsets[5], object.priority);
  writer.writeString(offsets[6], object.ruleName);
  writer.writeStringList(offsets[7], object.tagsToAdd);
  writer.writeStringList(offsets[8], object.tagsToRemove);
  writer.writeLong(offsets[9], object.timesTriggered);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeString(offsets[11], object.userId);
}

CustomTaggingRule _customTaggingRuleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomTaggingRule();
  object.categoryToAssign = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.lastTriggered = reader.readDateTimeOrNull(offsets[4]);
  object.priority = reader.readLong(offsets[5]);
  object.ruleName = reader.readString(offsets[6]);
  object.tagsToAdd = reader.readStringList(offsets[7]) ?? [];
  object.tagsToRemove = reader.readStringList(offsets[8]) ?? [];
  object.timesTriggered = reader.readLong(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.userId = reader.readString(offsets[11]);
  return object;
}

P _customTaggingRuleDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _customTaggingRuleGetId(CustomTaggingRule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _customTaggingRuleGetLinks(
    CustomTaggingRule object) {
  return [];
}

void _customTaggingRuleAttach(
    IsarCollection<dynamic> col, Id id, CustomTaggingRule object) {
  object.id = id;
}

extension CustomTaggingRuleQueryWhereSort
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QWhere> {
  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CustomTaggingRuleQueryWhere
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QWhereClause> {
  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterWhereClause>
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

extension CustomTaggingRuleQueryFilter
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QFilterCondition> {
  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryToAssign',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryToAssign',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryToAssign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryToAssign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryToAssign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryToAssign',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryToAssign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryToAssign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryToAssign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryToAssign',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryToAssign',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      categoryToAssignIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryToAssign',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      lastTriggeredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTriggered',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      lastTriggeredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTriggered',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      lastTriggeredEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      lastTriggeredGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      lastTriggeredLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      lastTriggeredBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTriggered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      ruleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagsToAdd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagsToAdd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagsToAdd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagsToAdd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagsToAdd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagsToAdd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagsToAdd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagsToAdd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagsToAdd',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagsToAdd',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToAdd',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToAdd',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToAdd',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToAdd',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToAdd',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToAddLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToAdd',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagsToRemove',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagsToRemove',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagsToRemove',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagsToRemove',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagsToRemove',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagsToRemove',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagsToRemove',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagsToRemove',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagsToRemove',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagsToRemove',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToRemove',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToRemove',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToRemove',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToRemove',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToRemove',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      tagsToRemoveLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagsToRemove',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      timesTriggeredEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      timesTriggeredGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      timesTriggeredLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      timesTriggeredBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesTriggered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
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

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension CustomTaggingRuleQueryObject
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QFilterCondition> {}

extension CustomTaggingRuleQueryLinks
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QFilterCondition> {}

extension CustomTaggingRuleQuerySortBy
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QSortBy> {
  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByCategoryToAssign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryToAssign', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByCategoryToAssignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryToAssign', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByLastTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTriggered', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByLastTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTriggered', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByTimesTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesTriggered', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByTimesTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesTriggered', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CustomTaggingRuleQuerySortThenBy
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QSortThenBy> {
  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByCategoryToAssign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryToAssign', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByCategoryToAssignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryToAssign', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByLastTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTriggered', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByLastTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTriggered', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByTimesTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesTriggered', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByTimesTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesTriggered', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CustomTaggingRuleQueryWhereDistinct
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct> {
  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByCategoryToAssign({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryToAssign',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByLastTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTriggered');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByRuleName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByTagsToAdd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagsToAdd');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByTagsToRemove() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagsToRemove');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByTimesTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesTriggered');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CustomTaggingRule, CustomTaggingRule, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension CustomTaggingRuleQueryProperty
    on QueryBuilder<CustomTaggingRule, CustomTaggingRule, QQueryProperty> {
  QueryBuilder<CustomTaggingRule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CustomTaggingRule, String?, QQueryOperations>
      categoryToAssignProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryToAssign');
    });
  }

  QueryBuilder<CustomTaggingRule, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CustomTaggingRule, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CustomTaggingRule, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<CustomTaggingRule, DateTime?, QQueryOperations>
      lastTriggeredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTriggered');
    });
  }

  QueryBuilder<CustomTaggingRule, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<CustomTaggingRule, String, QQueryOperations> ruleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleName');
    });
  }

  QueryBuilder<CustomTaggingRule, List<String>, QQueryOperations>
      tagsToAddProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagsToAdd');
    });
  }

  QueryBuilder<CustomTaggingRule, List<String>, QQueryOperations>
      tagsToRemoveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagsToRemove');
    });
  }

  QueryBuilder<CustomTaggingRule, int, QQueryOperations>
      timesTriggeredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesTriggered');
    });
  }

  QueryBuilder<CustomTaggingRule, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CustomTaggingRule, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetConfidenceCalibrationCollection on Isar {
  IsarCollection<ConfidenceCalibration> get confidenceCalibrations =>
      this.collection();
}

const ConfidenceCalibrationSchema = CollectionSchema(
  name: r'ConfidenceCalibration',
  id: 1839195473185602565,
  properties: {
    r'calculatedAt': PropertySchema(
      id: 0,
      name: r'calculatedAt',
      type: IsarType.dateTime,
    ),
    r'expectedCalibrationError': PropertySchema(
      id: 1,
      name: r'expectedCalibrationError',
      type: IsarType.double,
    ),
    r'maximumCalibrationError': PropertySchema(
      id: 2,
      name: r'maximumCalibrationError',
      type: IsarType.double,
    ),
    r'modelType': PropertySchema(
      id: 3,
      name: r'modelType',
      type: IsarType.string,
    )
  },
  estimateSize: _confidenceCalibrationEstimateSize,
  serialize: _confidenceCalibrationSerialize,
  deserialize: _confidenceCalibrationDeserialize,
  deserializeProp: _confidenceCalibrationDeserializeProp,
  idName: r'id',
  indexes: {
    r'calculatedAt': IndexSchema(
      id: -1800937546775664298,
      name: r'calculatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'calculatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _confidenceCalibrationGetId,
  getLinks: _confidenceCalibrationGetLinks,
  attach: _confidenceCalibrationAttach,
  version: '3.1.0+1',
);

int _confidenceCalibrationEstimateSize(
  ConfidenceCalibration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.modelType.length * 3;
  return bytesCount;
}

void _confidenceCalibrationSerialize(
  ConfidenceCalibration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.calculatedAt);
  writer.writeDouble(offsets[1], object.expectedCalibrationError);
  writer.writeDouble(offsets[2], object.maximumCalibrationError);
  writer.writeString(offsets[3], object.modelType);
}

ConfidenceCalibration _confidenceCalibrationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ConfidenceCalibration();
  object.calculatedAt = reader.readDateTime(offsets[0]);
  object.expectedCalibrationError = reader.readDouble(offsets[1]);
  object.id = id;
  object.maximumCalibrationError = reader.readDouble(offsets[2]);
  object.modelType = reader.readString(offsets[3]);
  return object;
}

P _confidenceCalibrationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _confidenceCalibrationGetId(ConfidenceCalibration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _confidenceCalibrationGetLinks(
    ConfidenceCalibration object) {
  return [];
}

void _confidenceCalibrationAttach(
    IsarCollection<dynamic> col, Id id, ConfidenceCalibration object) {
  object.id = id;
}

extension ConfidenceCalibrationQueryWhereSort
    on QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QWhere> {
  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhere>
      anyCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'calculatedAt'),
      );
    });
  }
}

extension ConfidenceCalibrationQueryWhere on QueryBuilder<ConfidenceCalibration,
    ConfidenceCalibration, QWhereClause> {
  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
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

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
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

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      calculatedAtEqualTo(DateTime calculatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'calculatedAt',
        value: [calculatedAt],
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      calculatedAtNotEqualTo(DateTime calculatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'calculatedAt',
              lower: [],
              upper: [calculatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'calculatedAt',
              lower: [calculatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'calculatedAt',
              lower: [calculatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'calculatedAt',
              lower: [],
              upper: [calculatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      calculatedAtGreaterThan(
    DateTime calculatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'calculatedAt',
        lower: [calculatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      calculatedAtLessThan(
    DateTime calculatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'calculatedAt',
        lower: [],
        upper: [calculatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterWhereClause>
      calculatedAtBetween(
    DateTime lowerCalculatedAt,
    DateTime upperCalculatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'calculatedAt',
        lower: [lowerCalculatedAt],
        includeLower: includeLower,
        upper: [upperCalculatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfidenceCalibrationQueryFilter on QueryBuilder<
    ConfidenceCalibration, ConfidenceCalibration, QFilterCondition> {
  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> calculatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> calculatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calculatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> calculatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calculatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> calculatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calculatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> expectedCalibrationErrorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedCalibrationError',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> expectedCalibrationErrorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedCalibrationError',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> expectedCalibrationErrorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedCalibrationError',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> expectedCalibrationErrorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedCalibrationError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
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

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
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

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
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

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> maximumCalibrationErrorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maximumCalibrationError',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> maximumCalibrationErrorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maximumCalibrationError',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> maximumCalibrationErrorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maximumCalibrationError',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> maximumCalibrationErrorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maximumCalibrationError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
          QAfterFilterCondition>
      modelTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
          QAfterFilterCondition>
      modelTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelType',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration,
      QAfterFilterCondition> modelTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelType',
        value: '',
      ));
    });
  }
}

extension ConfidenceCalibrationQueryObject on QueryBuilder<
    ConfidenceCalibration, ConfidenceCalibration, QFilterCondition> {}

extension ConfidenceCalibrationQueryLinks on QueryBuilder<ConfidenceCalibration,
    ConfidenceCalibration, QFilterCondition> {}

extension ConfidenceCalibrationQuerySortBy
    on QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QSortBy> {
  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByExpectedCalibrationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCalibrationError', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByExpectedCalibrationErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCalibrationError', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByMaximumCalibrationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCalibrationError', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByMaximumCalibrationErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCalibrationError', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByModelType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelType', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      sortByModelTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelType', Sort.desc);
    });
  }
}

extension ConfidenceCalibrationQuerySortThenBy
    on QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QSortThenBy> {
  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByExpectedCalibrationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCalibrationError', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByExpectedCalibrationErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedCalibrationError', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByMaximumCalibrationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCalibrationError', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByMaximumCalibrationErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCalibrationError', Sort.desc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByModelType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelType', Sort.asc);
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QAfterSortBy>
      thenByModelTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelType', Sort.desc);
    });
  }
}

extension ConfidenceCalibrationQueryWhereDistinct
    on QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QDistinct> {
  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QDistinct>
      distinctByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedAt');
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QDistinct>
      distinctByExpectedCalibrationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedCalibrationError');
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QDistinct>
      distinctByMaximumCalibrationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maximumCalibrationError');
    });
  }

  QueryBuilder<ConfidenceCalibration, ConfidenceCalibration, QDistinct>
      distinctByModelType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelType', caseSensitive: caseSensitive);
    });
  }
}

extension ConfidenceCalibrationQueryProperty on QueryBuilder<
    ConfidenceCalibration, ConfidenceCalibration, QQueryProperty> {
  QueryBuilder<ConfidenceCalibration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ConfidenceCalibration, DateTime, QQueryOperations>
      calculatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedAt');
    });
  }

  QueryBuilder<ConfidenceCalibration, double, QQueryOperations>
      expectedCalibrationErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedCalibrationError');
    });
  }

  QueryBuilder<ConfidenceCalibration, double, QQueryOperations>
      maximumCalibrationErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maximumCalibrationError');
    });
  }

  QueryBuilder<ConfidenceCalibration, String, QQueryOperations>
      modelTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelType');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAISuggestionFeedbackCollection on Isar {
  IsarCollection<AISuggestionFeedback> get aISuggestionFeedbacks =>
      this.collection();
}

const AISuggestionFeedbackSchema = CollectionSchema(
  name: r'AISuggestionFeedback',
  id: 99944215295718807,
  properties: {
    r'aiConfidence': PropertySchema(
      id: 0,
      name: r'aiConfidence',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'itemId': PropertySchema(
      id: 2,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'respondedAt': PropertySchema(
      id: 3,
      name: r'respondedAt',
      type: IsarType.dateTime,
    ),
    r'suggestion': PropertySchema(
      id: 4,
      name: r'suggestion',
      type: IsarType.string,
    ),
    r'suggestionType': PropertySchema(
      id: 5,
      name: r'suggestionType',
      type: IsarType.string,
    ),
    r'userCorrection': PropertySchema(
      id: 6,
      name: r'userCorrection',
      type: IsarType.string,
    ),
    r'userFeedback': PropertySchema(
      id: 7,
      name: r'userFeedback',
      type: IsarType.string,
      enumMap: _AISuggestionFeedbackuserFeedbackEnumValueMap,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _aISuggestionFeedbackEstimateSize,
  serialize: _aISuggestionFeedbackSerialize,
  deserialize: _aISuggestionFeedbackDeserialize,
  deserializeProp: _aISuggestionFeedbackDeserializeProp,
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
    r'itemId': IndexSchema(
      id: -5342806140158601489,
      name: r'itemId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'itemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _aISuggestionFeedbackGetId,
  getLinks: _aISuggestionFeedbackGetLinks,
  attach: _aISuggestionFeedbackAttach,
  version: '3.1.0+1',
);

int _aISuggestionFeedbackEstimateSize(
  AISuggestionFeedback object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.suggestion.length * 3;
  bytesCount += 3 + object.suggestionType.length * 3;
  {
    final value = object.userCorrection;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userFeedback.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _aISuggestionFeedbackSerialize(
  AISuggestionFeedback object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.aiConfidence);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.itemId);
  writer.writeDateTime(offsets[3], object.respondedAt);
  writer.writeString(offsets[4], object.suggestion);
  writer.writeString(offsets[5], object.suggestionType);
  writer.writeString(offsets[6], object.userCorrection);
  writer.writeString(offsets[7], object.userFeedback.name);
  writer.writeString(offsets[8], object.userId);
}

AISuggestionFeedback _aISuggestionFeedbackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AISuggestionFeedback();
  object.aiConfidence = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.itemId = reader.readString(offsets[2]);
  object.respondedAt = reader.readDateTimeOrNull(offsets[3]);
  object.suggestion = reader.readString(offsets[4]);
  object.suggestionType = reader.readString(offsets[5]);
  object.userCorrection = reader.readStringOrNull(offsets[6]);
  object.userFeedback = _AISuggestionFeedbackuserFeedbackValueEnumMap[
          reader.readStringOrNull(offsets[7])] ??
      FeedbackType.accepted;
  object.userId = reader.readString(offsets[8]);
  return object;
}

P _aISuggestionFeedbackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_AISuggestionFeedbackuserFeedbackValueEnumMap[
              reader.readStringOrNull(offset)] ??
          FeedbackType.accepted) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AISuggestionFeedbackuserFeedbackEnumValueMap = {
  r'accepted': r'accepted',
  r'rejected': r'rejected',
  r'modified': r'modified',
  r'ignored': r'ignored',
};
const _AISuggestionFeedbackuserFeedbackValueEnumMap = {
  r'accepted': FeedbackType.accepted,
  r'rejected': FeedbackType.rejected,
  r'modified': FeedbackType.modified,
  r'ignored': FeedbackType.ignored,
};

Id _aISuggestionFeedbackGetId(AISuggestionFeedback object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aISuggestionFeedbackGetLinks(
    AISuggestionFeedback object) {
  return [];
}

void _aISuggestionFeedbackAttach(
    IsarCollection<dynamic> col, Id id, AISuggestionFeedback object) {
  object.id = id;
}

extension AISuggestionFeedbackQueryWhereSort
    on QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QWhere> {
  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AISuggestionFeedbackQueryWhere
    on QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QWhereClause> {
  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
      itemIdEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterWhereClause>
      itemIdNotEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AISuggestionFeedbackQueryFilter on QueryBuilder<AISuggestionFeedback,
    AISuggestionFeedback, QFilterCondition> {
  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> aiConfidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> aiConfidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aiConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> aiConfidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aiConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> aiConfidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aiConfidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> respondedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'respondedAt',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> respondedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'respondedAt',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> respondedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'respondedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> respondedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'respondedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> respondedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'respondedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> respondedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'respondedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      suggestionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      suggestionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestion',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestion',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      suggestionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      suggestionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestionType',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> suggestionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestionType',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userCorrection',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userCorrection',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userCorrection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userCorrection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userCorrection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userCorrection',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userCorrection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userCorrection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      userCorrectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userCorrection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      userCorrectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userCorrection',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userCorrection',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userCorrectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userCorrection',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackEqualTo(
    FeedbackType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackGreaterThan(
    FeedbackType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackLessThan(
    FeedbackType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackBetween(
    FeedbackType lower,
    FeedbackType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userFeedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      userFeedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
          QAfterFilterCondition>
      userFeedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userFeedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userFeedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
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

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension AISuggestionFeedbackQueryObject on QueryBuilder<AISuggestionFeedback,
    AISuggestionFeedback, QFilterCondition> {}

extension AISuggestionFeedbackQueryLinks on QueryBuilder<AISuggestionFeedback,
    AISuggestionFeedback, QFilterCondition> {}

extension AISuggestionFeedbackQuerySortBy
    on QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QSortBy> {
  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByAiConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiConfidence', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByAiConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiConfidence', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByRespondedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondedAt', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByRespondedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondedAt', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortBySuggestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestion', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortBySuggestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestion', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortBySuggestionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionType', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortBySuggestionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionType', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByUserCorrection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCorrection', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByUserCorrectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCorrection', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AISuggestionFeedbackQuerySortThenBy
    on QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QSortThenBy> {
  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByAiConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiConfidence', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByAiConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiConfidence', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByRespondedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondedAt', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByRespondedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondedAt', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenBySuggestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestion', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenBySuggestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestion', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenBySuggestionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionType', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenBySuggestionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionType', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByUserCorrection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCorrection', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByUserCorrectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCorrection', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AISuggestionFeedbackQueryWhereDistinct
    on QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct> {
  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByAiConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiConfidence');
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByRespondedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'respondedAt');
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctBySuggestion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctBySuggestionType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestionType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByUserCorrection({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userCorrection',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByUserFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userFeedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AISuggestionFeedback, AISuggestionFeedback, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension AISuggestionFeedbackQueryProperty on QueryBuilder<
    AISuggestionFeedback, AISuggestionFeedback, QQueryProperty> {
  QueryBuilder<AISuggestionFeedback, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AISuggestionFeedback, double, QQueryOperations>
      aiConfidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiConfidence');
    });
  }

  QueryBuilder<AISuggestionFeedback, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AISuggestionFeedback, String, QQueryOperations>
      itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<AISuggestionFeedback, DateTime?, QQueryOperations>
      respondedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'respondedAt');
    });
  }

  QueryBuilder<AISuggestionFeedback, String, QQueryOperations>
      suggestionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestion');
    });
  }

  QueryBuilder<AISuggestionFeedback, String, QQueryOperations>
      suggestionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestionType');
    });
  }

  QueryBuilder<AISuggestionFeedback, String?, QQueryOperations>
      userCorrectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userCorrection');
    });
  }

  QueryBuilder<AISuggestionFeedback, FeedbackType, QQueryOperations>
      userFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userFeedback');
    });
  }

  QueryBuilder<AISuggestionFeedback, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIBatchJobCollection on Isar {
  IsarCollection<AIBatchJob> get aIBatchJobs => this.collection();
}

const AIBatchJobSchema = CollectionSchema(
  name: r'AIBatchJob',
  id: 2596858580013615773,
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
    r'errorMessages': PropertySchema(
      id: 2,
      name: r'errorMessages',
      type: IsarType.stringList,
    ),
    r'failedItems': PropertySchema(
      id: 3,
      name: r'failedItems',
      type: IsarType.long,
    ),
    r'jobName': PropertySchema(
      id: 4,
      name: r'jobName',
      type: IsarType.string,
    ),
    r'jobType': PropertySchema(
      id: 5,
      name: r'jobType',
      type: IsarType.string,
    ),
    r'processedItems': PropertySchema(
      id: 6,
      name: r'processedItems',
      type: IsarType.long,
    ),
    r'startedAt': PropertySchema(
      id: 7,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
      enumMap: _AIBatchJobstatusEnumValueMap,
    ),
    r'successfulItems': PropertySchema(
      id: 9,
      name: r'successfulItems',
      type: IsarType.long,
    ),
    r'totalItems': PropertySchema(
      id: 10,
      name: r'totalItems',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _aIBatchJobEstimateSize,
  serialize: _aIBatchJobSerialize,
  deserialize: _aIBatchJobDeserialize,
  deserializeProp: _aIBatchJobDeserializeProp,
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
  getId: _aIBatchJobGetId,
  getLinks: _aIBatchJobGetLinks,
  attach: _aIBatchJobAttach,
  version: '3.1.0+1',
);

int _aIBatchJobEstimateSize(
  AIBatchJob object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.errorMessages.length * 3;
  {
    for (var i = 0; i < object.errorMessages.length; i++) {
      final value = object.errorMessages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.jobName.length * 3;
  bytesCount += 3 + object.jobType.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _aIBatchJobSerialize(
  AIBatchJob object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeStringList(offsets[2], object.errorMessages);
  writer.writeLong(offsets[3], object.failedItems);
  writer.writeString(offsets[4], object.jobName);
  writer.writeString(offsets[5], object.jobType);
  writer.writeLong(offsets[6], object.processedItems);
  writer.writeDateTime(offsets[7], object.startedAt);
  writer.writeString(offsets[8], object.status.name);
  writer.writeLong(offsets[9], object.successfulItems);
  writer.writeLong(offsets[10], object.totalItems);
  writer.writeString(offsets[11], object.userId);
}

AIBatchJob _aIBatchJobDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIBatchJob();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.errorMessages = reader.readStringList(offsets[2]) ?? [];
  object.failedItems = reader.readLong(offsets[3]);
  object.id = id;
  object.jobName = reader.readString(offsets[4]);
  object.jobType = reader.readString(offsets[5]);
  object.processedItems = reader.readLong(offsets[6]);
  object.startedAt = reader.readDateTimeOrNull(offsets[7]);
  object.status =
      _AIBatchJobstatusValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          BatchJobStatus.pending;
  object.successfulItems = reader.readLong(offsets[9]);
  object.totalItems = reader.readLong(offsets[10]);
  object.userId = reader.readString(offsets[11]);
  return object;
}

P _aIBatchJobDeserializeProp<P>(
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
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (_AIBatchJobstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          BatchJobStatus.pending) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AIBatchJobstatusEnumValueMap = {
  r'pending': r'pending',
  r'running': r'running',
  r'completed': r'completed',
  r'failed': r'failed',
  r'cancelled': r'cancelled',
};
const _AIBatchJobstatusValueEnumMap = {
  r'pending': BatchJobStatus.pending,
  r'running': BatchJobStatus.running,
  r'completed': BatchJobStatus.completed,
  r'failed': BatchJobStatus.failed,
  r'cancelled': BatchJobStatus.cancelled,
};

Id _aIBatchJobGetId(AIBatchJob object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIBatchJobGetLinks(AIBatchJob object) {
  return [];
}

void _aIBatchJobAttach(IsarCollection<dynamic> col, Id id, AIBatchJob object) {
  object.id = id;
}

extension AIBatchJobQueryWhereSort
    on QueryBuilder<AIBatchJob, AIBatchJob, QWhere> {
  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AIBatchJobQueryWhere
    on QueryBuilder<AIBatchJob, AIBatchJob, QWhereClause> {
  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> idBetween(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterWhereClause> userIdNotEqualTo(
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
}

extension AIBatchJobQueryFilter
    on QueryBuilder<AIBatchJob, AIBatchJob, QFilterCondition> {
  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessages',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessages',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorMessages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorMessages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorMessages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorMessages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorMessages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      errorMessagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorMessages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      failedItemsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      failedItemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'failedItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      failedItemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'failedItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      failedItemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'failedItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      jobNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobName',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      jobNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobName',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      jobTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> jobTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobType',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      jobTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobType',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      processedItemsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processedItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      processedItemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processedItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      processedItemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processedItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      processedItemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processedItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> startedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> startedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> startedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusEqualTo(
    BatchJobStatus value, {
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusGreaterThan(
    BatchJobStatus value, {
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusLessThan(
    BatchJobStatus value, {
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusBetween(
    BatchJobStatus lower,
    BatchJobStatus upper, {
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusContains(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      successfulItemsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'successfulItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      successfulItemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'successfulItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      successfulItemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'successfulItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      successfulItemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'successfulItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> totalItemsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      totalItemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      totalItemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalItems',
        value: value,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> totalItemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdContains(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdMatches(
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

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension AIBatchJobQueryObject
    on QueryBuilder<AIBatchJob, AIBatchJob, QFilterCondition> {}

extension AIBatchJobQueryLinks
    on QueryBuilder<AIBatchJob, AIBatchJob, QFilterCondition> {}

extension AIBatchJobQuerySortBy
    on QueryBuilder<AIBatchJob, AIBatchJob, QSortBy> {
  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByFailedItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByFailedItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByJobName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobName', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByJobNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobName', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByJobType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByJobTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByProcessedItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy>
      sortByProcessedItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortBySuccessfulItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy>
      sortBySuccessfulItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByTotalItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByTotalItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AIBatchJobQuerySortThenBy
    on QueryBuilder<AIBatchJob, AIBatchJob, QSortThenBy> {
  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByFailedItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByFailedItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByJobName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobName', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByJobNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobName', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByJobType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByJobTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByProcessedItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy>
      thenByProcessedItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenBySuccessfulItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy>
      thenBySuccessfulItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByTotalItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByTotalItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.desc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AIBatchJobQueryWhereDistinct
    on QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> {
  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByErrorMessages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessages');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByFailedItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failedItems');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByJobName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByJobType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByProcessedItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processedItems');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctBySuccessfulItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'successfulItems');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByTotalItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItems');
    });
  }

  QueryBuilder<AIBatchJob, AIBatchJob, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension AIBatchJobQueryProperty
    on QueryBuilder<AIBatchJob, AIBatchJob, QQueryProperty> {
  QueryBuilder<AIBatchJob, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIBatchJob, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<AIBatchJob, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AIBatchJob, List<String>, QQueryOperations>
      errorMessagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessages');
    });
  }

  QueryBuilder<AIBatchJob, int, QQueryOperations> failedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failedItems');
    });
  }

  QueryBuilder<AIBatchJob, String, QQueryOperations> jobNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobName');
    });
  }

  QueryBuilder<AIBatchJob, String, QQueryOperations> jobTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobType');
    });
  }

  QueryBuilder<AIBatchJob, int, QQueryOperations> processedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processedItems');
    });
  }

  QueryBuilder<AIBatchJob, DateTime?, QQueryOperations> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<AIBatchJob, BatchJobStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<AIBatchJob, int, QQueryOperations> successfulItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'successfulItems');
    });
  }

  QueryBuilder<AIBatchJob, int, QQueryOperations> totalItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItems');
    });
  }

  QueryBuilder<AIBatchJob, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAISettingsCollection on Isar {
  IsarCollection<AISettings> get aISettings => this.collection();
}

const AISettingsSchema = CollectionSchema(
  name: r'AISettings',
  id: 8857511489252484841,
  properties: {
    r'allowDataCollection': PropertySchema(
      id: 0,
      name: r'allowDataCollection',
      type: IsarType.bool,
    ),
    r'allowModelTraining': PropertySchema(
      id: 1,
      name: r'allowModelTraining',
      type: IsarType.bool,
    ),
    r'enableAutoTagging': PropertySchema(
      id: 2,
      name: r'enableAutoTagging',
      type: IsarType.bool,
    ),
    r'enableBrandDetection': PropertySchema(
      id: 3,
      name: r'enableBrandDetection',
      type: IsarType.bool,
    ),
    r'enableConditionAssessment': PropertySchema(
      id: 4,
      name: r'enableConditionAssessment',
      type: IsarType.bool,
    ),
    r'enableSizeEstimation': PropertySchema(
      id: 5,
      name: r'enableSizeEstimation',
      type: IsarType.bool,
    ),
    r'minimumConfidence': PropertySchema(
      id: 6,
      name: r'minimumConfidence',
      type: IsarType.double,
    ),
    r'notifyOnAnalysisComplete': PropertySchema(
      id: 7,
      name: r'notifyOnAnalysisComplete',
      type: IsarType.bool,
    ),
    r'notifyOnLowConfidence': PropertySchema(
      id: 8,
      name: r'notifyOnLowConfidence',
      type: IsarType.bool,
    ),
    r'requireMultipleServices': PropertySchema(
      id: 9,
      name: r'requireMultipleServices',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _aISettingsEstimateSize,
  serialize: _aISettingsSerialize,
  deserialize: _aISettingsDeserialize,
  deserializeProp: _aISettingsDeserializeProp,
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
  getId: _aISettingsGetId,
  getLinks: _aISettingsGetLinks,
  attach: _aISettingsAttach,
  version: '3.1.0+1',
);

int _aISettingsEstimateSize(
  AISettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _aISettingsSerialize(
  AISettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.allowDataCollection);
  writer.writeBool(offsets[1], object.allowModelTraining);
  writer.writeBool(offsets[2], object.enableAutoTagging);
  writer.writeBool(offsets[3], object.enableBrandDetection);
  writer.writeBool(offsets[4], object.enableConditionAssessment);
  writer.writeBool(offsets[5], object.enableSizeEstimation);
  writer.writeDouble(offsets[6], object.minimumConfidence);
  writer.writeBool(offsets[7], object.notifyOnAnalysisComplete);
  writer.writeBool(offsets[8], object.notifyOnLowConfidence);
  writer.writeBool(offsets[9], object.requireMultipleServices);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeString(offsets[11], object.userId);
}

AISettings _aISettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AISettings();
  object.allowDataCollection = reader.readBool(offsets[0]);
  object.allowModelTraining = reader.readBool(offsets[1]);
  object.enableAutoTagging = reader.readBool(offsets[2]);
  object.enableBrandDetection = reader.readBool(offsets[3]);
  object.enableConditionAssessment = reader.readBool(offsets[4]);
  object.enableSizeEstimation = reader.readBool(offsets[5]);
  object.id = id;
  object.minimumConfidence = reader.readDouble(offsets[6]);
  object.notifyOnAnalysisComplete = reader.readBool(offsets[7]);
  object.notifyOnLowConfidence = reader.readBool(offsets[8]);
  object.requireMultipleServices = reader.readBool(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.userId = reader.readString(offsets[11]);
  return object;
}

P _aISettingsDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aISettingsGetId(AISettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aISettingsGetLinks(AISettings object) {
  return [];
}

void _aISettingsAttach(IsarCollection<dynamic> col, Id id, AISettings object) {
  object.id = id;
}

extension AISettingsByIndex on IsarCollection<AISettings> {
  Future<AISettings?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  AISettings? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<AISettings?>> getAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<AISettings?> getAllByUserIdSync(List<String> userIdValues) {
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

  Future<Id> putByUserId(AISettings object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(AISettings object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<AISettings> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<AISettings> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension AISettingsQueryWhereSort
    on QueryBuilder<AISettings, AISettings, QWhere> {
  QueryBuilder<AISettings, AISettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AISettingsQueryWhere
    on QueryBuilder<AISettings, AISettings, QWhereClause> {
  QueryBuilder<AISettings, AISettings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AISettings, AISettings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterWhereClause> idBetween(
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

  QueryBuilder<AISettings, AISettings, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterWhereClause> userIdNotEqualTo(
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
}

extension AISettingsQueryFilter
    on QueryBuilder<AISettings, AISettings, QFilterCondition> {
  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      allowDataCollectionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowDataCollection',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      allowModelTrainingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowModelTraining',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      enableAutoTaggingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableAutoTagging',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      enableBrandDetectionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableBrandDetection',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      enableConditionAssessmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableConditionAssessment',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      enableSizeEstimationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableSizeEstimation',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      minimumConfidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      minimumConfidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      minimumConfidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumConfidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      minimumConfidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumConfidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      notifyOnAnalysisCompleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnAnalysisComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      notifyOnLowConfidenceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnLowConfidence',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      requireMultipleServicesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requireMultipleServices',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdContains(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdMatches(
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

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension AISettingsQueryObject
    on QueryBuilder<AISettings, AISettings, QFilterCondition> {}

extension AISettingsQueryLinks
    on QueryBuilder<AISettings, AISettings, QFilterCondition> {}

extension AISettingsQuerySortBy
    on QueryBuilder<AISettings, AISettings, QSortBy> {
  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByAllowDataCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDataCollection', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByAllowDataCollectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDataCollection', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByAllowModelTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowModelTraining', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByAllowModelTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowModelTraining', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> sortByEnableAutoTagging() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAutoTagging', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableAutoTaggingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAutoTagging', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableBrandDetection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBrandDetection', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableBrandDetectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBrandDetection', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableConditionAssessment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableConditionAssessment', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableConditionAssessmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableConditionAssessment', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableSizeEstimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSizeEstimation', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByEnableSizeEstimationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSizeEstimation', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> sortByMinimumConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumConfidence', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByMinimumConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumConfidence', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByNotifyOnAnalysisComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnAnalysisComplete', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByNotifyOnAnalysisCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnAnalysisComplete', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByNotifyOnLowConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnLowConfidence', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByNotifyOnLowConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnLowConfidence', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByRequireMultipleServices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireMultipleServices', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      sortByRequireMultipleServicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireMultipleServices', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AISettingsQuerySortThenBy
    on QueryBuilder<AISettings, AISettings, QSortThenBy> {
  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByAllowDataCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDataCollection', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByAllowDataCollectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDataCollection', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByAllowModelTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowModelTraining', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByAllowModelTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowModelTraining', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByEnableAutoTagging() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAutoTagging', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableAutoTaggingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAutoTagging', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableBrandDetection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBrandDetection', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableBrandDetectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBrandDetection', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableConditionAssessment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableConditionAssessment', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableConditionAssessmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableConditionAssessment', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableSizeEstimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSizeEstimation', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByEnableSizeEstimationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSizeEstimation', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByMinimumConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumConfidence', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByMinimumConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumConfidence', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByNotifyOnAnalysisComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnAnalysisComplete', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByNotifyOnAnalysisCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnAnalysisComplete', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByNotifyOnLowConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnLowConfidence', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByNotifyOnLowConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnLowConfidence', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByRequireMultipleServices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireMultipleServices', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy>
      thenByRequireMultipleServicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireMultipleServices', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AISettings, AISettings, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AISettingsQueryWhereDistinct
    on QueryBuilder<AISettings, AISettings, QDistinct> {
  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByAllowDataCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowDataCollection');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByAllowModelTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowModelTraining');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByEnableAutoTagging() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableAutoTagging');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByEnableBrandDetection() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableBrandDetection');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByEnableConditionAssessment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableConditionAssessment');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByEnableSizeEstimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableSizeEstimation');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByMinimumConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumConfidence');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByNotifyOnAnalysisComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnAnalysisComplete');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByNotifyOnLowConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnLowConfidence');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct>
      distinctByRequireMultipleServices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requireMultipleServices');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<AISettings, AISettings, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension AISettingsQueryProperty
    on QueryBuilder<AISettings, AISettings, QQueryProperty> {
  QueryBuilder<AISettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      allowDataCollectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowDataCollection');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      allowModelTrainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowModelTraining');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations> enableAutoTaggingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableAutoTagging');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      enableBrandDetectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableBrandDetection');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      enableConditionAssessmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableConditionAssessment');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      enableSizeEstimationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableSizeEstimation');
    });
  }

  QueryBuilder<AISettings, double, QQueryOperations>
      minimumConfidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumConfidence');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      notifyOnAnalysisCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnAnalysisComplete');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      notifyOnLowConfidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnLowConfidence');
    });
  }

  QueryBuilder<AISettings, bool, QQueryOperations>
      requireMultipleServicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requireMultipleServices');
    });
  }

  QueryBuilder<AISettings, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<AISettings, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
