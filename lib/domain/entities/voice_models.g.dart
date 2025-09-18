// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceCommandHistoryCollection on Isar {
  IsarCollection<VoiceCommandHistory> get voiceCommandHistorys =>
      this.collection();
}

const VoiceCommandHistorySchema = CollectionSchema(
  name: r'VoiceCommandHistory',
  id: 3242217516125598501,
  properties: {
    r'command': PropertySchema(
      id: 0,
      name: r'command',
      type: IsarType.string,
    ),
    r'confidence': PropertySchema(
      id: 1,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'detectedIntent': PropertySchema(
      id: 2,
      name: r'detectedIntent',
      type: IsarType.string,
      enumMap: _VoiceCommandHistorydetectedIntentEnumValueMap,
    ),
    r'errorMessage': PropertySchema(
      id: 3,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'executedAt': PropertySchema(
      id: 4,
      name: r'executedAt',
      type: IsarType.dateTime,
    ),
    r'processingTime': PropertySchema(
      id: 5,
      name: r'processingTime',
      type: IsarType.long,
    ),
    r'userFeedback': PropertySchema(
      id: 6,
      name: r'userFeedback',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 7,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wasAccurate': PropertySchema(
      id: 8,
      name: r'wasAccurate',
      type: IsarType.bool,
    ),
    r'wasSuccessful': PropertySchema(
      id: 9,
      name: r'wasSuccessful',
      type: IsarType.bool,
    )
  },
  estimateSize: _voiceCommandHistoryEstimateSize,
  serialize: _voiceCommandHistorySerialize,
  deserialize: _voiceCommandHistoryDeserialize,
  deserializeProp: _voiceCommandHistoryDeserializeProp,
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
    r'executedAt': IndexSchema(
      id: -1394297690758325806,
      name: r'executedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'executedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _voiceCommandHistoryGetId,
  getLinks: _voiceCommandHistoryGetLinks,
  attach: _voiceCommandHistoryAttach,
  version: '3.1.0+1',
);

int _voiceCommandHistoryEstimateSize(
  VoiceCommandHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.command.length * 3;
  bytesCount += 3 + object.detectedIntent.name.length * 3;
  {
    final value = object.errorMessage;
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
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceCommandHistorySerialize(
  VoiceCommandHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.command);
  writer.writeDouble(offsets[1], object.confidence);
  writer.writeString(offsets[2], object.detectedIntent.name);
  writer.writeString(offsets[3], object.errorMessage);
  writer.writeDateTime(offsets[4], object.executedAt);
  writer.writeLong(offsets[5], object.processingTime);
  writer.writeString(offsets[6], object.userFeedback);
  writer.writeString(offsets[7], object.userId);
  writer.writeBool(offsets[8], object.wasAccurate);
  writer.writeBool(offsets[9], object.wasSuccessful);
}

VoiceCommandHistory _voiceCommandHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceCommandHistory();
  object.command = reader.readString(offsets[0]);
  object.confidence = reader.readDouble(offsets[1]);
  object.detectedIntent = _VoiceCommandHistorydetectedIntentValueEnumMap[
          reader.readStringOrNull(offsets[2])] ??
      VoiceIntent.showOutfits;
  object.errorMessage = reader.readStringOrNull(offsets[3]);
  object.executedAt = reader.readDateTime(offsets[4]);
  object.id = id;
  object.processingTime = reader.readLongOrNull(offsets[5]);
  object.userFeedback = reader.readStringOrNull(offsets[6]);
  object.userId = reader.readString(offsets[7]);
  object.wasAccurate = reader.readBoolOrNull(offsets[8]);
  object.wasSuccessful = reader.readBool(offsets[9]);
  return object;
}

P _voiceCommandHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (_VoiceCommandHistorydetectedIntentValueEnumMap[
              reader.readStringOrNull(offset)] ??
          VoiceIntent.showOutfits) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VoiceCommandHistorydetectedIntentEnumValueMap = {
  r'showOutfits': r'showOutfits',
  r'findItem': r'findItem',
  r'createOutfit': r'createOutfit',
  r'navigate': r'navigate',
  r'filter': r'filter',
  r'search': r'search',
  r'like': r'like',
  r'favorite': r'favorite',
  r'share': r'share',
  r'delete': r'delete',
  r'unknown': r'unknown',
};
const _VoiceCommandHistorydetectedIntentValueEnumMap = {
  r'showOutfits': VoiceIntent.showOutfits,
  r'findItem': VoiceIntent.findItem,
  r'createOutfit': VoiceIntent.createOutfit,
  r'navigate': VoiceIntent.navigate,
  r'filter': VoiceIntent.filter,
  r'search': VoiceIntent.search,
  r'like': VoiceIntent.like,
  r'favorite': VoiceIntent.favorite,
  r'share': VoiceIntent.share,
  r'delete': VoiceIntent.delete,
  r'unknown': VoiceIntent.unknown,
};

Id _voiceCommandHistoryGetId(VoiceCommandHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceCommandHistoryGetLinks(
    VoiceCommandHistory object) {
  return [];
}

void _voiceCommandHistoryAttach(
    IsarCollection<dynamic> col, Id id, VoiceCommandHistory object) {
  object.id = id;
}

extension VoiceCommandHistoryQueryWhereSort
    on QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QWhere> {
  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhere>
      anyExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'executedAt'),
      );
    });
  }
}

extension VoiceCommandHistoryQueryWhere
    on QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QWhereClause> {
  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      executedAtEqualTo(DateTime executedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'executedAt',
        value: [executedAt],
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      executedAtNotEqualTo(DateTime executedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'executedAt',
              lower: [],
              upper: [executedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'executedAt',
              lower: [executedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'executedAt',
              lower: [executedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'executedAt',
              lower: [],
              upper: [executedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      executedAtGreaterThan(
    DateTime executedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'executedAt',
        lower: [executedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      executedAtLessThan(
    DateTime executedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'executedAt',
        lower: [],
        upper: [executedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterWhereClause>
      executedAtBetween(
    DateTime lowerExecutedAt,
    DateTime upperExecutedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'executedAt',
        lower: [lowerExecutedAt],
        includeLower: includeLower,
        upper: [upperExecutedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VoiceCommandHistoryQueryFilter on QueryBuilder<VoiceCommandHistory,
    VoiceCommandHistory, QFilterCondition> {
  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'command',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'command',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'command',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'command',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'command',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'command',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'command',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'command',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'command',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      commandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'command',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentEqualTo(
    VoiceIntent value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentGreaterThan(
    VoiceIntent value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentLessThan(
    VoiceIntent value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentBetween(
    VoiceIntent lower,
    VoiceIntent upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detectedIntent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detectedIntent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      detectedIntentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detectedIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      executedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      executedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'executedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      executedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'executedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      executedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'executedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      processingTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingTime',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      processingTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingTime',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      processingTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userFeedback',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userFeedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userFeedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userFeedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userFeedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userFeedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
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

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      wasAccurateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wasAccurate',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      wasAccurateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wasAccurate',
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      wasAccurateEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasAccurate',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterFilterCondition>
      wasSuccessfulEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasSuccessful',
        value: value,
      ));
    });
  }
}

extension VoiceCommandHistoryQueryObject on QueryBuilder<VoiceCommandHistory,
    VoiceCommandHistory, QFilterCondition> {}

extension VoiceCommandHistoryQueryLinks on QueryBuilder<VoiceCommandHistory,
    VoiceCommandHistory, QFilterCondition> {}

extension VoiceCommandHistoryQuerySortBy
    on QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QSortBy> {
  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'command', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'command', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByDetectedIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByDetectedIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByExecutedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByProcessingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByWasAccurate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByWasAccurateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByWasSuccessful() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessful', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      sortByWasSuccessfulDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessful', Sort.desc);
    });
  }
}

extension VoiceCommandHistoryQuerySortThenBy
    on QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QSortThenBy> {
  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'command', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'command', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByDetectedIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByDetectedIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByExecutedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByProcessingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTime', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByUserFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByUserFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByWasAccurate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByWasAccurateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasAccurate', Sort.desc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByWasSuccessful() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessful', Sort.asc);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QAfterSortBy>
      thenByWasSuccessfulDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSuccessful', Sort.desc);
    });
  }
}

extension VoiceCommandHistoryQueryWhereDistinct
    on QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct> {
  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByCommand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'command', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByDetectedIntent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detectedIntent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByErrorMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executedAt');
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processingTime');
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByUserFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userFeedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByWasAccurate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasAccurate');
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QDistinct>
      distinctByWasSuccessful() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasSuccessful');
    });
  }
}

extension VoiceCommandHistoryQueryProperty
    on QueryBuilder<VoiceCommandHistory, VoiceCommandHistory, QQueryProperty> {
  QueryBuilder<VoiceCommandHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceCommandHistory, String, QQueryOperations>
      commandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'command');
    });
  }

  QueryBuilder<VoiceCommandHistory, double, QQueryOperations>
      confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<VoiceCommandHistory, VoiceIntent, QQueryOperations>
      detectedIntentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detectedIntent');
    });
  }

  QueryBuilder<VoiceCommandHistory, String?, QQueryOperations>
      errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<VoiceCommandHistory, DateTime, QQueryOperations>
      executedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executedAt');
    });
  }

  QueryBuilder<VoiceCommandHistory, int?, QQueryOperations>
      processingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processingTime');
    });
  }

  QueryBuilder<VoiceCommandHistory, String?, QQueryOperations>
      userFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userFeedback');
    });
  }

  QueryBuilder<VoiceCommandHistory, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<VoiceCommandHistory, bool?, QQueryOperations>
      wasAccurateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasAccurate');
    });
  }

  QueryBuilder<VoiceCommandHistory, bool, QQueryOperations>
      wasSuccessfulProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasSuccessful');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceSettingsCollection on Isar {
  IsarCollection<VoiceSettings> get voiceSettings => this.collection();
}

const VoiceSettingsSchema = CollectionSchema(
  name: r'VoiceSettings',
  id: 2068087119388610007,
  properties: {
    r'allowVoiceTraining': PropertySchema(
      id: 0,
      name: r'allowVoiceTraining',
      type: IsarType.bool,
    ),
    r'alternativeLanguages': PropertySchema(
      id: 1,
      name: r'alternativeLanguages',
      type: IsarType.stringList,
    ),
    r'confidenceThreshold': PropertySchema(
      id: 2,
      name: r'confidenceThreshold',
      type: IsarType.double,
    ),
    r'enableAudioDescriptions': PropertySchema(
      id: 3,
      name: r'enableAudioDescriptions',
      type: IsarType.bool,
    ),
    r'enableContinuousListening': PropertySchema(
      id: 4,
      name: r'enableContinuousListening',
      type: IsarType.bool,
    ),
    r'enableCustomCommands': PropertySchema(
      id: 5,
      name: r'enableCustomCommands',
      type: IsarType.bool,
    ),
    r'enableHapticFeedback': PropertySchema(
      id: 6,
      name: r'enableHapticFeedback',
      type: IsarType.bool,
    ),
    r'enableVoiceFeedback': PropertySchema(
      id: 7,
      name: r'enableVoiceFeedback',
      type: IsarType.bool,
    ),
    r'enableVoiceHints': PropertySchema(
      id: 8,
      name: r'enableVoiceHints',
      type: IsarType.bool,
    ),
    r'language': PropertySchema(
      id: 9,
      name: r'language',
      type: IsarType.string,
    ),
    r'saveVoiceData': PropertySchema(
      id: 10,
      name: r'saveVoiceData',
      type: IsarType.bool,
    ),
    r'speechRate': PropertySchema(
      id: 11,
      name: r'speechRate',
      type: IsarType.double,
    ),
    r'timeoutSeconds': PropertySchema(
      id: 12,
      name: r'timeoutSeconds',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 14,
      name: r'userId',
      type: IsarType.string,
    ),
    r'voiceGender': PropertySchema(
      id: 15,
      name: r'voiceGender',
      type: IsarType.string,
    ),
    r'volume': PropertySchema(
      id: 16,
      name: r'volume',
      type: IsarType.double,
    )
  },
  estimateSize: _voiceSettingsEstimateSize,
  serialize: _voiceSettingsSerialize,
  deserialize: _voiceSettingsDeserialize,
  deserializeProp: _voiceSettingsDeserializeProp,
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
  getId: _voiceSettingsGetId,
  getLinks: _voiceSettingsGetLinks,
  attach: _voiceSettingsAttach,
  version: '3.1.0+1',
);

