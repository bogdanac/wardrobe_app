// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sustainability_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSustainabilityMetricsCollection on Isar {
  IsarCollection<SustainabilityMetrics> get sustainabilityMetrics =>
      this.collection();
}

const SustainabilityMetricsSchema = CollectionSchema(
  name: r'SustainabilityMetrics',
  id: -5207087465975558575,
  properties: {
    r'brandEthicsScore': PropertySchema(
      id: 0,
      name: r'brandEthicsScore',
      type: IsarType.string,
    ),
    r'calculatedAt': PropertySchema(
      id: 1,
      name: r'calculatedAt',
      type: IsarType.dateTime,
    ),
    r'carbonFootprint': PropertySchema(
      id: 2,
      name: r'carbonFootprint',
      type: IsarType.double,
    ),
    r'certifications': PropertySchema(
      id: 3,
      name: r'certifications',
      type: IsarType.stringList,
    ),
    r'energyConsumption': PropertySchema(
      id: 4,
      name: r'energyConsumption',
      type: IsarType.double,
    ),
    r'itemId': PropertySchema(
      id: 5,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 6,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'materialSustainabilityScore': PropertySchema(
      id: 7,
      name: r'materialSustainabilityScore',
      type: IsarType.string,
    ),
    r'sustainablePractices': PropertySchema(
      id: 8,
      name: r'sustainablePractices',
      type: IsarType.stringList,
    ),
    r'waterUsage': PropertySchema(
      id: 9,
      name: r'waterUsage',
      type: IsarType.double,
    )
  },
  estimateSize: _sustainabilityMetricsEstimateSize,
  serialize: _sustainabilityMetricsSerialize,
  deserialize: _sustainabilityMetricsDeserialize,
  deserializeProp: _sustainabilityMetricsDeserializeProp,
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
  getId: _sustainabilityMetricsGetId,
  getLinks: _sustainabilityMetricsGetLinks,
  attach: _sustainabilityMetricsAttach,
  version: '3.1.0+1',
);

int _sustainabilityMetricsEstimateSize(
  SustainabilityMetrics object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brandEthicsScore.length * 3;
  bytesCount += 3 + object.certifications.length * 3;
  {
    for (var i = 0; i < object.certifications.length; i++) {
      final value = object.certifications[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.materialSustainabilityScore.length * 3;
  bytesCount += 3 + object.sustainablePractices.length * 3;
  {
    for (var i = 0; i < object.sustainablePractices.length; i++) {
      final value = object.sustainablePractices[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _sustainabilityMetricsSerialize(
  SustainabilityMetrics object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brandEthicsScore);
  writer.writeDateTime(offsets[1], object.calculatedAt);
  writer.writeDouble(offsets[2], object.carbonFootprint);
  writer.writeStringList(offsets[3], object.certifications);
  writer.writeDouble(offsets[4], object.energyConsumption);
  writer.writeString(offsets[5], object.itemId);
  writer.writeDateTime(offsets[6], object.lastUpdated);
  writer.writeString(offsets[7], object.materialSustainabilityScore);
  writer.writeStringList(offsets[8], object.sustainablePractices);
  writer.writeDouble(offsets[9], object.waterUsage);
}

SustainabilityMetrics _sustainabilityMetricsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SustainabilityMetrics();
  object.brandEthicsScore = reader.readString(offsets[0]);
  object.calculatedAt = reader.readDateTime(offsets[1]);
  object.carbonFootprint = reader.readDouble(offsets[2]);
  object.certifications = reader.readStringList(offsets[3]) ?? [];
  object.energyConsumption = reader.readDouble(offsets[4]);
  object.id = id;
  object.itemId = reader.readString(offsets[5]);
  object.lastUpdated = reader.readDateTime(offsets[6]);
  object.materialSustainabilityScore = reader.readString(offsets[7]);
  object.sustainablePractices = reader.readStringList(offsets[8]) ?? [];
  object.waterUsage = reader.readDouble(offsets[9]);
  return object;
}

P _sustainabilityMetricsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sustainabilityMetricsGetId(SustainabilityMetrics object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sustainabilityMetricsGetLinks(
    SustainabilityMetrics object) {
  return [];
}

void _sustainabilityMetricsAttach(
    IsarCollection<dynamic> col, Id id, SustainabilityMetrics object) {
  object.id = id;
}

extension SustainabilityMetricsQueryWhereSort
    on QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QWhere> {
  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SustainabilityMetricsQueryWhere on QueryBuilder<SustainabilityMetrics,
    SustainabilityMetrics, QWhereClause> {
  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
      itemIdEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterWhereClause>
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

extension SustainabilityMetricsQueryFilter on QueryBuilder<
    SustainabilityMetrics, SustainabilityMetrics, QFilterCondition> {
  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brandEthicsScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brandEthicsScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brandEthicsScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brandEthicsScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brandEthicsScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brandEthicsScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      brandEthicsScoreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brandEthicsScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      brandEthicsScoreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brandEthicsScore',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brandEthicsScore',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> brandEthicsScoreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brandEthicsScore',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> calculatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> carbonFootprintEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> carbonFootprintGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> carbonFootprintLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> carbonFootprintBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbonFootprint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'certifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'certifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'certifications',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'certifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'certifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      certificationsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'certifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      certificationsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'certifications',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certifications',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'certifications',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'certifications',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'certifications',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'certifications',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'certifications',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'certifications',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> certificationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'certifications',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> energyConsumptionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'energyConsumption',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> energyConsumptionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'energyConsumption',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> energyConsumptionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'energyConsumption',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> energyConsumptionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'energyConsumption',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> lastUpdatedGreaterThan(
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> lastUpdatedLessThan(
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> lastUpdatedBetween(
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

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialSustainabilityScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materialSustainabilityScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materialSustainabilityScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materialSustainabilityScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'materialSustainabilityScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'materialSustainabilityScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      materialSustainabilityScoreContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'materialSustainabilityScore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      materialSustainabilityScoreMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'materialSustainabilityScore',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialSustainabilityScore',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> materialSustainabilityScoreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'materialSustainabilityScore',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sustainablePractices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sustainablePractices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sustainablePractices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sustainablePractices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sustainablePractices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sustainablePractices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      sustainablePracticesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sustainablePractices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
          QAfterFilterCondition>
      sustainablePracticesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sustainablePractices',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sustainablePractices',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sustainablePractices',
        value: '',
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainablePractices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainablePractices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainablePractices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainablePractices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainablePractices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> sustainablePracticesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainablePractices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> waterUsageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterUsage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> waterUsageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterUsage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> waterUsageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterUsage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics,
      QAfterFilterCondition> waterUsageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterUsage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SustainabilityMetricsQueryObject on QueryBuilder<
    SustainabilityMetrics, SustainabilityMetrics, QFilterCondition> {}

extension SustainabilityMetricsQueryLinks on QueryBuilder<SustainabilityMetrics,
    SustainabilityMetrics, QFilterCondition> {}

extension SustainabilityMetricsQuerySortBy
    on QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QSortBy> {
  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByBrandEthicsScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandEthicsScore', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByBrandEthicsScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandEthicsScore', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByCarbonFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByEnergyConsumption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyConsumption', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByEnergyConsumptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyConsumption', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByMaterialSustainabilityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialSustainabilityScore', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByMaterialSustainabilityScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialSustainabilityScore', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByWaterUsage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterUsage', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      sortByWaterUsageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterUsage', Sort.desc);
    });
  }
}

extension SustainabilityMetricsQuerySortThenBy
    on QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QSortThenBy> {
  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByBrandEthicsScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandEthicsScore', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByBrandEthicsScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandEthicsScore', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByCarbonFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByEnergyConsumption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyConsumption', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByEnergyConsumptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyConsumption', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByMaterialSustainabilityScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialSustainabilityScore', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByMaterialSustainabilityScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialSustainabilityScore', Sort.desc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByWaterUsage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterUsage', Sort.asc);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QAfterSortBy>
      thenByWaterUsageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterUsage', Sort.desc);
    });
  }
}

extension SustainabilityMetricsQueryWhereDistinct
    on QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct> {
  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByBrandEthicsScore({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandEthicsScore',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedAt');
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbonFootprint');
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByCertifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'certifications');
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByEnergyConsumption() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'energyConsumption');
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByMaterialSustainabilityScore({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialSustainabilityScore',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctBySustainablePractices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sustainablePractices');
    });
  }

  QueryBuilder<SustainabilityMetrics, SustainabilityMetrics, QDistinct>
      distinctByWaterUsage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterUsage');
    });
  }
}