int _voiceSettingsEstimateSize(
  VoiceSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alternativeLanguages.length * 3;
  {
    for (var i = 0; i < object.alternativeLanguages.length; i++) {
      final value = object.alternativeLanguages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.voiceGender.length * 3;
  return bytesCount;
}

void _voiceSettingsSerialize(
  VoiceSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.allowVoiceTraining);
  writer.writeStringList(offsets[1], object.alternativeLanguages);
  writer.writeDouble(offsets[2], object.confidenceThreshold);
  writer.writeBool(offsets[3], object.enableAudioDescriptions);
  writer.writeBool(offsets[4], object.enableContinuousListening);
  writer.writeBool(offsets[5], object.enableCustomCommands);
  writer.writeBool(offsets[6], object.enableHapticFeedback);
  writer.writeBool(offsets[7], object.enableVoiceFeedback);
  writer.writeBool(offsets[8], object.enableVoiceHints);
  writer.writeString(offsets[9], object.language);
  writer.writeBool(offsets[10], object.saveVoiceData);
  writer.writeDouble(offsets[11], object.speechRate);
  writer.writeLong(offsets[12], object.timeoutSeconds);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.userId);
  writer.writeString(offsets[15], object.voiceGender);
  writer.writeDouble(offsets[16], object.volume);
}

VoiceSettings _voiceSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceSettings();
  object.allowVoiceTraining = reader.readBool(offsets[0]);
  object.alternativeLanguages = reader.readStringList(offsets[1]) ?? [];
  object.confidenceThreshold = reader.readDouble(offsets[2]);
  object.enableAudioDescriptions = reader.readBool(offsets[3]);
  object.enableContinuousListening = reader.readBool(offsets[4]);
  object.enableCustomCommands = reader.readBool(offsets[5]);
  object.enableHapticFeedback = reader.readBool(offsets[6]);
  object.enableVoiceFeedback = reader.readBool(offsets[7]);
  object.enableVoiceHints = reader.readBool(offsets[8]);
  object.id = id;
  object.language = reader.readString(offsets[9]);
  object.saveVoiceData = reader.readBool(offsets[10]);
  object.speechRate = reader.readDouble(offsets[11]);
  object.timeoutSeconds = reader.readLong(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.userId = reader.readString(offsets[14]);
  object.voiceGender = reader.readString(offsets[15]);
  object.volume = reader.readDouble(offsets[16]);
  return object;
}

P _voiceSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceSettingsGetId(VoiceSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceSettingsGetLinks(VoiceSettings object) {
  return [];
}

void _voiceSettingsAttach(
    IsarCollection<dynamic> col, Id id, VoiceSettings object) {
  object.id = id;
}

extension VoiceSettingsByIndex on IsarCollection<VoiceSettings> {
  Future<VoiceSettings?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  VoiceSettings? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<VoiceSettings?>> getAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<VoiceSettings?> getAllByUserIdSync(List<String> userIdValues) {
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

  Future<Id> putByUserId(VoiceSettings object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(VoiceSettings object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<VoiceSettings> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<VoiceSettings> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension VoiceSettingsQueryWhereSort
    on QueryBuilder<VoiceSettings, VoiceSettings, QWhere> {
  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoiceSettingsQueryWhere
    on QueryBuilder<VoiceSettings, VoiceSettings, QWhereClause> {
  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause> idBetween(
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterWhereClause>
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

extension VoiceSettingsQueryFilter
    on QueryBuilder<VoiceSettings, VoiceSettings, QFilterCondition> {
  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      allowVoiceTrainingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowVoiceTraining',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeLanguages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeLanguages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeLanguages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeLanguages',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeLanguages',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeLanguages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeLanguages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeLanguages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeLanguages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeLanguages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      alternativeLanguagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeLanguages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      confidenceThresholdEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidenceThreshold',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      confidenceThresholdGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidenceThreshold',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      confidenceThresholdLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidenceThreshold',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      confidenceThresholdBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidenceThreshold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      enableAudioDescriptionsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableAudioDescriptions',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      enableContinuousListeningEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableContinuousListening',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      enableCustomCommandsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableCustomCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      enableHapticFeedbackEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableHapticFeedback',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      enableVoiceFeedbackEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableVoiceFeedback',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      enableVoiceHintsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableVoiceHints',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      saveVoiceDataEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saveVoiceData',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      speechRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speechRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      speechRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speechRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      speechRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speechRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      speechRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speechRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      timeoutSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeoutSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      timeoutSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeoutSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      timeoutSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeoutSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      timeoutSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeoutSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
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

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voiceGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voiceGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voiceGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voiceGender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'voiceGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'voiceGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voiceGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voiceGender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voiceGender',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      voiceGenderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voiceGender',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      volumeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      volumeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      volumeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterFilterCondition>
      volumeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VoiceSettingsQueryObject
    on QueryBuilder<VoiceSettings, VoiceSettings, QFilterCondition> {}

extension VoiceSettingsQueryLinks
    on QueryBuilder<VoiceSettings, VoiceSettings, QFilterCondition> {}

extension VoiceSettingsQuerySortBy
    on QueryBuilder<VoiceSettings, VoiceSettings, QSortBy> {
  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByAllowVoiceTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowVoiceTraining', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByAllowVoiceTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowVoiceTraining', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByConfidenceThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceThreshold', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByConfidenceThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceThreshold', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableAudioDescriptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioDescriptions', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableAudioDescriptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioDescriptions', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableContinuousListening() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableContinuousListening', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableContinuousListeningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableContinuousListening', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableCustomCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableCustomCommands', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableCustomCommandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableCustomCommands', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableHapticFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableHapticFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableHapticFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableHapticFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableVoiceFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableVoiceFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableVoiceHints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceHints', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByEnableVoiceHintsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceHints', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortBySaveVoiceData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveVoiceData', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortBySaveVoiceDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveVoiceData', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortBySpeechRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechRate', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortBySpeechRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechRate', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByTimeoutSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeoutSeconds', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByTimeoutSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeoutSeconds', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByVoiceGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceGender', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      sortByVoiceGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceGender', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> sortByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }
}

extension VoiceSettingsQuerySortThenBy
    on QueryBuilder<VoiceSettings, VoiceSettings, QSortThenBy> {
  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByAllowVoiceTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowVoiceTraining', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByAllowVoiceTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowVoiceTraining', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByConfidenceThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceThreshold', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByConfidenceThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceThreshold', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableAudioDescriptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioDescriptions', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableAudioDescriptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioDescriptions', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableContinuousListening() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableContinuousListening', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableContinuousListeningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableContinuousListening', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableCustomCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableCustomCommands', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableCustomCommandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableCustomCommands', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableHapticFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableHapticFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableHapticFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableHapticFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableVoiceFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableVoiceFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableVoiceHints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceHints', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByEnableVoiceHintsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableVoiceHints', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenBySaveVoiceData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveVoiceData', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenBySaveVoiceDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveVoiceData', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenBySpeechRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechRate', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenBySpeechRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechRate', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByTimeoutSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeoutSeconds', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByTimeoutSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeoutSeconds', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByVoiceGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceGender', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy>
      thenByVoiceGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceGender', Sort.desc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QAfterSortBy> thenByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }
}

extension VoiceSettingsQueryWhereDistinct
    on QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> {
  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByAllowVoiceTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowVoiceTraining');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByAlternativeLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternativeLanguages');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByConfidenceThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidenceThreshold');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByEnableAudioDescriptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableAudioDescriptions');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByEnableContinuousListening() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableContinuousListening');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByEnableCustomCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableCustomCommands');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByEnableHapticFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableHapticFeedback');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByEnableVoiceFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableVoiceFeedback');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByEnableVoiceHints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableVoiceHints');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> distinctByLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctBySaveVoiceData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saveVoiceData');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> distinctBySpeechRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speechRate');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct>
      distinctByTimeoutSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeoutSeconds');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> distinctByVoiceGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voiceGender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceSettings, VoiceSettings, QDistinct> distinctByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volume');
    });
  }
}

extension VoiceSettingsQueryProperty
    on QueryBuilder<VoiceSettings, VoiceSettings, QQueryProperty> {
  QueryBuilder<VoiceSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      allowVoiceTrainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowVoiceTraining');
    });
  }

  QueryBuilder<VoiceSettings, List<String>, QQueryOperations>
      alternativeLanguagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternativeLanguages');
    });
  }

  QueryBuilder<VoiceSettings, double, QQueryOperations>
      confidenceThresholdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidenceThreshold');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      enableAudioDescriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableAudioDescriptions');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      enableContinuousListeningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableContinuousListening');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      enableCustomCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableCustomCommands');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      enableHapticFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableHapticFeedback');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      enableVoiceFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableVoiceFeedback');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations>
      enableVoiceHintsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableVoiceHints');
    });
  }

  QueryBuilder<VoiceSettings, String, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<VoiceSettings, bool, QQueryOperations> saveVoiceDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saveVoiceData');
    });
  }

  QueryBuilder<VoiceSettings, double, QQueryOperations> speechRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speechRate');
    });
  }

  QueryBuilder<VoiceSettings, int, QQueryOperations> timeoutSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeoutSeconds');
    });
  }

  QueryBuilder<VoiceSettings, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VoiceSettings, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<VoiceSettings, String, QQueryOperations> voiceGenderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voiceGender');
    });
  }

  QueryBuilder<VoiceSettings, double, QQueryOperations> volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volume');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceTrainingSessionCollection on Isar {
  IsarCollection<VoiceTrainingSession> get voiceTrainingSessions =>
      this.collection();
}

const VoiceTrainingSessionSchema = CollectionSchema(
  name: r'VoiceTrainingSession',
  id: 6858949748600884973,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'currentPhraseIndex': PropertySchema(
      id: 1,
      name: r'currentPhraseIndex',
      type: IsarType.long,
    ),
    r'currentRepetition': PropertySchema(
      id: 2,
      name: r'currentRepetition',
      type: IsarType.long,
    ),
    r'overallAccuracy': PropertySchema(
      id: 3,
      name: r'overallAccuracy',
      type: IsarType.double,
    ),
    r'problematicPhrases': PropertySchema(
      id: 4,
      name: r'problematicPhrases',
      type: IsarType.stringList,
    ),
    r'requiredRepetitions': PropertySchema(
      id: 5,
      name: r'requiredRepetitions',
      type: IsarType.long,
    ),
    r'sessionName': PropertySchema(
      id: 6,
      name: r'sessionName',
      type: IsarType.string,
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
      enumMap: _VoiceTrainingSessionstatusEnumValueMap,
    ),
    r'trainingPhrases': PropertySchema(
      id: 9,
      name: r'trainingPhrases',
      type: IsarType.stringList,
    ),
    r'userId': PropertySchema(
      id: 10,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _voiceTrainingSessionEstimateSize,
  serialize: _voiceTrainingSessionSerialize,
  deserialize: _voiceTrainingSessionDeserialize,
  deserializeProp: _voiceTrainingSessionDeserializeProp,
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
  getId: _voiceTrainingSessionGetId,
  getLinks: _voiceTrainingSessionGetLinks,
  attach: _voiceTrainingSessionAttach,
  version: '3.1.0+1',
);

int _voiceTrainingSessionEstimateSize(
  VoiceTrainingSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.problematicPhrases.length * 3;
  {
    for (var i = 0; i < object.problematicPhrases.length; i++) {
      final value = object.problematicPhrases[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.sessionName.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.trainingPhrases.length * 3;
  {
    for (var i = 0; i < object.trainingPhrases.length; i++) {
      final value = object.trainingPhrases[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceTrainingSessionSerialize(
  VoiceTrainingSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeLong(offsets[1], object.currentPhraseIndex);
  writer.writeLong(offsets[2], object.currentRepetition);
  writer.writeDouble(offsets[3], object.overallAccuracy);
  writer.writeStringList(offsets[4], object.problematicPhrases);
  writer.writeLong(offsets[5], object.requiredRepetitions);
  writer.writeString(offsets[6], object.sessionName);
  writer.writeDateTime(offsets[7], object.startedAt);
  writer.writeString(offsets[8], object.status.name);
  writer.writeStringList(offsets[9], object.trainingPhrases);
  writer.writeString(offsets[10], object.userId);
}

VoiceTrainingSession _voiceTrainingSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceTrainingSession();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.currentPhraseIndex = reader.readLong(offsets[1]);
  object.currentRepetition = reader.readLong(offsets[2]);
  object.id = id;
  object.overallAccuracy = reader.readDouble(offsets[3]);
  object.problematicPhrases = reader.readStringList(offsets[4]) ?? [];
  object.requiredRepetitions = reader.readLong(offsets[5]);
  object.sessionName = reader.readString(offsets[6]);
  object.startedAt = reader.readDateTime(offsets[7]);
  object.status = _VoiceTrainingSessionstatusValueEnumMap[
          reader.readStringOrNull(offsets[8])] ??
      TrainingSessionStatus.preparing;
  object.trainingPhrases = reader.readStringList(offsets[9]) ?? [];
  object.userId = reader.readString(offsets[10]);
  return object;
}

P _voiceTrainingSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (_VoiceTrainingSessionstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TrainingSessionStatus.preparing) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VoiceTrainingSessionstatusEnumValueMap = {
  r'preparing': r'preparing',
  r'inProgress': r'inProgress',
  r'completed': r'completed',
  r'failed': r'failed',
  r'cancelled': r'cancelled',
};
const _VoiceTrainingSessionstatusValueEnumMap = {
  r'preparing': TrainingSessionStatus.preparing,
  r'inProgress': TrainingSessionStatus.inProgress,
  r'completed': TrainingSessionStatus.completed,
  r'failed': TrainingSessionStatus.failed,
  r'cancelled': TrainingSessionStatus.cancelled,
};

Id _voiceTrainingSessionGetId(VoiceTrainingSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceTrainingSessionGetLinks(
    VoiceTrainingSession object) {
  return [];
}

void _voiceTrainingSessionAttach(
    IsarCollection<dynamic> col, Id id, VoiceTrainingSession object) {
  object.id = id;
}

extension VoiceTrainingSessionQueryWhereSort
    on QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QWhere> {
  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoiceTrainingSessionQueryWhere
    on QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QWhereClause> {
  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterWhereClause>
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

extension VoiceTrainingSessionQueryFilter on QueryBuilder<VoiceTrainingSession,
    VoiceTrainingSession, QFilterCondition> {
  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> completedAtGreaterThan(
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> completedAtLessThan(
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> completedAtBetween(
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentPhraseIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPhraseIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentPhraseIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPhraseIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentPhraseIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPhraseIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentPhraseIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPhraseIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentRepetitionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentRepetition',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentRepetitionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentRepetition',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentRepetitionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentRepetition',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> currentRepetitionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentRepetition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> overallAccuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> overallAccuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> overallAccuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> overallAccuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallAccuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problematicPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'problematicPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'problematicPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'problematicPhrases',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'problematicPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'problematicPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      problematicPhrasesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'problematicPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      problematicPhrasesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'problematicPhrases',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problematicPhrases',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'problematicPhrases',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'problematicPhrases',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'problematicPhrases',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'problematicPhrases',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'problematicPhrases',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'problematicPhrases',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> problematicPhrasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'problematicPhrases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> requiredRepetitionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredRepetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> requiredRepetitionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requiredRepetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> requiredRepetitionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requiredRepetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> requiredRepetitionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requiredRepetitions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      sessionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      sessionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sessionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionName',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> sessionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionName',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> startedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> startedAtLessThan(
    DateTime value, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> startedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusEqualTo(
    TrainingSessionStatus value, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusGreaterThan(
    TrainingSessionStatus value, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusLessThan(
    TrainingSessionStatus value, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusBetween(
    TrainingSessionStatus lower,
    TrainingSessionStatus upper, {
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainingPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainingPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainingPhrases',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trainingPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trainingPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      trainingPhrasesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trainingPhrases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
          QAfterFilterCondition>
      trainingPhrasesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trainingPhrases',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingPhrases',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trainingPhrases',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'trainingPhrases',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'trainingPhrases',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'trainingPhrases',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'trainingPhrases',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'trainingPhrases',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> trainingPhrasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'trainingPhrases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
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

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension VoiceTrainingSessionQueryObject on QueryBuilder<VoiceTrainingSession,
    VoiceTrainingSession, QFilterCondition> {}

extension VoiceTrainingSessionQueryLinks on QueryBuilder<VoiceTrainingSession,
    VoiceTrainingSession, QFilterCondition> {}

extension VoiceTrainingSessionQuerySortBy
    on QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QSortBy> {
  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByCurrentPhraseIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhraseIndex', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByCurrentPhraseIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhraseIndex', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByCurrentRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRepetition', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByCurrentRepetitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRepetition', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByOverallAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallAccuracy', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByOverallAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallAccuracy', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByRequiredRepetitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredRepetitions', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByRequiredRepetitionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredRepetitions', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortBySessionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortBySessionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceTrainingSessionQuerySortThenBy
    on QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QSortThenBy> {
  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByCurrentPhraseIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhraseIndex', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByCurrentPhraseIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPhraseIndex', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByCurrentRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRepetition', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByCurrentRepetitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRepetition', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByOverallAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallAccuracy', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByOverallAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallAccuracy', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByRequiredRepetitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredRepetitions', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByRequiredRepetitionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredRepetitions', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenBySessionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenBySessionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceTrainingSessionQueryWhereDistinct
    on QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct> {
  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByCurrentPhraseIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPhraseIndex');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByCurrentRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentRepetition');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByOverallAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallAccuracy');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByProblematicPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'problematicPhrases');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByRequiredRepetitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiredRepetitions');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctBySessionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByTrainingPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainingPhrases');
    });
  }

  QueryBuilder<VoiceTrainingSession, VoiceTrainingSession, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension VoiceTrainingSessionQueryProperty on QueryBuilder<
    VoiceTrainingSession, VoiceTrainingSession, QQueryProperty> {
  QueryBuilder<VoiceTrainingSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceTrainingSession, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<VoiceTrainingSession, int, QQueryOperations>
      currentPhraseIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPhraseIndex');
    });
  }

  QueryBuilder<VoiceTrainingSession, int, QQueryOperations>
      currentRepetitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentRepetition');
    });
  }

  QueryBuilder<VoiceTrainingSession, double, QQueryOperations>
      overallAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallAccuracy');
    });
  }

  QueryBuilder<VoiceTrainingSession, List<String>, QQueryOperations>
      problematicPhrasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'problematicPhrases');
    });
  }

  QueryBuilder<VoiceTrainingSession, int, QQueryOperations>
      requiredRepetitionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiredRepetitions');
    });
  }

  QueryBuilder<VoiceTrainingSession, String, QQueryOperations>
      sessionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionName');
    });
  }

  QueryBuilder<VoiceTrainingSession, DateTime, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<VoiceTrainingSession, TrainingSessionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VoiceTrainingSession, List<String>, QQueryOperations>
      trainingPhrasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainingPhrases');
    });
  }

  QueryBuilder<VoiceTrainingSession, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceAnalyticsCollection on Isar {
  IsarCollection<VoiceAnalytics> get voiceAnalytics => this.collection();
}