extension SustainabilityMetricsQueryProperty on QueryBuilder<
    SustainabilityMetrics, SustainabilityMetrics, QQueryProperty> {
  QueryBuilder<SustainabilityMetrics, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SustainabilityMetrics, String, QQueryOperations>
      brandEthicsScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandEthicsScore');
    });
  }

  QueryBuilder<SustainabilityMetrics, DateTime, QQueryOperations>
      calculatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedAt');
    });
  }

  QueryBuilder<SustainabilityMetrics, double, QQueryOperations>
      carbonFootprintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbonFootprint');
    });
  }

  QueryBuilder<SustainabilityMetrics, List<String>, QQueryOperations>
      certificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'certifications');
    });
  }

  QueryBuilder<SustainabilityMetrics, double, QQueryOperations>
      energyConsumptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'energyConsumption');
    });
  }

  QueryBuilder<SustainabilityMetrics, String, QQueryOperations>
      itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<SustainabilityMetrics, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<SustainabilityMetrics, String, QQueryOperations>
      materialSustainabilityScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialSustainabilityScore');
    });
  }

  QueryBuilder<SustainabilityMetrics, List<String>, QQueryOperations>
      sustainablePracticesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sustainablePractices');
    });
  }

  QueryBuilder<SustainabilityMetrics, double, QQueryOperations>
      waterUsageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterUsage');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWardrobeSustainabilityReportCollection on Isar {
  IsarCollection<WardrobeSustainabilityReport>
      get wardrobeSustainabilityReports => this.collection();
}