const VoiceAnalyticsSchema = CollectionSchema(
  name: r'VoiceAnalytics',
  id: 1786922295536377976,
  properties: {
    r'averageConfidence': PropertySchema(
      id: 0,
      name: r'averageConfidence',
      type: IsarType.double,
    ),
    r'averageProcessingTime': PropertySchema(
      id: 1,
      name: r'averageProcessingTime',
      type: IsarType.double,
    ),
    r'commandsExecuted': PropertySchema(
      id: 2,
      name: r'commandsExecuted',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'failedCommands': PropertySchema(
      id: 4,
      name: r'failedCommands',
      type: IsarType.long,
    ),
    r'mostProblematicCommands': PropertySchema(
      id: 5,
      name: r'mostProblematicCommands',
      type: IsarType.stringList,
    ),
    r'successfulCommands': PropertySchema(
      id: 6,
      name: r'successfulCommands',
      type: IsarType.long,
    ),
    r'totalListeningTime': PropertySchema(
      id: 7,
      name: r'totalListeningTime',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    ),
    r'voiceSessionsStarted': PropertySchema(
      id: 9,
      name: r'voiceSessionsStarted',
      type: IsarType.long,
    )
  },
  estimateSize: _voiceAnalyticsEstimateSize,
  serialize: _voiceAnalyticsSerialize,
  deserialize: _voiceAnalyticsDeserialize,
  deserializeProp: _voiceAnalyticsDeserializeProp,
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
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _voiceAnalyticsGetId,
  getLinks: _voiceAnalyticsGetLinks,
  attach: _voiceAnalyticsAttach,
  version: '3.1.0+1',
);

int _voiceAnalyticsEstimateSize(
  VoiceAnalytics object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.mostProblematicCommands.length * 3;
  {
    for (var i = 0; i < object.mostProblematicCommands.length; i++) {
      final value = object.mostProblematicCommands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceAnalyticsSerialize(
  VoiceAnalytics object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageConfidence);
  writer.writeDouble(offsets[1], object.averageProcessingTime);
  writer.writeLong(offsets[2], object.commandsExecuted);
  writer.writeDateTime(offsets[3], object.date);
  writer.writeLong(offsets[4], object.failedCommands);
  writer.writeStringList(offsets[5], object.mostProblematicCommands);
  writer.writeLong(offsets[6], object.successfulCommands);
  writer.writeLong(offsets[7], object.totalListeningTime);
  writer.writeString(offsets[8], object.userId);
  writer.writeLong(offsets[9], object.voiceSessionsStarted);
}

VoiceAnalytics _voiceAnalyticsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceAnalytics();
  object.averageConfidence = reader.readDouble(offsets[0]);
  object.averageProcessingTime = reader.readDouble(offsets[1]);
  object.commandsExecuted = reader.readLong(offsets[2]);
  object.date = reader.readDateTime(offsets[3]);
  object.failedCommands = reader.readLong(offsets[4]);
  object.id = id;
  object.mostProblematicCommands = reader.readStringList(offsets[5]) ?? [];
  object.successfulCommands = reader.readLong(offsets[6]);
  object.totalListeningTime = reader.readLong(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  object.voiceSessionsStarted = reader.readLong(offsets[9]);
  return object;
}

P _voiceAnalyticsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceAnalyticsGetId(VoiceAnalytics object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceAnalyticsGetLinks(VoiceAnalytics object) {
  return [];
}

void _voiceAnalyticsAttach(
    IsarCollection<dynamic> col, Id id, VoiceAnalytics object) {
  object.id = id;
}

extension VoiceAnalyticsQueryWhereSort
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QWhere> {
  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension VoiceAnalyticsQueryWhere
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QWhereClause> {
  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> idBetween(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VoiceAnalyticsQueryFilter
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QFilterCondition> {
  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageConfidenceEqualTo(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageConfidenceGreaterThan(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageConfidenceLessThan(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageConfidenceBetween(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageProcessingTimeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageProcessingTime',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageProcessingTimeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageProcessingTime',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageProcessingTimeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageProcessingTime',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      averageProcessingTimeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageProcessingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      commandsExecutedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commandsExecuted',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      commandsExecutedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commandsExecuted',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      commandsExecutedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commandsExecuted',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      commandsExecutedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commandsExecuted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      failedCommandsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      failedCommandsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'failedCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      failedCommandsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'failedCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      failedCommandsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'failedCommands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostProblematicCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mostProblematicCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mostProblematicCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mostProblematicCommands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mostProblematicCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mostProblematicCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mostProblematicCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mostProblematicCommands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostProblematicCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mostProblematicCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostProblematicCommands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostProblematicCommands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostProblematicCommands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostProblematicCommands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostProblematicCommands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      mostProblematicCommandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mostProblematicCommands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      successfulCommandsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'successfulCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      successfulCommandsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'successfulCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      successfulCommandsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'successfulCommands',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      successfulCommandsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'successfulCommands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      totalListeningTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalListeningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      totalListeningTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalListeningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      totalListeningTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalListeningTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      totalListeningTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalListeningTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
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

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      voiceSessionsStartedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voiceSessionsStarted',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      voiceSessionsStartedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voiceSessionsStarted',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      voiceSessionsStartedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voiceSessionsStarted',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterFilterCondition>
      voiceSessionsStartedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voiceSessionsStarted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VoiceAnalyticsQueryObject
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QFilterCondition> {}

extension VoiceAnalyticsQueryLinks
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QFilterCondition> {}

extension VoiceAnalyticsQuerySortBy
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QSortBy> {
  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByAverageConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByAverageConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByAverageProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProcessingTime', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByAverageProcessingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProcessingTime', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByCommandsExecuted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commandsExecuted', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByCommandsExecutedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commandsExecuted', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByFailedCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedCommands', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByFailedCommandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedCommands', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortBySuccessfulCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulCommands', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortBySuccessfulCommandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulCommands', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByTotalListeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalListeningTime', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByTotalListeningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalListeningTime', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByVoiceSessionsStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceSessionsStarted', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      sortByVoiceSessionsStartedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceSessionsStarted', Sort.desc);
    });
  }
}

extension VoiceAnalyticsQuerySortThenBy
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QSortThenBy> {
  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByAverageConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByAverageConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageConfidence', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByAverageProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProcessingTime', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByAverageProcessingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProcessingTime', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByCommandsExecuted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commandsExecuted', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByCommandsExecutedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commandsExecuted', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByFailedCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedCommands', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByFailedCommandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failedCommands', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenBySuccessfulCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulCommands', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenBySuccessfulCommandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successfulCommands', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByTotalListeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalListeningTime', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByTotalListeningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalListeningTime', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByVoiceSessionsStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceSessionsStarted', Sort.asc);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QAfterSortBy>
      thenByVoiceSessionsStartedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceSessionsStarted', Sort.desc);
    });
  }
}

extension VoiceAnalyticsQueryWhereDistinct
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct> {
  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByAverageConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageConfidence');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByAverageProcessingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageProcessingTime');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByCommandsExecuted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commandsExecuted');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByFailedCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failedCommands');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByMostProblematicCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mostProblematicCommands');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctBySuccessfulCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'successfulCommands');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByTotalListeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalListeningTime');
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceAnalytics, VoiceAnalytics, QDistinct>
      distinctByVoiceSessionsStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voiceSessionsStarted');
    });
  }
}

extension VoiceAnalyticsQueryProperty
    on QueryBuilder<VoiceAnalytics, VoiceAnalytics, QQueryProperty> {
  QueryBuilder<VoiceAnalytics, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceAnalytics, double, QQueryOperations>
      averageConfidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageConfidence');
    });
  }

  QueryBuilder<VoiceAnalytics, double, QQueryOperations>
      averageProcessingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageProcessingTime');
    });
  }

  QueryBuilder<VoiceAnalytics, int, QQueryOperations>
      commandsExecutedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commandsExecuted');
    });
  }

  QueryBuilder<VoiceAnalytics, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<VoiceAnalytics, int, QQueryOperations> failedCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failedCommands');
    });
  }

  QueryBuilder<VoiceAnalytics, List<String>, QQueryOperations>
      mostProblematicCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mostProblematicCommands');
    });
  }

  QueryBuilder<VoiceAnalytics, int, QQueryOperations>
      successfulCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'successfulCommands');
    });
  }

  QueryBuilder<VoiceAnalytics, int, QQueryOperations>
      totalListeningTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalListeningTime');
    });
  }

  QueryBuilder<VoiceAnalytics, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<VoiceAnalytics, int, QQueryOperations>
      voiceSessionsStartedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voiceSessionsStarted');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceAccessibilityProfileCollection on Isar {
  IsarCollection<VoiceAccessibilityProfile> get voiceAccessibilityProfiles =>
      this.collection();
}

const VoiceAccessibilityProfileSchema = CollectionSchema(
  name: r'VoiceAccessibilityProfile',
  id: -2441305921446597555,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'difficultWords': PropertySchema(
      id: 1,
      name: r'difficultWords',
      type: IsarType.stringList,
    ),
    r'enableButtonActivation': PropertySchema(
      id: 2,
      name: r'enableButtonActivation',
      type: IsarType.bool,
    ),
    r'enableGestureActivation': PropertySchema(
      id: 3,
      name: r'enableGestureActivation',
      type: IsarType.bool,
    ),
    r'enableGestureBackup': PropertySchema(
      id: 4,
      name: r'enableGestureBackup',
      type: IsarType.bool,
    ),
    r'enableTapToTalk': PropertySchema(
      id: 5,
      name: r'enableTapToTalk',
      type: IsarType.bool,
    ),
    r'extendedTimeoutMultiplier': PropertySchema(
      id: 6,
      name: r'extendedTimeoutMultiplier',
      type: IsarType.double,
    ),
    r'hasHearingImpairment': PropertySchema(
      id: 7,
      name: r'hasHearingImpairment',
      type: IsarType.bool,
    ),
    r'hasMotorImpairment': PropertySchema(
      id: 8,
      name: r'hasMotorImpairment',
      type: IsarType.bool,
    ),
    r'hasSpeechImpairment': PropertySchema(
      id: 9,
      name: r'hasSpeechImpairment',
      type: IsarType.bool,
    ),
    r'hasVisualImpairment': PropertySchema(
      id: 10,
      name: r'hasVisualImpairment',
      type: IsarType.bool,
    ),
    r'requireConfirmation': PropertySchema(
      id: 11,
      name: r'requireConfirmation',
      type: IsarType.bool,
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
    )
  },
  estimateSize: _voiceAccessibilityProfileEstimateSize,
  serialize: _voiceAccessibilityProfileSerialize,
  deserialize: _voiceAccessibilityProfileDeserialize,
  deserializeProp: _voiceAccessibilityProfileDeserializeProp,
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
  getId: _voiceAccessibilityProfileGetId,
  getLinks: _voiceAccessibilityProfileGetLinks,
  attach: _voiceAccessibilityProfileAttach,
  version: '3.1.0+1',
);

int _voiceAccessibilityProfileEstimateSize(
  VoiceAccessibilityProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.difficultWords.length * 3;
  {
    for (var i = 0; i < object.difficultWords.length; i++) {
      final value = object.difficultWords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceAccessibilityProfileSerialize(
  VoiceAccessibilityProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.difficultWords);
  writer.writeBool(offsets[2], object.enableButtonActivation);
  writer.writeBool(offsets[3], object.enableGestureActivation);
  writer.writeBool(offsets[4], object.enableGestureBackup);
  writer.writeBool(offsets[5], object.enableTapToTalk);
  writer.writeDouble(offsets[6], object.extendedTimeoutMultiplier);
  writer.writeBool(offsets[7], object.hasHearingImpairment);
  writer.writeBool(offsets[8], object.hasMotorImpairment);
  writer.writeBool(offsets[9], object.hasSpeechImpairment);
  writer.writeBool(offsets[10], object.hasVisualImpairment);
  writer.writeBool(offsets[11], object.requireConfirmation);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.userId);
}

VoiceAccessibilityProfile _voiceAccessibilityProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceAccessibilityProfile();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.difficultWords = reader.readStringList(offsets[1]) ?? [];
  object.enableButtonActivation = reader.readBool(offsets[2]);
  object.enableGestureActivation = reader.readBool(offsets[3]);
  object.enableGestureBackup = reader.readBool(offsets[4]);
  object.enableTapToTalk = reader.readBool(offsets[5]);
  object.extendedTimeoutMultiplier = reader.readDouble(offsets[6]);
  object.hasHearingImpairment = reader.readBool(offsets[7]);
  object.hasMotorImpairment = reader.readBool(offsets[8]);
  object.hasSpeechImpairment = reader.readBool(offsets[9]);
  object.hasVisualImpairment = reader.readBool(offsets[10]);
  object.id = id;
  object.requireConfirmation = reader.readBool(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.userId = reader.readString(offsets[13]);
  return object;
}

P _voiceAccessibilityProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
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
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceAccessibilityProfileGetId(VoiceAccessibilityProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceAccessibilityProfileGetLinks(
    VoiceAccessibilityProfile object) {
  return [];
}

void _voiceAccessibilityProfileAttach(
    IsarCollection<dynamic> col, Id id, VoiceAccessibilityProfile object) {
  object.id = id;
}

extension VoiceAccessibilityProfileByIndex
    on IsarCollection<VoiceAccessibilityProfile> {
  Future<VoiceAccessibilityProfile?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  VoiceAccessibilityProfile? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<VoiceAccessibilityProfile?>> getAllByUserId(
      List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<VoiceAccessibilityProfile?> getAllByUserIdSync(
      List<String> userIdValues) {
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

  Future<Id> putByUserId(VoiceAccessibilityProfile object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(VoiceAccessibilityProfile object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<VoiceAccessibilityProfile> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<VoiceAccessibilityProfile> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension VoiceAccessibilityProfileQueryWhereSort on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QWhere> {
  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoiceAccessibilityProfileQueryWhere on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QWhereClause> {
  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterWhereClause> userIdNotEqualTo(String userId) {
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

extension VoiceAccessibilityProfileQueryFilter on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QFilterCondition> {
  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficultWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficultWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficultWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficultWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'difficultWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'difficultWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
          QAfterFilterCondition>
      difficultWordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'difficultWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
          QAfterFilterCondition>
      difficultWordsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'difficultWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficultWords',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'difficultWords',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficultWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficultWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficultWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficultWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficultWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> difficultWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficultWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> enableButtonActivationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableButtonActivation',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> enableGestureActivationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableGestureActivation',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> enableGestureBackupEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableGestureBackup',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> enableTapToTalkEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableTapToTalk',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> extendedTimeoutMultiplierEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extendedTimeoutMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> extendedTimeoutMultiplierGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extendedTimeoutMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> extendedTimeoutMultiplierLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extendedTimeoutMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> extendedTimeoutMultiplierBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extendedTimeoutMultiplier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> hasHearingImpairmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasHearingImpairment',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> hasMotorImpairmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasMotorImpairment',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> hasSpeechImpairmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSpeechImpairment',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> hasVisualImpairmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasVisualImpairment',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> requireConfirmationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requireConfirmation',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
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

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension VoiceAccessibilityProfileQueryObject on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QFilterCondition> {}

extension VoiceAccessibilityProfileQueryLinks on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QFilterCondition> {}

extension VoiceAccessibilityProfileQuerySortBy on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QSortBy> {
  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableButtonActivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableButtonActivation', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableButtonActivationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableButtonActivation', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableGestureActivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureActivation', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableGestureActivationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureActivation', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableGestureBackup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureBackup', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableGestureBackupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureBackup', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableTapToTalk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTapToTalk', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByEnableTapToTalkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTapToTalk', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByExtendedTimeoutMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extendedTimeoutMultiplier', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByExtendedTimeoutMultiplierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extendedTimeoutMultiplier', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasHearingImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHearingImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasHearingImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHearingImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasMotorImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasMotorImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasSpeechImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSpeechImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasSpeechImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSpeechImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasVisualImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByHasVisualImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByRequireConfirmation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireConfirmation', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByRequireConfirmationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireConfirmation', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceAccessibilityProfileQuerySortThenBy on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QSortThenBy> {
  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableButtonActivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableButtonActivation', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableButtonActivationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableButtonActivation', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableGestureActivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureActivation', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableGestureActivationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureActivation', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableGestureBackup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureBackup', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableGestureBackupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableGestureBackup', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableTapToTalk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTapToTalk', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByEnableTapToTalkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTapToTalk', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByExtendedTimeoutMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extendedTimeoutMultiplier', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByExtendedTimeoutMultiplierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extendedTimeoutMultiplier', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasHearingImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHearingImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasHearingImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasHearingImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasMotorImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasMotorImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasSpeechImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSpeechImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasSpeechImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSpeechImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasVisualImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualImpairment', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByHasVisualImpairmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualImpairment', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByRequireConfirmation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireConfirmation', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByRequireConfirmationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requireConfirmation', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile,
      QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceAccessibilityProfileQueryWhereDistinct on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct> {
  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByDifficultWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficultWords');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByEnableButtonActivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableButtonActivation');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByEnableGestureActivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableGestureActivation');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByEnableGestureBackup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableGestureBackup');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByEnableTapToTalk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableTapToTalk');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByExtendedTimeoutMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extendedTimeoutMultiplier');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByHasHearingImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasHearingImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByHasMotorImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasMotorImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByHasSpeechImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSpeechImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByHasVisualImpairment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasVisualImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByRequireConfirmation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requireConfirmation');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, VoiceAccessibilityProfile, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension VoiceAccessibilityProfileQueryProperty on QueryBuilder<
    VoiceAccessibilityProfile, VoiceAccessibilityProfile, QQueryProperty> {
  QueryBuilder<VoiceAccessibilityProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, List<String>, QQueryOperations>
      difficultWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficultWords');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      enableButtonActivationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableButtonActivation');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      enableGestureActivationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableGestureActivation');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      enableGestureBackupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableGestureBackup');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      enableTapToTalkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableTapToTalk');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, double, QQueryOperations>
      extendedTimeoutMultiplierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extendedTimeoutMultiplier');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      hasHearingImpairmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasHearingImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      hasMotorImpairmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasMotorImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      hasSpeechImpairmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSpeechImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      hasVisualImpairmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasVisualImpairment');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, bool, QQueryOperations>
      requireConfirmationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requireConfirmation');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VoiceAccessibilityProfile, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceShortcutCollection on Isar {
  IsarCollection<VoiceShortcut> get voiceShortcuts => this.collection();
}

const VoiceShortcutSchema = CollectionSchema(
  name: r'VoiceShortcut',
  id: -5238033078409581260,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
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
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isUserCreated': PropertySchema(
      id: 5,
      name: r'isUserCreated',
      type: IsarType.bool,
    ),
    r'lastUsed': PropertySchema(
      id: 6,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'phrase': PropertySchema(
      id: 7,
      name: r'phrase',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 8,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'timesUsed': PropertySchema(
      id: 9,
      name: r'timesUsed',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 10,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _voiceShortcutEstimateSize,
  serialize: _voiceShortcutSerialize,
  deserialize: _voiceShortcutDeserialize,
  deserializeProp: _voiceShortcutDeserializeProp,
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
  getId: _voiceShortcutGetId,
  getLinks: _voiceShortcutGetLinks,
  attach: _voiceShortcutAttach,
  version: '3.1.0+1',
);

int _voiceShortcutEstimateSize(
  VoiceShortcut object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.action.length * 3;
  {
    final value = object.category;
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
  bytesCount += 3 + object.phrase.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceShortcutSerialize(
  VoiceShortcut object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.description);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeBool(offsets[5], object.isUserCreated);
  writer.writeDateTime(offsets[6], object.lastUsed);
  writer.writeString(offsets[7], object.phrase);
  writer.writeStringList(offsets[8], object.tags);
  writer.writeLong(offsets[9], object.timesUsed);
  writer.writeString(offsets[10], object.userId);
}

VoiceShortcut _voiceShortcutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceShortcut();
  object.action = reader.readString(offsets[0]);
  object.category = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isActive = reader.readBool(offsets[4]);
  object.isUserCreated = reader.readBool(offsets[5]);
  object.lastUsed = reader.readDateTimeOrNull(offsets[6]);
  object.phrase = reader.readString(offsets[7]);
  object.tags = reader.readStringList(offsets[8]) ?? [];
  object.timesUsed = reader.readLong(offsets[9]);
  object.userId = reader.readString(offsets[10]);
  return object;
}

P _voiceShortcutDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceShortcutGetId(VoiceShortcut object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceShortcutGetLinks(VoiceShortcut object) {
  return [];
}

void _voiceShortcutAttach(
    IsarCollection<dynamic> col, Id id, VoiceShortcut object) {
  object.id = id;
}

extension VoiceShortcutQueryWhereSort
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QWhere> {
  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoiceShortcutQueryWhere
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QWhereClause> {
  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause> idBetween(
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterWhereClause>
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

extension VoiceShortcutQueryFilter
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QFilterCondition> {
  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'action',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      isUserCreatedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUserCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      lastUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      lastUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      lastUsedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phrase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phrase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phrase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phrase',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phrase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phrase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phrase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phrase',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phrase',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      phraseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phrase',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      timesUsedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
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

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension VoiceShortcutQueryObject
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QFilterCondition> {}

extension VoiceShortcutQueryLinks
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QFilterCondition> {}

extension VoiceShortcutQuerySortBy
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QSortBy> {
  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByIsUserCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserCreated', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByIsUserCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserCreated', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByPhrase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrase', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByPhraseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrase', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      sortByTimesUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceShortcutQuerySortThenBy
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QSortThenBy> {
  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByIsUserCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserCreated', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByIsUserCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserCreated', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByPhrase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrase', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByPhraseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrase', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy>
      thenByTimesUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.desc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceShortcutQueryWhereDistinct
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> {
  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct>
      distinctByIsUserCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUserCreated');
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByPhrase(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phrase', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesUsed');
    });
  }

  QueryBuilder<VoiceShortcut, VoiceShortcut, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension VoiceShortcutQueryProperty
    on QueryBuilder<VoiceShortcut, VoiceShortcut, QQueryProperty> {
  QueryBuilder<VoiceShortcut, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceShortcut, String, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<VoiceShortcut, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<VoiceShortcut, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VoiceShortcut, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<VoiceShortcut, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<VoiceShortcut, bool, QQueryOperations> isUserCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUserCreated');
    });
  }

  QueryBuilder<VoiceShortcut, DateTime?, QQueryOperations> lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<VoiceShortcut, String, QQueryOperations> phraseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phrase');
    });
  }

  QueryBuilder<VoiceShortcut, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<VoiceShortcut, int, QQueryOperations> timesUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesUsed');
    });
  }

  QueryBuilder<VoiceShortcut, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceFeedbackCollection on Isar {
  IsarCollection<VoiceFeedback> get voiceFeedbacks => this.collection();
}

const VoiceFeedbackSchema = CollectionSchema(
  name: r'VoiceFeedback',
  id: 8989909764308552338,
  properties: {
    r'actualIntent': PropertySchema(
      id: 0,
      name: r'actualIntent',
      type: IsarType.string,
      enumMap: _VoiceFeedbackactualIntentEnumValueMap,
    ),
    r'confidence': PropertySchema(
      id: 1,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'correctedCommand': PropertySchema(
      id: 2,
      name: r'correctedCommand',
      type: IsarType.string,
    ),
    r'correctedIntent': PropertySchema(
      id: 3,
      name: r'correctedIntent',
      type: IsarType.string,
    ),
    r'expectedIntent': PropertySchema(
      id: 4,
      name: r'expectedIntent',
      type: IsarType.string,
      enumMap: _VoiceFeedbackexpectedIntentEnumValueMap,
    ),
    r'feedbackType': PropertySchema(
      id: 5,
      name: r'feedbackType',
      type: IsarType.string,
      enumMap: _VoiceFeedbackfeedbackTypeEnumValueMap,
    ),
    r'originalCommand': PropertySchema(
      id: 6,
      name: r'originalCommand',
      type: IsarType.string,
    ),
    r'providedAt': PropertySchema(
      id: 7,
      name: r'providedAt',
      type: IsarType.dateTime,
    ),
    r'recognizedCommand': PropertySchema(
      id: 8,
      name: r'recognizedCommand',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _voiceFeedbackEstimateSize,
  serialize: _voiceFeedbackSerialize,
  deserialize: _voiceFeedbackDeserialize,
  deserializeProp: _voiceFeedbackDeserializeProp,
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
    r'providedAt': IndexSchema(
      id: 609072032409261261,
      name: r'providedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'providedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _voiceFeedbackGetId,
  getLinks: _voiceFeedbackGetLinks,
  attach: _voiceFeedbackAttach,
  version: '3.1.0+1',
);

int _voiceFeedbackEstimateSize(
  VoiceFeedback object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actualIntent.name.length * 3;
  {
    final value = object.correctedCommand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.correctedIntent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.expectedIntent.name.length * 3;
  bytesCount += 3 + object.feedbackType.name.length * 3;
  bytesCount += 3 + object.originalCommand.length * 3;
  bytesCount += 3 + object.recognizedCommand.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceFeedbackSerialize(
  VoiceFeedback object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actualIntent.name);
  writer.writeDouble(offsets[1], object.confidence);
  writer.writeString(offsets[2], object.correctedCommand);
  writer.writeString(offsets[3], object.correctedIntent);
  writer.writeString(offsets[4], object.expectedIntent.name);
  writer.writeString(offsets[5], object.feedbackType.name);
  writer.writeString(offsets[6], object.originalCommand);
  writer.writeDateTime(offsets[7], object.providedAt);
  writer.writeString(offsets[8], object.recognizedCommand);
  writer.writeString(offsets[9], object.userId);
}

VoiceFeedback _voiceFeedbackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceFeedback();
  object.actualIntent = _VoiceFeedbackactualIntentValueEnumMap[
          reader.readStringOrNull(offsets[0])] ??
      VoiceIntent.showOutfits;
  object.confidence = reader.readDouble(offsets[1]);
  object.correctedCommand = reader.readStringOrNull(offsets[2]);
  object.correctedIntent = reader.readStringOrNull(offsets[3]);
  object.expectedIntent = _VoiceFeedbackexpectedIntentValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      VoiceIntent.showOutfits;
  object.feedbackType = _VoiceFeedbackfeedbackTypeValueEnumMap[
          reader.readStringOrNull(offsets[5])] ??
      FeedbackType.correct;
  object.id = id;
  object.originalCommand = reader.readString(offsets[6]);
  object.providedAt = reader.readDateTime(offsets[7]);
  object.recognizedCommand = reader.readString(offsets[8]);
  object.userId = reader.readString(offsets[9]);
  return object;
}

P _voiceFeedbackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_VoiceFeedbackactualIntentValueEnumMap[
              reader.readStringOrNull(offset)] ??
          VoiceIntent.showOutfits) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (_VoiceFeedbackexpectedIntentValueEnumMap[
              reader.readStringOrNull(offset)] ??
          VoiceIntent.showOutfits) as P;
    case 5:
      return (_VoiceFeedbackfeedbackTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          FeedbackType.correct) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VoiceFeedbackactualIntentEnumValueMap = {
  r'showOutfits': r'showOutfits',
  r'findItem': r'findItem',
  r'createOutfit': r'createOutfit',
  r'navigate': r'navigate',
  r'filter': r'filter',
  r'search': r'search',
  r'like': r'like',
  r'favorite': r'favorite',
  r'share': r'share',
  r'delete': r'delete',
  r'unknown': r'unknown',
};
const _VoiceFeedbackactualIntentValueEnumMap = {
  r'showOutfits': VoiceIntent.showOutfits,
  r'findItem': VoiceIntent.findItem,
  r'createOutfit': VoiceIntent.createOutfit,
  r'navigate': VoiceIntent.navigate,
  r'filter': VoiceIntent.filter,
  r'search': VoiceIntent.search,
  r'like': VoiceIntent.like,
  r'favorite': VoiceIntent.favorite,
  r'share': VoiceIntent.share,
  r'delete': VoiceIntent.delete,
  r'unknown': VoiceIntent.unknown,
};
const _VoiceFeedbackexpectedIntentEnumValueMap = {
  r'showOutfits': r'showOutfits',
  r'findItem': r'findItem',
  r'createOutfit': r'createOutfit',
  r'navigate': r'navigate',
  r'filter': r'filter',
  r'search': r'search',
  r'like': r'like',
  r'favorite': r'favorite',
  r'share': r'share',
  r'delete': r'delete',
  r'unknown': r'unknown',
};
const _VoiceFeedbackexpectedIntentValueEnumMap = {
  r'showOutfits': VoiceIntent.showOutfits,
  r'findItem': VoiceIntent.findItem,
  r'createOutfit': VoiceIntent.createOutfit,
  r'navigate': VoiceIntent.navigate,
  r'filter': VoiceIntent.filter,
  r'search': VoiceIntent.search,
  r'like': VoiceIntent.like,
  r'favorite': VoiceIntent.favorite,
  r'share': VoiceIntent.share,
  r'delete': VoiceIntent.delete,
  r'unknown': VoiceIntent.unknown,
};
const _VoiceFeedbackfeedbackTypeEnumValueMap = {
  r'correct': r'correct',
  r'incorrect': r'incorrect',
  r'partiallyCorrect': r'partiallyCorrect',
  r'misunderstood': r'misunderstood',
};
const _VoiceFeedbackfeedbackTypeValueEnumMap = {
  r'correct': FeedbackType.correct,
  r'incorrect': FeedbackType.incorrect,
  r'partiallyCorrect': FeedbackType.partiallyCorrect,
  r'misunderstood': FeedbackType.misunderstood,
};

Id _voiceFeedbackGetId(VoiceFeedback object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceFeedbackGetLinks(VoiceFeedback object) {
  return [];
}

void _voiceFeedbackAttach(
    IsarCollection<dynamic> col, Id id, VoiceFeedback object) {
  object.id = id;
}

extension VoiceFeedbackQueryWhereSort
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QWhere> {
  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhere> anyProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'providedAt'),
      );
    });
  }
}

extension VoiceFeedbackQueryWhere
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QWhereClause> {
  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause> idBetween(
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause>
      providedAtEqualTo(DateTime providedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'providedAt',
        value: [providedAt],
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause>
      providedAtNotEqualTo(DateTime providedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'providedAt',
              lower: [],
              upper: [providedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'providedAt',
              lower: [providedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'providedAt',
              lower: [providedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'providedAt',
              lower: [],
              upper: [providedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause>
      providedAtGreaterThan(
    DateTime providedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'providedAt',
        lower: [providedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause>
      providedAtLessThan(
    DateTime providedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'providedAt',
        lower: [],
        upper: [providedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterWhereClause>
      providedAtBetween(
    DateTime lowerProvidedAt,
    DateTime upperProvidedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'providedAt',
        lower: [lowerProvidedAt],
        includeLower: includeLower,
        upper: [upperProvidedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VoiceFeedbackQueryFilter
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QFilterCondition> {
  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentEqualTo(
    VoiceIntent value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentGreaterThan(
    VoiceIntent value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentLessThan(
    VoiceIntent value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentBetween(
    VoiceIntent lower,
    VoiceIntent upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualIntent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actualIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actualIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualIntent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      actualIntentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctedCommand',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctedCommand',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctedCommand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctedCommand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctedCommand',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedCommandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctedCommand',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctedIntent',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctedIntent',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctedIntent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctedIntent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctedIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      correctedIntentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctedIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentEqualTo(
    VoiceIntent value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentGreaterThan(
    VoiceIntent value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentLessThan(
    VoiceIntent value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentBetween(
    VoiceIntent lower,
    VoiceIntent upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedIntent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expectedIntent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expectedIntent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      expectedIntentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expectedIntent',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeEqualTo(
    FeedbackType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedbackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeGreaterThan(
    FeedbackType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedbackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeLessThan(
    FeedbackType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedbackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeBetween(
    FeedbackType lower,
    FeedbackType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedbackType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feedbackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feedbackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedbackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedbackType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedbackType',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      feedbackTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedbackType',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalCommand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalCommand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalCommand',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      originalCommandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalCommand',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      providedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      providedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'providedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      providedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'providedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      providedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'providedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recognizedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recognizedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recognizedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recognizedCommand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recognizedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recognizedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recognizedCommand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recognizedCommand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recognizedCommand',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      recognizedCommandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recognizedCommand',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
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

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension VoiceFeedbackQueryObject
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QFilterCondition> {}

extension VoiceFeedbackQueryLinks
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QFilterCondition> {}

extension VoiceFeedbackQuerySortBy
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QSortBy> {
  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByActualIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByActualIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByCorrectedCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedCommand', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByCorrectedCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedCommand', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByCorrectedIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByCorrectedIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByExpectedIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByExpectedIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByFeedbackType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackType', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByFeedbackTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackType', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByOriginalCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalCommand', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByOriginalCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalCommand', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> sortByProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByProvidedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByRecognizedCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recognizedCommand', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      sortByRecognizedCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recognizedCommand', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceFeedbackQuerySortThenBy
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QSortThenBy> {
  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByActualIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByActualIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByCorrectedCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedCommand', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByCorrectedCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedCommand', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByCorrectedIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByCorrectedIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctedIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByExpectedIntent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedIntent', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByExpectedIntentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedIntent', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByFeedbackType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackType', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByFeedbackTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackType', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByOriginalCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalCommand', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByOriginalCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalCommand', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> thenByProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByProvidedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByRecognizedCommand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recognizedCommand', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy>
      thenByRecognizedCommandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recognizedCommand', Sort.desc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceFeedbackQueryWhereDistinct
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct> {
  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct> distinctByActualIntent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualIntent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct> distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct>
      distinctByCorrectedCommand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctedCommand',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct>
      distinctByCorrectedIntent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctedIntent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct>
      distinctByExpectedIntent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedIntent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct> distinctByFeedbackType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedbackType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct>
      distinctByOriginalCommand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalCommand',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct> distinctByProvidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'providedAt');
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct>
      distinctByRecognizedCommand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recognizedCommand',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceFeedback, VoiceFeedback, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension VoiceFeedbackQueryProperty
    on QueryBuilder<VoiceFeedback, VoiceFeedback, QQueryProperty> {
  QueryBuilder<VoiceFeedback, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceFeedback, VoiceIntent, QQueryOperations>
      actualIntentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualIntent');
    });
  }

  QueryBuilder<VoiceFeedback, double, QQueryOperations> confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<VoiceFeedback, String?, QQueryOperations>
      correctedCommandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctedCommand');
    });
  }

  QueryBuilder<VoiceFeedback, String?, QQueryOperations>
      correctedIntentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctedIntent');
    });
  }

  QueryBuilder<VoiceFeedback, VoiceIntent, QQueryOperations>
      expectedIntentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedIntent');
    });
  }

  QueryBuilder<VoiceFeedback, FeedbackType, QQueryOperations>
      feedbackTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedbackType');
    });
  }

  QueryBuilder<VoiceFeedback, String, QQueryOperations>
      originalCommandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalCommand');
    });
  }

  QueryBuilder<VoiceFeedback, DateTime, QQueryOperations> providedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'providedAt');
    });
  }

  QueryBuilder<VoiceFeedback, String, QQueryOperations>
      recognizedCommandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recognizedCommand');
    });
  }

  QueryBuilder<VoiceFeedback, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceContextCollection on Isar {
  IsarCollection<VoiceContext> get voiceContexts => this.collection();
}

const VoiceContextSchema = CollectionSchema(
  name: r'VoiceContext',
  id: -6144173852540046155,
  properties: {
    r'currentMode': PropertySchema(
      id: 0,
      name: r'currentMode',
      type: IsarType.string,
    ),
    r'currentScreen': PropertySchema(
      id: 1,
      name: r'currentScreen',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 2,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'recentCommands': PropertySchema(
      id: 3,
      name: r'recentCommands',
      type: IsarType.stringList,
    ),
    r'recentScreens': PropertySchema(
      id: 4,
      name: r'recentScreens',
      type: IsarType.stringList,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _voiceContextEstimateSize,
  serialize: _voiceContextSerialize,
  deserialize: _voiceContextDeserialize,
  deserializeProp: _voiceContextDeserializeProp,
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
    r'lastUpdated': IndexSchema(
      id: 8989359681631629925,
      name: r'lastUpdated',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUpdated',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _voiceContextGetId,
  getLinks: _voiceContextGetLinks,
  attach: _voiceContextAttach,
  version: '3.1.0+1',
);

int _voiceContextEstimateSize(
  VoiceContext object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.currentMode.length * 3;
  bytesCount += 3 + object.currentScreen.length * 3;
  bytesCount += 3 + object.recentCommands.length * 3;
  {
    for (var i = 0; i < object.recentCommands.length; i++) {
      final value = object.recentCommands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.recentScreens.length * 3;
  {
    for (var i = 0; i < object.recentScreens.length; i++) {
      final value = object.recentScreens[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceContextSerialize(
  VoiceContext object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.currentMode);
  writer.writeString(offsets[1], object.currentScreen);
  writer.writeDateTime(offsets[2], object.lastUpdated);
  writer.writeStringList(offsets[3], object.recentCommands);
  writer.writeStringList(offsets[4], object.recentScreens);
  writer.writeString(offsets[5], object.userId);
}

VoiceContext _voiceContextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceContext();
  object.currentMode = reader.readString(offsets[0]);
  object.currentScreen = reader.readString(offsets[1]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[2]);
  object.recentCommands = reader.readStringList(offsets[3]) ?? [];
  object.recentScreens = reader.readStringList(offsets[4]) ?? [];
  object.userId = reader.readString(offsets[5]);
  return object;
}

P _voiceContextDeserializeProp<P>(
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
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceContextGetId(VoiceContext object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceContextGetLinks(VoiceContext object) {
  return [];
}

void _voiceContextAttach(
    IsarCollection<dynamic> col, Id id, VoiceContext object) {
  object.id = id;
}

extension VoiceContextQueryWhereSort
    on QueryBuilder<VoiceContext, VoiceContext, QWhere> {
  QueryBuilder<VoiceContext, VoiceContext, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhere> anyLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUpdated'),
      );
    });
  }
}

extension VoiceContextQueryWhere
    on QueryBuilder<VoiceContext, VoiceContext, QWhereClause> {
  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> idBetween(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause> userIdNotEqualTo(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause>
      lastUpdatedEqualTo(DateTime lastUpdated) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUpdated',
        value: [lastUpdated],
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause>
      lastUpdatedNotEqualTo(DateTime lastUpdated) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdated',
              lower: [],
              upper: [lastUpdated],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdated',
              lower: [lastUpdated],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdated',
              lower: [lastUpdated],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUpdated',
              lower: [],
              upper: [lastUpdated],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause>
      lastUpdatedGreaterThan(
    DateTime lastUpdated, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUpdated',
        lower: [lastUpdated],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause>
      lastUpdatedLessThan(
    DateTime lastUpdated, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUpdated',
        lower: [],
        upper: [lastUpdated],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterWhereClause>
      lastUpdatedBetween(
    DateTime lowerLastUpdated,
    DateTime upperLastUpdated, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUpdated',
        lower: [lowerLastUpdated],
        includeLower: includeLower,
        upper: [upperLastUpdated],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VoiceContextQueryFilter
    on QueryBuilder<VoiceContext, VoiceContext, QFilterCondition> {
  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentMode',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentMode',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScreen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentScreen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentScreen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentScreen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentScreen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentScreen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentScreen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentScreen',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScreen',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      currentScreenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentScreen',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recentCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recentCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recentCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recentCommands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recentCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recentCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recentCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recentCommands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recentCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recentCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCommands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCommands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCommands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCommands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCommands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentCommandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCommands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recentScreens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recentScreens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recentScreens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recentScreens',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recentScreens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recentScreens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recentScreens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recentScreens',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recentScreens',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recentScreens',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentScreens',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentScreens',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentScreens',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentScreens',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentScreens',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      recentScreensLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentScreens',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition> userIdMatches(
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

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension VoiceContextQueryObject
    on QueryBuilder<VoiceContext, VoiceContext, QFilterCondition> {}

extension VoiceContextQueryLinks
    on QueryBuilder<VoiceContext, VoiceContext, QFilterCondition> {}

extension VoiceContextQuerySortBy
    on QueryBuilder<VoiceContext, VoiceContext, QSortBy> {
  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> sortByCurrentMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentMode', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy>
      sortByCurrentModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentMode', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> sortByCurrentScreen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScreen', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy>
      sortByCurrentScreenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScreen', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceContextQuerySortThenBy
    on QueryBuilder<VoiceContext, VoiceContext, QSortThenBy> {
  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenByCurrentMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentMode', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy>
      thenByCurrentModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentMode', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenByCurrentScreen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScreen', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy>
      thenByCurrentScreenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScreen', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VoiceContextQueryWhereDistinct
    on QueryBuilder<VoiceContext, VoiceContext, QDistinct> {
  QueryBuilder<VoiceContext, VoiceContext, QDistinct> distinctByCurrentMode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentMode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QDistinct> distinctByCurrentScreen(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentScreen',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QDistinct>
      distinctByRecentCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recentCommands');
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QDistinct>
      distinctByRecentScreens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recentScreens');
    });
  }

  QueryBuilder<VoiceContext, VoiceContext, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension VoiceContextQueryProperty
    on QueryBuilder<VoiceContext, VoiceContext, QQueryProperty> {
  QueryBuilder<VoiceContext, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceContext, String, QQueryOperations> currentModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentMode');
    });
  }

  QueryBuilder<VoiceContext, String, QQueryOperations> currentScreenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentScreen');
    });
  }

  QueryBuilder<VoiceContext, DateTime, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<VoiceContext, List<String>, QQueryOperations>
      recentCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recentCommands');
    });
  }

  QueryBuilder<VoiceContext, List<String>, QQueryOperations>
      recentScreensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recentScreens');
    });
  }

  QueryBuilder<VoiceContext, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceLanguageModelCollection on Isar {
  IsarCollection<VoiceLanguageModel> get voiceLanguageModels =>
      this.collection();
}

const VoiceLanguageModelSchema = CollectionSchema(
  name: r'VoiceLanguageModel',
  id: -2181849888076016017,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'downloadedAt': PropertySchema(
      id: 1,
      name: r'downloadedAt',
      type: IsarType.dateTime,
    ),
    r'isDownloaded': PropertySchema(
      id: 2,
      name: r'isDownloaded',
      type: IsarType.bool,
    ),
    r'isOfflineCapable': PropertySchema(
      id: 3,
      name: r'isOfflineCapable',
      type: IsarType.bool,
    ),
    r'languageCode': PropertySchema(
      id: 4,
      name: r'languageCode',
      type: IsarType.string,
    ),
    r'languageName': PropertySchema(
      id: 5,
      name: r'languageName',
      type: IsarType.string,
    ),
    r'lastUsed': PropertySchema(
      id: 6,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'modelSize': PropertySchema(
      id: 7,
      name: r'modelSize',
      type: IsarType.long,
    ),
    r'modelVersion': PropertySchema(
      id: 8,
      name: r'modelVersion',
      type: IsarType.string,
    ),
    r'supportsContinuousRecognition': PropertySchema(
      id: 9,
      name: r'supportsContinuousRecognition',
      type: IsarType.bool,
    ),
    r'supportsRealTimeTranscription': PropertySchema(
      id: 10,
      name: r'supportsRealTimeTranscription',
      type: IsarType.bool,
    ),
    r'supportsVoiceTraining': PropertySchema(
      id: 11,
      name: r'supportsVoiceTraining',
      type: IsarType.bool,
    )
  },
  estimateSize: _voiceLanguageModelEstimateSize,
  serialize: _voiceLanguageModelSerialize,
  deserialize: _voiceLanguageModelDeserialize,
  deserializeProp: _voiceLanguageModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _voiceLanguageModelGetId,
  getLinks: _voiceLanguageModelGetLinks,
  attach: _voiceLanguageModelAttach,
  version: '3.1.0+1',
);

int _voiceLanguageModelEstimateSize(
  VoiceLanguageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.languageCode.length * 3;
  bytesCount += 3 + object.languageName.length * 3;
  bytesCount += 3 + object.modelVersion.length * 3;
  return bytesCount;
}

void _voiceLanguageModelSerialize(
  VoiceLanguageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeDateTime(offsets[1], object.downloadedAt);
  writer.writeBool(offsets[2], object.isDownloaded);
  writer.writeBool(offsets[3], object.isOfflineCapable);
  writer.writeString(offsets[4], object.languageCode);
  writer.writeString(offsets[5], object.languageName);
  writer.writeDateTime(offsets[6], object.lastUsed);
  writer.writeLong(offsets[7], object.modelSize);
  writer.writeString(offsets[8], object.modelVersion);
  writer.writeBool(offsets[9], object.supportsContinuousRecognition);
  writer.writeBool(offsets[10], object.supportsRealTimeTranscription);
  writer.writeBool(offsets[11], object.supportsVoiceTraining);
}

VoiceLanguageModel _voiceLanguageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceLanguageModel();
  object.accuracy = reader.readDouble(offsets[0]);
  object.downloadedAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.isDownloaded = reader.readBool(offsets[2]);
  object.isOfflineCapable = reader.readBool(offsets[3]);
  object.languageCode = reader.readString(offsets[4]);
  object.languageName = reader.readString(offsets[5]);
  object.lastUsed = reader.readDateTimeOrNull(offsets[6]);
  object.modelSize = reader.readLong(offsets[7]);
  object.modelVersion = reader.readString(offsets[8]);
  object.supportsContinuousRecognition = reader.readBool(offsets[9]);
  object.supportsRealTimeTranscription = reader.readBool(offsets[10]);
  object.supportsVoiceTraining = reader.readBool(offsets[11]);
  return object;
}

P _voiceLanguageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceLanguageModelGetId(VoiceLanguageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceLanguageModelGetLinks(
    VoiceLanguageModel object) {
  return [];
}

void _voiceLanguageModelAttach(
    IsarCollection<dynamic> col, Id id, VoiceLanguageModel object) {
  object.id = id;
}

extension VoiceLanguageModelQueryWhereSort
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QWhere> {
  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoiceLanguageModelQueryWhere
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QWhereClause> {
  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterWhereClause>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterWhereClause>
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

extension VoiceLanguageModelQueryFilter
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QFilterCondition> {
  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      downloadedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadedAt',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      downloadedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadedAt',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      downloadedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      downloadedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      downloadedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      downloadedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      isDownloadedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDownloaded',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      isOfflineCapableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOfflineCapable',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languageCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageName',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      languageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languageName',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      lastUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      lastUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      lastUsedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelSize',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelSize',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelSize',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
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

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      modelVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      supportsContinuousRecognitionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supportsContinuousRecognition',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      supportsRealTimeTranscriptionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supportsRealTimeTranscription',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterFilterCondition>
      supportsVoiceTrainingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supportsVoiceTraining',
        value: value,
      ));
    });
  }
}

extension VoiceLanguageModelQueryObject
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QFilterCondition> {}

extension VoiceLanguageModelQueryLinks
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QFilterCondition> {}

extension VoiceLanguageModelQuerySortBy
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QSortBy> {
  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByDownloadedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByDownloadedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByIsOfflineCapable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfflineCapable', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByIsOfflineCapableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfflineCapable', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByLanguageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageName', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByLanguageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageName', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByModelSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelSize', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByModelSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelSize', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortBySupportsContinuousRecognition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsContinuousRecognition', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortBySupportsContinuousRecognitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsContinuousRecognition', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortBySupportsRealTimeTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsRealTimeTranscription', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortBySupportsRealTimeTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsRealTimeTranscription', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortBySupportsVoiceTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsVoiceTraining', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      sortBySupportsVoiceTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsVoiceTraining', Sort.desc);
    });
  }
}

extension VoiceLanguageModelQuerySortThenBy
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QSortThenBy> {
  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByDownloadedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByDownloadedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByIsOfflineCapable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfflineCapable', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByIsOfflineCapableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfflineCapable', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByLanguageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageName', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByLanguageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageName', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByModelSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelSize', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByModelSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelSize', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByModelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenByModelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelVersion', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenBySupportsContinuousRecognition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsContinuousRecognition', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenBySupportsContinuousRecognitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsContinuousRecognition', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenBySupportsRealTimeTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsRealTimeTranscription', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenBySupportsRealTimeTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsRealTimeTranscription', Sort.desc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenBySupportsVoiceTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsVoiceTraining', Sort.asc);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QAfterSortBy>
      thenBySupportsVoiceTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supportsVoiceTraining', Sort.desc);
    });
  }
}

extension VoiceLanguageModelQueryWhereDistinct
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct> {
  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracy');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByDownloadedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadedAt');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDownloaded');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByIsOfflineCapable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOfflineCapable');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByLanguageCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByLanguageName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByModelSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelSize');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctByModelVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelVersion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctBySupportsContinuousRecognition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supportsContinuousRecognition');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctBySupportsRealTimeTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supportsRealTimeTranscription');
    });
  }

  QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QDistinct>
      distinctBySupportsVoiceTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supportsVoiceTraining');
    });
  }
}