const WardrobeSustainabilityReportSchema = CollectionSchema(
  name: r'WardrobeSustainabilityReport',
  id: 4020270545423892967,
  properties: {
    r'averageItemFootprint': PropertySchema(
      id: 0,
      name: r'averageItemFootprint',
      type: IsarType.double,
    ),
    r'concerningBrands': PropertySchema(
      id: 1,
      name: r'concerningBrands',
      type: IsarType.stringList,
    ),
    r'costPerWearAverage': PropertySchema(
      id: 2,
      name: r'costPerWearAverage',
      type: IsarType.double,
    ),
    r'generatedAt': PropertySchema(
      id: 3,
      name: r'generatedAt',
      type: IsarType.dateTime,
    ),
    r'itemsToConsider': PropertySchema(
      id: 4,
      name: r'itemsToConsider',
      type: IsarType.stringList,
    ),
    r'reportDate': PropertySchema(
      id: 5,
      name: r'reportDate',
      type: IsarType.dateTime,
    ),
    r'sustainabilityRecommendations': PropertySchema(
      id: 6,
      name: r'sustainabilityRecommendations',
      type: IsarType.stringList,
    ),
    r'sustainableItemsCount': PropertySchema(
      id: 7,
      name: r'sustainableItemsCount',
      type: IsarType.long,
    ),
    r'topSustainableBrands': PropertySchema(
      id: 8,
      name: r'topSustainableBrands',
      type: IsarType.stringList,
    ),
    r'totalCarbonFootprint': PropertySchema(
      id: 9,
      name: r'totalCarbonFootprint',
      type: IsarType.double,
    ),
    r'totalItemsAnalyzed': PropertySchema(
      id: 10,
      name: r'totalItemsAnalyzed',
      type: IsarType.long,
    ),
    r'underutilizedItemsCount': PropertySchema(
      id: 11,
      name: r'underutilizedItemsCount',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 12,
      name: r'userId',
      type: IsarType.string,
    ),
    r'wearEfficiencyScore': PropertySchema(
      id: 13,
      name: r'wearEfficiencyScore',
      type: IsarType.double,
    )
  },
  estimateSize: _wardrobeSustainabilityReportEstimateSize,
  serialize: _wardrobeSustainabilityReportSerialize,
  deserialize: _wardrobeSustainabilityReportDeserialize,
  deserializeProp: _wardrobeSustainabilityReportDeserializeProp,
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
    r'reportDate': IndexSchema(
      id: -3469995908724995165,
      name: r'reportDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reportDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _wardrobeSustainabilityReportGetId,
  getLinks: _wardrobeSustainabilityReportGetLinks,
  attach: _wardrobeSustainabilityReportAttach,
  version: '3.1.0+1',
);

int _wardrobeSustainabilityReportEstimateSize(
  WardrobeSustainabilityReport object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.concerningBrands.length * 3;
  {
    for (var i = 0; i < object.concerningBrands.length; i++) {
      final value = object.concerningBrands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.itemsToConsider.length * 3;
  {
    for (var i = 0; i < object.itemsToConsider.length; i++) {
      final value = object.itemsToConsider[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.sustainabilityRecommendations.length * 3;
  {
    for (var i = 0; i < object.sustainabilityRecommendations.length; i++) {
      final value = object.sustainabilityRecommendations[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.topSustainableBrands.length * 3;
  {
    for (var i = 0; i < object.topSustainableBrands.length; i++) {
      final value = object.topSustainableBrands[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _wardrobeSustainabilityReportSerialize(
  WardrobeSustainabilityReport object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageItemFootprint);
  writer.writeStringList(offsets[1], object.concerningBrands);
  writer.writeDouble(offsets[2], object.costPerWearAverage);
  writer.writeDateTime(offsets[3], object.generatedAt);
  writer.writeStringList(offsets[4], object.itemsToConsider);
  writer.writeDateTime(offsets[5], object.reportDate);
  writer.writeStringList(offsets[6], object.sustainabilityRecommendations);
  writer.writeLong(offsets[7], object.sustainableItemsCount);
  writer.writeStringList(offsets[8], object.topSustainableBrands);
  writer.writeDouble(offsets[9], object.totalCarbonFootprint);
  writer.writeLong(offsets[10], object.totalItemsAnalyzed);
  writer.writeLong(offsets[11], object.underutilizedItemsCount);
  writer.writeString(offsets[12], object.userId);
  writer.writeDouble(offsets[13], object.wearEfficiencyScore);
}

WardrobeSustainabilityReport _wardrobeSustainabilityReportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WardrobeSustainabilityReport();
  object.averageItemFootprint = reader.readDouble(offsets[0]);
  object.concerningBrands = reader.readStringList(offsets[1]) ?? [];
  object.costPerWearAverage = reader.readDouble(offsets[2]);
  object.generatedAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.itemsToConsider = reader.readStringList(offsets[4]) ?? [];
  object.reportDate = reader.readDateTime(offsets[5]);
  object.sustainabilityRecommendations =
      reader.readStringList(offsets[6]) ?? [];
  object.sustainableItemsCount = reader.readLong(offsets[7]);
  object.topSustainableBrands = reader.readStringList(offsets[8]) ?? [];
  object.totalCarbonFootprint = reader.readDouble(offsets[9]);
  object.totalItemsAnalyzed = reader.readLong(offsets[10]);
  object.underutilizedItemsCount = reader.readLong(offsets[11]);
  object.userId = reader.readString(offsets[12]);
  object.wearEfficiencyScore = reader.readDouble(offsets[13]);
  return object;
}

P _wardrobeSustainabilityReportDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wardrobeSustainabilityReportGetId(WardrobeSustainabilityReport object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wardrobeSustainabilityReportGetLinks(
    WardrobeSustainabilityReport object) {
  return [];
}

void _wardrobeSustainabilityReportAttach(
    IsarCollection<dynamic> col, Id id, WardrobeSustainabilityReport object) {
  object.id = id;
}

extension WardrobeSustainabilityReportQueryWhereSort on QueryBuilder<
    WardrobeSustainabilityReport, WardrobeSustainabilityReport, QWhere> {
  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhere> anyReportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reportDate'),
      );
    });
  }
}

extension WardrobeSustainabilityReportQueryWhere on QueryBuilder<
    WardrobeSustainabilityReport, WardrobeSustainabilityReport, QWhereClause> {
  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> reportDateEqualTo(DateTime reportDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reportDate',
        value: [reportDate],
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> reportDateNotEqualTo(DateTime reportDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportDate',
              lower: [],
              upper: [reportDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportDate',
              lower: [reportDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportDate',
              lower: [reportDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportDate',
              lower: [],
              upper: [reportDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> reportDateGreaterThan(
    DateTime reportDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reportDate',
        lower: [reportDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> reportDateLessThan(
    DateTime reportDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reportDate',
        lower: [],
        upper: [reportDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterWhereClause> reportDateBetween(
    DateTime lowerReportDate,
    DateTime upperReportDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reportDate',
        lower: [lowerReportDate],
        includeLower: includeLower,
        upper: [upperReportDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WardrobeSustainabilityReportQueryFilter on QueryBuilder<
    WardrobeSustainabilityReport,
    WardrobeSustainabilityReport,
    QFilterCondition> {
  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> averageItemFootprintEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageItemFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> averageItemFootprintGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageItemFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> averageItemFootprintLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageItemFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> averageItemFootprintBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageItemFootprint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concerningBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'concerningBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'concerningBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'concerningBrands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'concerningBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'concerningBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      concerningBrandsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'concerningBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      concerningBrandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'concerningBrands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'concerningBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'concerningBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concerningBrands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concerningBrands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concerningBrands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concerningBrands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concerningBrands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> concerningBrandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'concerningBrands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> costPerWearAverageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costPerWearAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> costPerWearAverageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costPerWearAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> costPerWearAverageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costPerWearAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> costPerWearAverageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costPerWearAverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> generatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> generatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> generatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> generatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemsToConsider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemsToConsider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemsToConsider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemsToConsider',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemsToConsider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemsToConsider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      itemsToConsiderElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemsToConsider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      itemsToConsiderElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemsToConsider',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemsToConsider',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemsToConsider',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsToConsider',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsToConsider',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsToConsider',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsToConsider',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsToConsider',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> itemsToConsiderLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsToConsider',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> reportDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> reportDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> reportDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> reportDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sustainabilityRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sustainabilityRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sustainabilityRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sustainabilityRecommendations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sustainabilityRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sustainabilityRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      sustainabilityRecommendationsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sustainabilityRecommendations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      sustainabilityRecommendationsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sustainabilityRecommendations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sustainabilityRecommendations',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sustainabilityRecommendations',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      sustainabilityRecommendationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainabilityRecommendations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainabilityRecommendations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainabilityRecommendations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainabilityRecommendations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainabilityRecommendations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainabilityRecommendationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sustainabilityRecommendations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainableItemsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sustainableItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainableItemsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sustainableItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainableItemsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sustainableItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> sustainableItemsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sustainableItemsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topSustainableBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topSustainableBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topSustainableBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topSustainableBrands',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'topSustainableBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'topSustainableBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      topSustainableBrandsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'topSustainableBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
          QAfterFilterCondition>
      topSustainableBrandsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'topSustainableBrands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topSustainableBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'topSustainableBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topSustainableBrands',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topSustainableBrands',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topSustainableBrands',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topSustainableBrands',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topSustainableBrands',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> topSustainableBrandsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topSustainableBrands',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalCarbonFootprintEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCarbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalCarbonFootprintGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCarbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalCarbonFootprintLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCarbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalCarbonFootprintBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCarbonFootprint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalItemsAnalyzedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItemsAnalyzed',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalItemsAnalyzedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalItemsAnalyzed',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalItemsAnalyzedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalItemsAnalyzed',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> totalItemsAnalyzedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalItemsAnalyzed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> underutilizedItemsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'underutilizedItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> underutilizedItemsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'underutilizedItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> underutilizedItemsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'underutilizedItemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> underutilizedItemsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'underutilizedItemsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
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

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> wearEfficiencyScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wearEfficiencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> wearEfficiencyScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wearEfficiencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> wearEfficiencyScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wearEfficiencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterFilterCondition> wearEfficiencyScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wearEfficiencyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WardrobeSustainabilityReportQueryObject on QueryBuilder<
    WardrobeSustainabilityReport,
    WardrobeSustainabilityReport,
    QFilterCondition> {}

extension WardrobeSustainabilityReportQueryLinks on QueryBuilder<
    WardrobeSustainabilityReport,
    WardrobeSustainabilityReport,
    QFilterCondition> {}

extension WardrobeSustainabilityReportQuerySortBy on QueryBuilder<
    WardrobeSustainabilityReport, WardrobeSustainabilityReport, QSortBy> {
  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByAverageItemFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageItemFootprint', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByAverageItemFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageItemFootprint', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByCostPerWearAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPerWearAverage', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByCostPerWearAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPerWearAverage', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByReportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportDate', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByReportDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportDate', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortBySustainableItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainableItemsCount', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortBySustainableItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainableItemsCount', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByTotalCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbonFootprint', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByTotalCarbonFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbonFootprint', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByTotalItemsAnalyzed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsAnalyzed', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByTotalItemsAnalyzedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsAnalyzed', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByUnderutilizedItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underutilizedItemsCount', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByUnderutilizedItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underutilizedItemsCount', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByWearEfficiencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wearEfficiencyScore', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> sortByWearEfficiencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wearEfficiencyScore', Sort.desc);
    });
  }
}

extension WardrobeSustainabilityReportQuerySortThenBy on QueryBuilder<
    WardrobeSustainabilityReport, WardrobeSustainabilityReport, QSortThenBy> {
  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByAverageItemFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageItemFootprint', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByAverageItemFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageItemFootprint', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByCostPerWearAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPerWearAverage', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByCostPerWearAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPerWearAverage', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByReportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportDate', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByReportDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportDate', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenBySustainableItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainableItemsCount', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenBySustainableItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainableItemsCount', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByTotalCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbonFootprint', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByTotalCarbonFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCarbonFootprint', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByTotalItemsAnalyzed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsAnalyzed', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByTotalItemsAnalyzedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItemsAnalyzed', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByUnderutilizedItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underutilizedItemsCount', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByUnderutilizedItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underutilizedItemsCount', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByWearEfficiencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wearEfficiencyScore', Sort.asc);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QAfterSortBy> thenByWearEfficiencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wearEfficiencyScore', Sort.desc);
    });
  }
}

extension WardrobeSustainabilityReportQueryWhereDistinct on QueryBuilder<
    WardrobeSustainabilityReport, WardrobeSustainabilityReport, QDistinct> {
  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByAverageItemFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageItemFootprint');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByConcerningBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'concerningBrands');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByCostPerWearAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costPerWearAverage');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAt');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByItemsToConsider() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemsToConsider');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByReportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportDate');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctBySustainabilityRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sustainabilityRecommendations');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctBySustainableItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sustainableItemsCount');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByTopSustainableBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topSustainableBrands');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByTotalCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCarbonFootprint');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByTotalItemsAnalyzed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItemsAnalyzed');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByUnderutilizedItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'underutilizedItemsCount');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, WardrobeSustainabilityReport,
      QDistinct> distinctByWearEfficiencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wearEfficiencyScore');
    });
  }
}

extension WardrobeSustainabilityReportQueryProperty on QueryBuilder<
    WardrobeSustainabilityReport,
    WardrobeSustainabilityReport,
    QQueryProperty> {
  QueryBuilder<WardrobeSustainabilityReport, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, double, QQueryOperations>
      averageItemFootprintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageItemFootprint');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, List<String>, QQueryOperations>
      concerningBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'concerningBrands');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, double, QQueryOperations>
      costPerWearAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costPerWearAverage');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, DateTime, QQueryOperations>
      generatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAt');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, List<String>, QQueryOperations>
      itemsToConsiderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsToConsider');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, DateTime, QQueryOperations>
      reportDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportDate');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, List<String>, QQueryOperations>
      sustainabilityRecommendationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sustainabilityRecommendations');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, int, QQueryOperations>
      sustainableItemsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sustainableItemsCount');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, List<String>, QQueryOperations>
      topSustainableBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topSustainableBrands');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, double, QQueryOperations>
      totalCarbonFootprintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCarbonFootprint');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, int, QQueryOperations>
      totalItemsAnalyzedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItemsAnalyzed');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, int, QQueryOperations>
      underutilizedItemsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'underutilizedItemsCount');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<WardrobeSustainabilityReport, double, QQueryOperations>
      wearEfficiencyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wearEfficiencyScore');
    });
  }
}