extension VoiceLanguageModelQueryProperty
    on QueryBuilder<VoiceLanguageModel, VoiceLanguageModel, QQueryProperty> {
  QueryBuilder<VoiceLanguageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceLanguageModel, double, QQueryOperations>
      accuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracy');
    });
  }

  QueryBuilder<VoiceLanguageModel, DateTime?, QQueryOperations>
      downloadedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadedAt');
    });
  }

  QueryBuilder<VoiceLanguageModel, bool, QQueryOperations>
      isDownloadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDownloaded');
    });
  }

  QueryBuilder<VoiceLanguageModel, bool, QQueryOperations>
      isOfflineCapableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOfflineCapable');
    });
  }

  QueryBuilder<VoiceLanguageModel, String, QQueryOperations>
      languageCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageCode');
    });
  }

  QueryBuilder<VoiceLanguageModel, String, QQueryOperations>
      languageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageName');
    });
  }

  QueryBuilder<VoiceLanguageModel, DateTime?, QQueryOperations>
      lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<VoiceLanguageModel, int, QQueryOperations> modelSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelSize');
    });
  }

  QueryBuilder<VoiceLanguageModel, String, QQueryOperations>
      modelVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelVersion');
    });
  }

  QueryBuilder<VoiceLanguageModel, bool, QQueryOperations>
      supportsContinuousRecognitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supportsContinuousRecognition');
    });
  }

  QueryBuilder<VoiceLanguageModel, bool, QQueryOperations>
      supportsRealTimeTranscriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supportsRealTimeTranscription');
    });
  }

  QueryBuilder<VoiceLanguageModel, bool, QQueryOperations>
      supportsVoiceTrainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supportsVoiceTraining');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoiceOnboardingCollection on Isar {
  IsarCollection<VoiceOnboarding> get voiceOnboardings => this.collection();
}

const VoiceOnboardingSchema = CollectionSchema(
  name: r'VoiceOnboarding',
  id: 4054951364249496701,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'enabledContinuousListening': PropertySchema(
      id: 1,
      name: r'enabledContinuousListening',
      type: IsarType.bool,
    ),
    r'enabledVoiceFeedback': PropertySchema(
      id: 2,
      name: r'enabledVoiceFeedback',
      type: IsarType.bool,
    ),
    r'failedCommands': PropertySchema(
      id: 3,
      name: r'failedCommands',
      type: IsarType.stringList,
    ),
    r'hasCompletedCustomization': PropertySchema(
      id: 4,
      name: r'hasCompletedCustomization',
      type: IsarType.bool,
    ),
    r'hasCompletedIntroduction': PropertySchema(
      id: 5,
      name: r'hasCompletedIntroduction',
      type: IsarType.bool,
    ),
    r'hasCompletedTraining': PropertySchema(
      id: 6,
      name: r'hasCompletedTraining',
      type: IsarType.bool,
    ),
    r'hasCompletedVoiceTest': PropertySchema(
      id: 7,
      name: r'hasCompletedVoiceTest',
      type: IsarType.bool,
    ),
    r'preferredLanguage': PropertySchema(
      id: 8,
      name: r'preferredLanguage',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 9,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'successfulCommands': PropertySchema(
      id: 10,
      name: r'successfulCommands',
      type: IsarType.stringList,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.string,
    ),
    r'voiceTestAccuracy': PropertySchema(
      id: 12,
      name: r'voiceTestAccuracy',
      type: IsarType.double,
    )
  },
  estimateSize: _voiceOnboardingEstimateSize,
  serialize: _voiceOnboardingSerialize,
  deserialize: _voiceOnboardingDeserialize,
  deserializeProp: _voiceOnboardingDeserializeProp,
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
  getId: _voiceOnboardingGetId,
  getLinks: _voiceOnboardingGetLinks,
  attach: _voiceOnboardingAttach,
  version: '3.1.0+1',
);

int _voiceOnboardingEstimateSize(
  VoiceOnboarding object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.failedCommands.length * 3;
  {
    for (var i = 0; i < object.failedCommands.length; i++) {
      final value = object.failedCommands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredLanguage.length * 3;
  bytesCount += 3 + object.successfulCommands.length * 3;
  {
    for (var i = 0; i < object.successfulCommands.length; i++) {
      final value = object.successfulCommands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _voiceOnboardingSerialize(
  VoiceOnboarding object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeBool(offsets[1], object.enabledContinuousListening);
  writer.writeBool(offsets[2], object.enabledVoiceFeedback);
  writer.writeStringList(offsets[3], object.failedCommands);
  writer.writeBool(offsets[4], object.hasCompletedCustomization);
  writer.writeBool(offsets[5], object.hasCompletedIntroduction);
  writer.writeBool(offsets[6], object.hasCompletedTraining);
  writer.writeBool(offsets[7], object.hasCompletedVoiceTest);
  writer.writeString(offsets[8], object.preferredLanguage);
  writer.writeDateTime(offsets[9], object.startedAt);
  writer.writeStringList(offsets[10], object.successfulCommands);
  writer.writeString(offsets[11], object.userId);
  writer.writeDouble(offsets[12], object.voiceTestAccuracy);
}

VoiceOnboarding _voiceOnboardingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceOnboarding();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.enabledContinuousListening = reader.readBool(offsets[1]);
  object.enabledVoiceFeedback = reader.readBool(offsets[2]);
  object.failedCommands = reader.readStringList(offsets[3]) ?? [];
  object.hasCompletedCustomization = reader.readBool(offsets[4]);
  object.hasCompletedIntroduction = reader.readBool(offsets[5]);
  object.hasCompletedTraining = reader.readBool(offsets[6]);
  object.hasCompletedVoiceTest = reader.readBool(offsets[7]);
  object.id = id;
  object.preferredLanguage = reader.readString(offsets[8]);
  object.startedAt = reader.readDateTimeOrNull(offsets[9]);
  object.successfulCommands = reader.readStringList(offsets[10]) ?? [];
  object.userId = reader.readString(offsets[11]);
  object.voiceTestAccuracy = reader.readDouble(offsets[12]);
  return object;
}

P _voiceOnboardingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _voiceOnboardingGetId(VoiceOnboarding object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voiceOnboardingGetLinks(VoiceOnboarding object) {
  return [];
}

void _voiceOnboardingAttach(
    IsarCollection<dynamic> col, Id id, VoiceOnboarding object) {
  object.id = id;
}

extension VoiceOnboardingByIndex on IsarCollection<VoiceOnboarding> {
  Future<VoiceOnboarding?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  VoiceOnboarding? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<VoiceOnboarding?>> getAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<VoiceOnboarding?> getAllByUserIdSync(List<String> userIdValues) {
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

  Future<Id> putByUserId(VoiceOnboarding object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(VoiceOnboarding object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<VoiceOnboarding> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<VoiceOnboarding> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension VoiceOnboardingQueryWhereSort
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QWhere> {
  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoiceOnboardingQueryWhere
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QWhereClause> {
  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause> idBetween(
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterWhereClause>
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

extension VoiceOnboardingQueryFilter
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QFilterCondition> {
  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      enabledContinuousListeningEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabledContinuousListening',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      enabledVoiceFeedbackEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabledVoiceFeedback',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'failedCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'failedCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'failedCommands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'failedCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'failedCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'failedCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'failedCommands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'failedCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedCommands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedCommands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedCommands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedCommands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedCommands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      failedCommandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedCommands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      hasCompletedCustomizationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCompletedCustomization',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      hasCompletedIntroductionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCompletedIntroduction',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      hasCompletedTrainingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCompletedTraining',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      hasCompletedVoiceTestEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCompletedVoiceTest',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      preferredLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      startedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      startedAtLessThan(
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      startedAtBetween(
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'successfulCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'successfulCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'successfulCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'successfulCommands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'successfulCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'successfulCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'successfulCommands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'successfulCommands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'successfulCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'successfulCommands',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'successfulCommands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'successfulCommands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'successfulCommands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'successfulCommands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'successfulCommands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      successfulCommandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'successfulCommands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
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

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      voiceTestAccuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voiceTestAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      voiceTestAccuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voiceTestAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      voiceTestAccuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voiceTestAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterFilterCondition>
      voiceTestAccuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voiceTestAccuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VoiceOnboardingQueryObject
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QFilterCondition> {}

extension VoiceOnboardingQueryLinks
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QFilterCondition> {}

extension VoiceOnboardingQuerySortBy
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QSortBy> {
  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByEnabledContinuousListening() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledContinuousListening', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByEnabledContinuousListeningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledContinuousListening', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByEnabledVoiceFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledVoiceFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByEnabledVoiceFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledVoiceFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedCustomization() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedCustomization', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedCustomizationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedCustomization', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedIntroduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedIntroduction', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedIntroductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedIntroduction', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedTraining', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedTraining', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedVoiceTest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedVoiceTest', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByHasCompletedVoiceTestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedVoiceTest', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByPreferredLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByPreferredLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByVoiceTestAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceTestAccuracy', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      sortByVoiceTestAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceTestAccuracy', Sort.desc);
    });
  }
}

extension VoiceOnboardingQuerySortThenBy
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QSortThenBy> {
  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByEnabledContinuousListening() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledContinuousListening', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByEnabledContinuousListeningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledContinuousListening', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByEnabledVoiceFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledVoiceFeedback', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByEnabledVoiceFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabledVoiceFeedback', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedCustomization() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedCustomization', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedCustomizationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedCustomization', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedIntroduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedIntroduction', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedIntroductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedIntroduction', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedTraining', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedTrainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedTraining', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedVoiceTest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedVoiceTest', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByHasCompletedVoiceTestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedVoiceTest', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByPreferredLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByPreferredLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredLanguage', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByVoiceTestAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceTestAccuracy', Sort.asc);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QAfterSortBy>
      thenByVoiceTestAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceTestAccuracy', Sort.desc);
    });
  }
}

extension VoiceOnboardingQueryWhereDistinct
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct> {
  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByEnabledContinuousListening() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabledContinuousListening');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByEnabledVoiceFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabledVoiceFeedback');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByFailedCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failedCommands');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByHasCompletedCustomization() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCompletedCustomization');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByHasCompletedIntroduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCompletedIntroduction');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByHasCompletedTraining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCompletedTraining');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByHasCompletedVoiceTest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCompletedVoiceTest');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByPreferredLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctBySuccessfulCommands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'successfulCommands');
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoiceOnboarding, VoiceOnboarding, QDistinct>
      distinctByVoiceTestAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voiceTestAccuracy');
    });
  }
}

extension VoiceOnboardingQueryProperty
    on QueryBuilder<VoiceOnboarding, VoiceOnboarding, QQueryProperty> {
  QueryBuilder<VoiceOnboarding, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoiceOnboarding, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<VoiceOnboarding, bool, QQueryOperations>
      enabledContinuousListeningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabledContinuousListening');
    });
  }

  QueryBuilder<VoiceOnboarding, bool, QQueryOperations>
      enabledVoiceFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabledVoiceFeedback');
    });
  }

  QueryBuilder<VoiceOnboarding, List<String>, QQueryOperations>
      failedCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failedCommands');
    });
  }

  QueryBuilder<VoiceOnboarding, bool, QQueryOperations>
      hasCompletedCustomizationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCompletedCustomization');
    });
  }

  QueryBuilder<VoiceOnboarding, bool, QQueryOperations>
      hasCompletedIntroductionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCompletedIntroduction');
    });
  }

  QueryBuilder<VoiceOnboarding, bool, QQueryOperations>
      hasCompletedTrainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCompletedTraining');
    });
  }

  QueryBuilder<VoiceOnboarding, bool, QQueryOperations>
      hasCompletedVoiceTestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCompletedVoiceTest');
    });
  }

  QueryBuilder<VoiceOnboarding, String, QQueryOperations>
      preferredLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredLanguage');
    });
  }

  QueryBuilder<VoiceOnboarding, DateTime?, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<VoiceOnboarding, List<String>, QQueryOperations>
      successfulCommandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'successfulCommands');
    });
  }

  QueryBuilder<VoiceOnboarding, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<VoiceOnboarding, double, QQueryOperations>
      voiceTestAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voiceTestAccuracy');
    });
  }
}
