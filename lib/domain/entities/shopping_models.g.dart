// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoppingSuggestionCollection on Isar {
  IsarCollection<ShoppingSuggestion> get shoppingSuggestions =>
      this.collection();
}

const ShoppingSuggestionSchema = CollectionSchema(
  name: r'ShoppingSuggestion',
  id: -5745266664116278505,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'clothingType': PropertySchema(
      id: 1,
      name: r'clothingType',
      type: IsarType.string,
      enumMap: _ShoppingSuggestionclothingTypeEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'detailedReason': PropertySchema(
      id: 3,
      name: r'detailedReason',
      type: IsarType.string,
    ),
    r'dismissedAt': PropertySchema(
      id: 4,
      name: r'dismissedAt',
      type: IsarType.dateTime,
    ),
    r'estimatedPrice': PropertySchema(
      id: 5,
      name: r'estimatedPrice',
      type: IsarType.double,
    ),
    r'isBookmarked': PropertySchema(
      id: 6,
      name: r'isBookmarked',
      type: IsarType.bool,
    ),
    r'isDismissed': PropertySchema(
      id: 7,
      name: r'isDismissed',
      type: IsarType.bool,
    ),
    r'itemName': PropertySchema(
      id: 8,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 9,
      name: r'priority',
      type: IsarType.long,
    ),
    r'reason': PropertySchema(
      id: 10,
      name: r'reason',
      type: IsarType.string,
    ),
    r'relatedOutfitIds': PropertySchema(
      id: 11,
      name: r'relatedOutfitIds',
      type: IsarType.stringList,
    ),
    r'season': PropertySchema(
      id: 12,
      name: r'season',
      type: IsarType.string,
      enumMap: _ShoppingSuggestionseasonEnumValueMap,
    ),
    r'style': PropertySchema(
      id: 13,
      name: r'style',
      type: IsarType.string,
    ),
    r'suggestedColors': PropertySchema(
      id: 14,
      name: r'suggestedColors',
      type: IsarType.stringList,
    ),
    r'tags': PropertySchema(
      id: 15,
      name: r'tags',
      type: IsarType.stringList,
    )
  },
  estimateSize: _shoppingSuggestionEstimateSize,
  serialize: _shoppingSuggestionSerialize,
  deserialize: _shoppingSuggestionDeserialize,
  deserializeProp: _shoppingSuggestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _shoppingSuggestionGetId,
  getLinks: _shoppingSuggestionGetLinks,
  attach: _shoppingSuggestionAttach,
  version: '3.1.0+1',
);

int _shoppingSuggestionEstimateSize(
  ShoppingSuggestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.clothingType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.detailedReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.reason.length * 3;
  bytesCount += 3 + object.relatedOutfitIds.length * 3;
  {
    for (var i = 0; i < object.relatedOutfitIds.length; i++) {
      final value = object.relatedOutfitIds[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.season;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.style;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.suggestedColors.length * 3;
  {
    for (var i = 0; i < object.suggestedColors.length; i++) {
      final value = object.suggestedColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _shoppingSuggestionSerialize(
  ShoppingSuggestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeString(offsets[1], object.clothingType?.name);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.detailedReason);
  writer.writeDateTime(offsets[4], object.dismissedAt);
  writer.writeDouble(offsets[5], object.estimatedPrice);
  writer.writeBool(offsets[6], object.isBookmarked);
  writer.writeBool(offsets[7], object.isDismissed);
  writer.writeString(offsets[8], object.itemName);
  writer.writeLong(offsets[9], object.priority);
  writer.writeString(offsets[10], object.reason);
  writer.writeStringList(offsets[11], object.relatedOutfitIds);
  writer.writeString(offsets[12], object.season?.name);
  writer.writeString(offsets[13], object.style);
  writer.writeStringList(offsets[14], object.suggestedColors);
  writer.writeStringList(offsets[15], object.tags);
}

ShoppingSuggestion _shoppingSuggestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppingSuggestion();
  object.category = reader.readString(offsets[0]);
  object.clothingType = _ShoppingSuggestionclothingTypeValueEnumMap[
      reader.readStringOrNull(offsets[1])];
  object.createdAt = reader.readDateTime(offsets[2]);
  object.detailedReason = reader.readStringOrNull(offsets[3]);
  object.dismissedAt = reader.readDateTimeOrNull(offsets[4]);
  object.estimatedPrice = reader.readDouble(offsets[5]);
  object.id = id;
  object.isBookmarked = reader.readBool(offsets[6]);
  object.isDismissed = reader.readBool(offsets[7]);
  object.itemName = reader.readString(offsets[8]);
  object.priority = reader.readLong(offsets[9]);
  object.reason = reader.readString(offsets[10]);
  object.relatedOutfitIds = reader.readStringList(offsets[11]) ?? [];
  object.season = _ShoppingSuggestionseasonValueEnumMap[
      reader.readStringOrNull(offsets[12])];
  object.style = reader.readStringOrNull(offsets[13]);
  object.suggestedColors = reader.readStringList(offsets[14]) ?? [];
  object.tags = reader.readStringList(offsets[15]) ?? [];
  return object;
}

P _shoppingSuggestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_ShoppingSuggestionclothingTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (_ShoppingSuggestionseasonValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringList(offset) ?? []) as P;
    case 15:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShoppingSuggestionclothingTypeEnumValueMap = {
  r'top': r'top',
  r'bottom': r'bottom',
  r'shoes': r'shoes',
  r'accessory': r'accessory',
  r'outerwear': r'outerwear',
  r'undergarment': r'undergarment',
  r'jewelry': r'jewelry',
  r'bag': r'bag',
  r'hat': r'hat',
  r'scarf': r'scarf',
  r'belt': r'belt',
  r'gloves': r'gloves',
  r'swimwear': r'swimwear',
  r'sleepwear': r'sleepwear',
  r'activewear': r'activewear',
  r'dress': r'dress',
  r'jumpsuit': r'jumpsuit',
  r'suit': r'suit',
};
const _ShoppingSuggestionclothingTypeValueEnumMap = {
  r'top': ClothingType.top,
  r'bottom': ClothingType.bottom,
  r'shoes': ClothingType.shoes,
  r'accessory': ClothingType.accessory,
  r'outerwear': ClothingType.outerwear,
  r'undergarment': ClothingType.undergarment,
  r'jewelry': ClothingType.jewelry,
  r'bag': ClothingType.bag,
  r'hat': ClothingType.hat,
  r'scarf': ClothingType.scarf,
  r'belt': ClothingType.belt,
  r'gloves': ClothingType.gloves,
  r'swimwear': ClothingType.swimwear,
  r'sleepwear': ClothingType.sleepwear,
  r'activewear': ClothingType.activewear,
  r'dress': ClothingType.dress,
  r'jumpsuit': ClothingType.jumpsuit,
  r'suit': ClothingType.suit,
};
const _ShoppingSuggestionseasonEnumValueMap = {
  r'spring': r'spring',
  r'summer': r'summer',
  r'autumn': r'autumn',
  r'winter': r'winter',
  r'allSeason': r'allSeason',
};
const _ShoppingSuggestionseasonValueEnumMap = {
  r'spring': Season.spring,
  r'summer': Season.summer,
  r'autumn': Season.autumn,
  r'winter': Season.winter,
  r'allSeason': Season.allSeason,
};

Id _shoppingSuggestionGetId(ShoppingSuggestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shoppingSuggestionGetLinks(
    ShoppingSuggestion object) {
  return [];
}

void _shoppingSuggestionAttach(
    IsarCollection<dynamic> col, Id id, ShoppingSuggestion object) {
  object.id = id;
}

extension ShoppingSuggestionQueryWhereSort
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QWhere> {
  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoppingSuggestionQueryWhere
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QWhereClause> {
  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterWhereClause>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterWhereClause>
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

extension ShoppingSuggestionQueryFilter
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QFilterCondition> {
  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryLessThan(
    String value, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clothingType',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clothingType',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeEqualTo(
    ClothingType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clothingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeGreaterThan(
    ClothingType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clothingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeLessThan(
    ClothingType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clothingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeBetween(
    ClothingType? lower,
    ClothingType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clothingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clothingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clothingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clothingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clothingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clothingType',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      clothingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clothingType',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'detailedReason',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'detailedReason',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailedReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailedReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailedReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailedReason',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      detailedReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailedReason',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      dismissedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dismissedAt',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      dismissedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dismissedAt',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      dismissedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dismissedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      dismissedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dismissedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      dismissedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dismissedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      dismissedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dismissedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      estimatedPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      estimatedPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      estimatedPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      estimatedPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      isBookmarkedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBookmarked',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      isDismissedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDismissed',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relatedOutfitIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'relatedOutfitIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relatedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'relatedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      relatedOutfitIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonEqualTo(
    Season? value, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonGreaterThan(
    Season? value, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonLessThan(
    Season? value, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonBetween(
    Season? lower,
    Season? upper, {
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'season',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      seasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'style',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'style',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'style',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'style',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'style',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      styleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'style',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestedColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestedColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      suggestedColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterFilterCondition>
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
}

extension ShoppingSuggestionQueryObject
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QFilterCondition> {}

extension ShoppingSuggestionQueryLinks
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QFilterCondition> {}

extension ShoppingSuggestionQuerySortBy
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QSortBy> {
  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByClothingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothingType', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByClothingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothingType', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByDetailedReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailedReason', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByDetailedReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailedReason', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByDismissedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissedAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByDismissedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissedAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByIsBookmarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByIsDismissed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDismissed', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByIsDismissedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDismissed', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      sortByStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.desc);
    });
  }
}

extension ShoppingSuggestionQuerySortThenBy
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QSortThenBy> {
  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByClothingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothingType', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByClothingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothingType', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByDetailedReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailedReason', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByDetailedReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailedReason', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByDismissedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissedAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByDismissedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissedAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByIsBookmarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByIsDismissed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDismissed', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByIsDismissedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDismissed', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.asc);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QAfterSortBy>
      thenByStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.desc);
    });
  }
}

extension ShoppingSuggestionQueryWhereDistinct
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct> {
  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByClothingType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clothingType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByDetailedReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailedReason',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByDismissedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dismissedAt');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedPrice');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBookmarked');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByIsDismissed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDismissed');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByRelatedOutfitIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relatedOutfitIds');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctBySeason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByStyle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'style', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctBySuggestedColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestedColors');
    });
  }

  QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QDistinct>
      distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }
}

extension ShoppingSuggestionQueryProperty
    on QueryBuilder<ShoppingSuggestion, ShoppingSuggestion, QQueryProperty> {
  QueryBuilder<ShoppingSuggestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShoppingSuggestion, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ShoppingSuggestion, ClothingType?, QQueryOperations>
      clothingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clothingType');
    });
  }

  QueryBuilder<ShoppingSuggestion, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ShoppingSuggestion, String?, QQueryOperations>
      detailedReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailedReason');
    });
  }

  QueryBuilder<ShoppingSuggestion, DateTime?, QQueryOperations>
      dismissedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dismissedAt');
    });
  }

  QueryBuilder<ShoppingSuggestion, double, QQueryOperations>
      estimatedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedPrice');
    });
  }

  QueryBuilder<ShoppingSuggestion, bool, QQueryOperations>
      isBookmarkedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBookmarked');
    });
  }

  QueryBuilder<ShoppingSuggestion, bool, QQueryOperations>
      isDismissedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDismissed');
    });
  }

  QueryBuilder<ShoppingSuggestion, String, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ShoppingSuggestion, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<ShoppingSuggestion, String, QQueryOperations> reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<ShoppingSuggestion, List<String>, QQueryOperations>
      relatedOutfitIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relatedOutfitIds');
    });
  }

  QueryBuilder<ShoppingSuggestion, Season?, QQueryOperations> seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<ShoppingSuggestion, String?, QQueryOperations> styleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'style');
    });
  }

  QueryBuilder<ShoppingSuggestion, List<String>, QQueryOperations>
      suggestedColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestedColors');
    });
  }

  QueryBuilder<ShoppingSuggestion, List<String>, QQueryOperations>
      tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoppingListCollection on Isar {
  IsarCollection<ShoppingList> get shoppingLists => this.collection();
}

const ShoppingListSchema = CollectionSchema(
  name: r'ShoppingList',
  id: 4550947625737655976,
  properties: {
    r'budget': PropertySchema(
      id: 0,
      name: r'budget',
      type: IsarType.double,
    ),
    r'categories': PropertySchema(
      id: 1,
      name: r'categories',
      type: IsarType.stringList,
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
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 5,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 6,
      name: r'items',
      type: IsarType.objectList,
      target: r'ShoppingListItem',
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'plannedShoppingDate': PropertySchema(
      id: 8,
      name: r'plannedShoppingDate',
      type: IsarType.dateTime,
    ),
    r'plannedStore': PropertySchema(
      id: 9,
      name: r'plannedStore',
      type: IsarType.string,
    ),
    r'totalActualCost': PropertySchema(
      id: 10,
      name: r'totalActualCost',
      type: IsarType.double,
    ),
    r'totalEstimatedCost': PropertySchema(
      id: 11,
      name: r'totalEstimatedCost',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _shoppingListEstimateSize,
  serialize: _shoppingListSerialize,
  deserialize: _shoppingListDeserialize,
  deserializeProp: _shoppingListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ShoppingListItem': ShoppingListItemSchema},
  getId: _shoppingListGetId,
  getLinks: _shoppingListGetLinks,
  attach: _shoppingListAttach,
  version: '3.1.0+1',
);

int _shoppingListEstimateSize(
  ShoppingList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[ShoppingListItem]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount +=
          ShoppingListItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.plannedStore;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _shoppingListSerialize(
  ShoppingList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.budget);
  writer.writeStringList(offsets[1], object.categories);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.description);
  writer.writeBool(offsets[5], object.isCompleted);
  writer.writeObjectList<ShoppingListItem>(
    offsets[6],
    allOffsets,
    ShoppingListItemSchema.serialize,
    object.items,
  );
  writer.writeString(offsets[7], object.name);
  writer.writeDateTime(offsets[8], object.plannedShoppingDate);
  writer.writeString(offsets[9], object.plannedStore);
  writer.writeDouble(offsets[10], object.totalActualCost);
  writer.writeDouble(offsets[11], object.totalEstimatedCost);
  writer.writeDateTime(offsets[12], object.updatedAt);
}

ShoppingList _shoppingListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppingList();
  object.budget = reader.readDouble(offsets[0]);
  object.categories = reader.readStringList(offsets[1]) ?? [];
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.description = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[5]);
  object.items = reader.readObjectList<ShoppingListItem>(
        offsets[6],
        ShoppingListItemSchema.deserialize,
        allOffsets,
        ShoppingListItem(),
      ) ??
      [];
  object.name = reader.readString(offsets[7]);
  object.plannedShoppingDate = reader.readDateTimeOrNull(offsets[8]);
  object.plannedStore = reader.readStringOrNull(offsets[9]);
  object.totalActualCost = reader.readDouble(offsets[10]);
  object.totalEstimatedCost = reader.readDouble(offsets[11]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[12]);
  return object;
}

P _shoppingListDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readObjectList<ShoppingListItem>(
            offset,
            ShoppingListItemSchema.deserialize,
            allOffsets,
            ShoppingListItem(),
          ) ??
          []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shoppingListGetId(ShoppingList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shoppingListGetLinks(ShoppingList object) {
  return [];
}

void _shoppingListAttach(
    IsarCollection<dynamic> col, Id id, ShoppingList object) {
  object.id = id;
}

extension ShoppingListQueryWhereSort
    on QueryBuilder<ShoppingList, ShoppingList, QWhere> {
  QueryBuilder<ShoppingList, ShoppingList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoppingListQueryWhere
    on QueryBuilder<ShoppingList, ShoppingList, QWhereClause> {
  QueryBuilder<ShoppingList, ShoppingList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterWhereClause> idBetween(
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

extension ShoppingListQueryFilter
    on QueryBuilder<ShoppingList, ShoppingList, QFilterCondition> {
  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> budgetEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'budget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      budgetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'budget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      budgetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'budget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> budgetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'budget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedShoppingDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedShoppingDate',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedShoppingDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedShoppingDate',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedShoppingDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedShoppingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedShoppingDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedShoppingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedShoppingDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedShoppingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedShoppingDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedShoppingDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedStore',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedStore',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedStore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plannedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plannedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plannedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plannedStore',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedStore',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      plannedStoreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plannedStore',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalActualCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalActualCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalActualCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalActualCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalActualCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalActualCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalActualCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalActualCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalEstimatedCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEstimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalEstimatedCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEstimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalEstimatedCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEstimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      totalEstimatedCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEstimatedCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition>
      updatedAtBetween(
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
}

extension ShoppingListQueryObject
    on QueryBuilder<ShoppingList, ShoppingList, QFilterCondition> {
  QueryBuilder<ShoppingList, ShoppingList, QAfterFilterCondition> itemsElement(
      FilterQuery<ShoppingListItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension ShoppingListQueryLinks
    on QueryBuilder<ShoppingList, ShoppingList, QFilterCondition> {}

extension ShoppingListQuerySortBy
    on QueryBuilder<ShoppingList, ShoppingList, QSortBy> {
  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByPlannedShoppingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedShoppingDate', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByPlannedShoppingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedShoppingDate', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByPlannedStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStore', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByPlannedStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStore', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByTotalActualCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalActualCost', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByTotalActualCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalActualCost', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByTotalEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimatedCost', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      sortByTotalEstimatedCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimatedCost', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ShoppingListQuerySortThenBy
    on QueryBuilder<ShoppingList, ShoppingList, QSortThenBy> {
  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByPlannedShoppingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedShoppingDate', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByPlannedShoppingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedShoppingDate', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByPlannedStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStore', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByPlannedStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStore', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByTotalActualCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalActualCost', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByTotalActualCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalActualCost', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByTotalEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimatedCost', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy>
      thenByTotalEstimatedCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEstimatedCost', Sort.desc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ShoppingListQueryWhereDistinct
    on QueryBuilder<ShoppingList, ShoppingList, QDistinct> {
  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'budget');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct>
      distinctByPlannedShoppingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedShoppingDate');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByPlannedStore(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedStore', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct>
      distinctByTotalActualCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalActualCost');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct>
      distinctByTotalEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEstimatedCost');
    });
  }

  QueryBuilder<ShoppingList, ShoppingList, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ShoppingListQueryProperty
    on QueryBuilder<ShoppingList, ShoppingList, QQueryProperty> {
  QueryBuilder<ShoppingList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShoppingList, double, QQueryOperations> budgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'budget');
    });
  }

  QueryBuilder<ShoppingList, List<String>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<ShoppingList, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<ShoppingList, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ShoppingList, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ShoppingList, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<ShoppingList, List<ShoppingListItem>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<ShoppingList, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ShoppingList, DateTime?, QQueryOperations>
      plannedShoppingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedShoppingDate');
    });
  }

  QueryBuilder<ShoppingList, String?, QQueryOperations> plannedStoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedStore');
    });
  }

  QueryBuilder<ShoppingList, double, QQueryOperations>
      totalActualCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalActualCost');
    });
  }

  QueryBuilder<ShoppingList, double, QQueryOperations>
      totalEstimatedCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEstimatedCost');
    });
  }

  QueryBuilder<ShoppingList, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPriceAlertCollection on Isar {
  IsarCollection<PriceAlert> get priceAlerts => this.collection();
}

const PriceAlertSchema = CollectionSchema(
  name: r'PriceAlert',
  id: -5963392935112613731,
  properties: {
    r'alertTriggered': PropertySchema(
      id: 0,
      name: r'alertTriggered',
      type: IsarType.dateTime,
    ),
    r'checkFrequency': PropertySchema(
      id: 1,
      name: r'checkFrequency',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentPrice': PropertySchema(
      id: 3,
      name: r'currentPrice',
      type: IsarType.double,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'itemName': PropertySchema(
      id: 5,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'lastChecked': PropertySchema(
      id: 6,
      name: r'lastChecked',
      type: IsarType.dateTime,
    ),
    r'notifyOnBackInStock': PropertySchema(
      id: 7,
      name: r'notifyOnBackInStock',
      type: IsarType.bool,
    ),
    r'notifyOnPriceDrop': PropertySchema(
      id: 8,
      name: r'notifyOnPriceDrop',
      type: IsarType.bool,
    ),
    r'originalPrice': PropertySchema(
      id: 9,
      name: r'originalPrice',
      type: IsarType.double,
    ),
    r'productUrl': PropertySchema(
      id: 10,
      name: r'productUrl',
      type: IsarType.string,
    ),
    r'storeName': PropertySchema(
      id: 11,
      name: r'storeName',
      type: IsarType.string,
    ),
    r'targetPrice': PropertySchema(
      id: 12,
      name: r'targetPrice',
      type: IsarType.double,
    ),
    r'wasTriggered': PropertySchema(
      id: 13,
      name: r'wasTriggered',
      type: IsarType.bool,
    )
  },
  estimateSize: _priceAlertEstimateSize,
  serialize: _priceAlertSerialize,
  deserialize: _priceAlertDeserialize,
  deserializeProp: _priceAlertDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _priceAlertGetId,
  getLinks: _priceAlertGetLinks,
  attach: _priceAlertAttach,
  version: '3.1.0+1',
);

int _priceAlertEstimateSize(
  PriceAlert object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.productUrl.length * 3;
  bytesCount += 3 + object.storeName.length * 3;
  return bytesCount;
}

void _priceAlertSerialize(
  PriceAlert object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.alertTriggered);
  writer.writeLong(offsets[1], object.checkFrequency);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.currentPrice);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeString(offsets[5], object.itemName);
  writer.writeDateTime(offsets[6], object.lastChecked);
  writer.writeBool(offsets[7], object.notifyOnBackInStock);
  writer.writeBool(offsets[8], object.notifyOnPriceDrop);
  writer.writeDouble(offsets[9], object.originalPrice);
  writer.writeString(offsets[10], object.productUrl);
  writer.writeString(offsets[11], object.storeName);
  writer.writeDouble(offsets[12], object.targetPrice);
  writer.writeBool(offsets[13], object.wasTriggered);
}

PriceAlert _priceAlertDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PriceAlert();
  object.alertTriggered = reader.readDateTimeOrNull(offsets[0]);
  object.checkFrequency = reader.readLong(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.currentPrice = reader.readDouble(offsets[3]);
  object.id = id;
  object.isActive = reader.readBool(offsets[4]);
  object.itemName = reader.readString(offsets[5]);
  object.lastChecked = reader.readDateTimeOrNull(offsets[6]);
  object.notifyOnBackInStock = reader.readBool(offsets[7]);
  object.notifyOnPriceDrop = reader.readBool(offsets[8]);
  object.originalPrice = reader.readDoubleOrNull(offsets[9]);
  object.productUrl = reader.readString(offsets[10]);
  object.storeName = reader.readString(offsets[11]);
  object.targetPrice = reader.readDouble(offsets[12]);
  object.wasTriggered = reader.readBool(offsets[13]);
  return object;
}

P _priceAlertDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _priceAlertGetId(PriceAlert object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _priceAlertGetLinks(PriceAlert object) {
  return [];
}

void _priceAlertAttach(IsarCollection<dynamic> col, Id id, PriceAlert object) {
  object.id = id;
}

extension PriceAlertQueryWhereSort
    on QueryBuilder<PriceAlert, PriceAlert, QWhere> {
  QueryBuilder<PriceAlert, PriceAlert, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PriceAlertQueryWhere
    on QueryBuilder<PriceAlert, PriceAlert, QWhereClause> {
  QueryBuilder<PriceAlert, PriceAlert, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterWhereClause> idBetween(
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

extension PriceAlertQueryFilter
    on QueryBuilder<PriceAlert, PriceAlert, QFilterCondition> {
  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      alertTriggeredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alertTriggered',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      alertTriggeredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alertTriggered',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      alertTriggeredEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alertTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      alertTriggeredGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alertTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      alertTriggeredLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alertTriggered',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      alertTriggeredBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alertTriggered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      checkFrequencyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      checkFrequencyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      checkFrequencyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      checkFrequencyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkFrequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      currentPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      currentPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      currentPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      currentPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> itemNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> itemNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      lastCheckedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastChecked',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      lastCheckedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastChecked',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      lastCheckedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastChecked',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      lastCheckedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastChecked',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      lastCheckedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastChecked',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      lastCheckedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastChecked',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      notifyOnBackInStockEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnBackInStock',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      notifyOnPriceDropEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnPriceDrop',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      originalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalPrice',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      originalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalPrice',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      originalPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      originalPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      originalPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      originalPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> productUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> productUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> productUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      productUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> storeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      storeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> storeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> storeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      storeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> storeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> storeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition> storeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      storeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      storeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      targetPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      targetPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      targetPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      targetPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterFilterCondition>
      wasTriggeredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasTriggered',
        value: value,
      ));
    });
  }
}

extension PriceAlertQueryObject
    on QueryBuilder<PriceAlert, PriceAlert, QFilterCondition> {}

extension PriceAlertQueryLinks
    on QueryBuilder<PriceAlert, PriceAlert, QFilterCondition> {}

extension PriceAlertQuerySortBy
    on QueryBuilder<PriceAlert, PriceAlert, QSortBy> {
  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByAlertTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alertTriggered', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      sortByAlertTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alertTriggered', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByCheckFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFrequency', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      sortByCheckFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFrequency', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByCurrentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByLastChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChecked', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByLastCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChecked', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      sortByNotifyOnBackInStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnBackInStock', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      sortByNotifyOnBackInStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnBackInStock', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByNotifyOnPriceDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrop', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      sortByNotifyOnPriceDropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrop', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByOriginalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByProductUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByProductUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByTargetPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByTargetPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByWasTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasTriggered', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> sortByWasTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasTriggered', Sort.desc);
    });
  }
}

extension PriceAlertQuerySortThenBy
    on QueryBuilder<PriceAlert, PriceAlert, QSortThenBy> {
  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByAlertTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alertTriggered', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      thenByAlertTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alertTriggered', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByCheckFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFrequency', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      thenByCheckFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFrequency', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByCurrentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByLastChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChecked', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByLastCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastChecked', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      thenByNotifyOnBackInStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnBackInStock', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      thenByNotifyOnBackInStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnBackInStock', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByNotifyOnPriceDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrop', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy>
      thenByNotifyOnPriceDropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrop', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByOriginalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByProductUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByProductUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByTargetPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByTargetPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.desc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByWasTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasTriggered', Sort.asc);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QAfterSortBy> thenByWasTriggeredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasTriggered', Sort.desc);
    });
  }
}

extension PriceAlertQueryWhereDistinct
    on QueryBuilder<PriceAlert, PriceAlert, QDistinct> {
  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByAlertTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alertTriggered');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByCheckFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkFrequency');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPrice');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByLastChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastChecked');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct>
      distinctByNotifyOnBackInStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnBackInStock');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct>
      distinctByNotifyOnPriceDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnPriceDrop');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalPrice');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByProductUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByStoreName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByTargetPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPrice');
    });
  }

  QueryBuilder<PriceAlert, PriceAlert, QDistinct> distinctByWasTriggered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasTriggered');
    });
  }
}

extension PriceAlertQueryProperty
    on QueryBuilder<PriceAlert, PriceAlert, QQueryProperty> {
  QueryBuilder<PriceAlert, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PriceAlert, DateTime?, QQueryOperations>
      alertTriggeredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alertTriggered');
    });
  }

  QueryBuilder<PriceAlert, int, QQueryOperations> checkFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkFrequency');
    });
  }

  QueryBuilder<PriceAlert, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PriceAlert, double, QQueryOperations> currentPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPrice');
    });
  }

  QueryBuilder<PriceAlert, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<PriceAlert, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<PriceAlert, DateTime?, QQueryOperations> lastCheckedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastChecked');
    });
  }

  QueryBuilder<PriceAlert, bool, QQueryOperations>
      notifyOnBackInStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnBackInStock');
    });
  }

  QueryBuilder<PriceAlert, bool, QQueryOperations> notifyOnPriceDropProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnPriceDrop');
    });
  }

  QueryBuilder<PriceAlert, double?, QQueryOperations> originalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalPrice');
    });
  }

  QueryBuilder<PriceAlert, String, QQueryOperations> productUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productUrl');
    });
  }

  QueryBuilder<PriceAlert, String, QQueryOperations> storeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeName');
    });
  }

  QueryBuilder<PriceAlert, double, QQueryOperations> targetPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPrice');
    });
  }

  QueryBuilder<PriceAlert, bool, QQueryOperations> wasTriggeredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasTriggered');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPurchaseRecordCollection on Isar {
  IsarCollection<PurchaseRecord> get purchaseRecords => this.collection();
}

const PurchaseRecordSchema = CollectionSchema(
  name: r'PurchaseRecord',
  id: -8176708902952183205,
  properties: {
    r'actualPrice': PropertySchema(
      id: 0,
      name: r'actualPrice',
      type: IsarType.double,
    ),
    r'brand': PropertySchema(
      id: 1,
      name: r'brand',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'color': PropertySchema(
      id: 3,
      name: r'color',
      type: IsarType.string,
    ),
    r'estimatedPrice': PropertySchema(
      id: 4,
      name: r'estimatedPrice',
      type: IsarType.double,
    ),
    r'feedback': PropertySchema(
      id: 5,
      name: r'feedback',
      type: IsarType.string,
    ),
    r'isReturned': PropertySchema(
      id: 6,
      name: r'isReturned',
      type: IsarType.bool,
    ),
    r'itemName': PropertySchema(
      id: 7,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 8,
      name: r'notes',
      type: IsarType.string,
    ),
    r'orderNumber': PropertySchema(
      id: 9,
      name: r'orderNumber',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 10,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'purchaseDate': PropertySchema(
      id: 11,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'returnDate': PropertySchema(
      id: 12,
      name: r'returnDate',
      type: IsarType.dateTime,
    ),
    r'returnReason': PropertySchema(
      id: 13,
      name: r'returnReason',
      type: IsarType.string,
    ),
    r'satisfactionRating': PropertySchema(
      id: 14,
      name: r'satisfactionRating',
      type: IsarType.long,
    ),
    r'size': PropertySchema(
      id: 15,
      name: r'size',
      type: IsarType.string,
    ),
    r'store': PropertySchema(
      id: 16,
      name: r'store',
      type: IsarType.string,
    ),
    r'wardrobeItemId': PropertySchema(
      id: 17,
      name: r'wardrobeItemId',
      type: IsarType.string,
    )
  },
  estimateSize: _purchaseRecordEstimateSize,
  serialize: _purchaseRecordSerialize,
  deserialize: _purchaseRecordDeserialize,
  deserializeProp: _purchaseRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _purchaseRecordGetId,
  getLinks: _purchaseRecordGetLinks,
  attach: _purchaseRecordAttach,
  version: '3.1.0+1',
);

int _purchaseRecordEstimateSize(
  PurchaseRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.color;
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
  bytesCount += 3 + object.itemName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.orderNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.paymentMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.returnReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.size;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.store.length * 3;
  {
    final value = object.wardrobeItemId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _purchaseRecordSerialize(
  PurchaseRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actualPrice);
  writer.writeString(offsets[1], object.brand);
  writer.writeString(offsets[2], object.category);
  writer.writeString(offsets[3], object.color);
  writer.writeDouble(offsets[4], object.estimatedPrice);
  writer.writeString(offsets[5], object.feedback);
  writer.writeBool(offsets[6], object.isReturned);
  writer.writeString(offsets[7], object.itemName);
  writer.writeString(offsets[8], object.notes);
  writer.writeString(offsets[9], object.orderNumber);
  writer.writeString(offsets[10], object.paymentMethod);
  writer.writeDateTime(offsets[11], object.purchaseDate);
  writer.writeDateTime(offsets[12], object.returnDate);
  writer.writeString(offsets[13], object.returnReason);
  writer.writeLong(offsets[14], object.satisfactionRating);
  writer.writeString(offsets[15], object.size);
  writer.writeString(offsets[16], object.store);
  writer.writeString(offsets[17], object.wardrobeItemId);
}

PurchaseRecord _purchaseRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseRecord();
  object.actualPrice = reader.readDouble(offsets[0]);
  object.brand = reader.readStringOrNull(offsets[1]);
  object.category = reader.readString(offsets[2]);
  object.color = reader.readStringOrNull(offsets[3]);
  object.estimatedPrice = reader.readDoubleOrNull(offsets[4]);
  object.feedback = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.isReturned = reader.readBool(offsets[6]);
  object.itemName = reader.readString(offsets[7]);
  object.notes = reader.readStringOrNull(offsets[8]);
  object.orderNumber = reader.readStringOrNull(offsets[9]);
  object.paymentMethod = reader.readStringOrNull(offsets[10]);
  object.purchaseDate = reader.readDateTime(offsets[11]);
  object.returnDate = reader.readDateTimeOrNull(offsets[12]);
  object.returnReason = reader.readStringOrNull(offsets[13]);
  object.satisfactionRating = reader.readLongOrNull(offsets[14]);
  object.size = reader.readStringOrNull(offsets[15]);
  object.store = reader.readString(offsets[16]);
  object.wardrobeItemId = reader.readStringOrNull(offsets[17]);
  return object;
}

P _purchaseRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _purchaseRecordGetId(PurchaseRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _purchaseRecordGetLinks(PurchaseRecord object) {
  return [];
}

void _purchaseRecordAttach(
    IsarCollection<dynamic> col, Id id, PurchaseRecord object) {
  object.id = id;
}

extension PurchaseRecordQueryWhereSort
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QWhere> {
  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PurchaseRecordQueryWhere
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QWhereClause> {
  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterWhereClause> idBetween(
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

extension PurchaseRecordQueryFilter
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QFilterCondition> {
  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      actualPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      actualPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      actualPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      actualPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryLessThan(
    String value, {
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'color',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      estimatedPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedPrice',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      estimatedPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedPrice',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      estimatedPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      estimatedPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      estimatedPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      estimatedPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      feedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      feedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      feedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      feedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      feedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      feedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      isReturnedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderNumber',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderNumber',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'orderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'orderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      orderNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      purchaseDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      purchaseDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnDate',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnDate',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnReason',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnReason',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'returnReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'returnReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnReason',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      returnReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnReason',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      satisfactionRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'satisfactionRating',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      satisfactionRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'satisfactionRating',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      satisfactionRatingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'satisfactionRating',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
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

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'size',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      sizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'store',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'store',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'store',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'store',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'store',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'store',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'store',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'store',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'store',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      storeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'store',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wardrobeItemId',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wardrobeItemId',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wardrobeItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wardrobeItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wardrobeItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wardrobeItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wardrobeItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wardrobeItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wardrobeItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wardrobeItemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wardrobeItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterFilterCondition>
      wardrobeItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wardrobeItemId',
        value: '',
      ));
    });
  }
}

extension PurchaseRecordQueryObject
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QFilterCondition> {}

extension PurchaseRecordQueryLinks
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QFilterCondition> {}

extension PurchaseRecordQuerySortBy
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QSortBy> {
  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByActualPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualPrice', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByActualPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualPrice', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByIsReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByOrderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByReturnReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnReason', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByReturnReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnReason', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortBySatisfactionRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortBySatisfactionRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> sortByStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByWardrobeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardrobeItemId', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      sortByWardrobeItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardrobeItemId', Sort.desc);
    });
  }
}

extension PurchaseRecordQuerySortThenBy
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QSortThenBy> {
  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByActualPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualPrice', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByActualPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualPrice', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByEstimatedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPrice', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByIsReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByOrderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByOrderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderNumber', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByReturnReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnReason', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByReturnReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnReason', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenBySatisfactionRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenBySatisfactionRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'satisfactionRating', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy> thenByStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'store', Sort.desc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByWardrobeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardrobeItemId', Sort.asc);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QAfterSortBy>
      thenByWardrobeItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardrobeItemId', Sort.desc);
    });
  }
}

extension PurchaseRecordQueryWhereDistinct
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> {
  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByActualPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualPrice');
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByEstimatedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedPrice');
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByFeedback(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReturned');
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByOrderNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByPaymentMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnDate');
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByReturnReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnReason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctBySatisfactionRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'satisfactionRating');
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctBySize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct> distinctByStore(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'store', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseRecord, PurchaseRecord, QDistinct>
      distinctByWardrobeItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wardrobeItemId',
          caseSensitive: caseSensitive);
    });
  }
}

extension PurchaseRecordQueryProperty
    on QueryBuilder<PurchaseRecord, PurchaseRecord, QQueryProperty> {
  QueryBuilder<PurchaseRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PurchaseRecord, double, QQueryOperations> actualPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualPrice');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<PurchaseRecord, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<PurchaseRecord, double?, QQueryOperations>
      estimatedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedPrice');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations> feedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedback');
    });
  }

  QueryBuilder<PurchaseRecord, bool, QQueryOperations> isReturnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReturned');
    });
  }

  QueryBuilder<PurchaseRecord, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations>
      orderNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderNumber');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<PurchaseRecord, DateTime, QQueryOperations>
      purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<PurchaseRecord, DateTime?, QQueryOperations>
      returnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnDate');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations>
      returnReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnReason');
    });
  }

  QueryBuilder<PurchaseRecord, int?, QQueryOperations>
      satisfactionRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'satisfactionRating');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<PurchaseRecord, String, QQueryOperations> storeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'store');
    });
  }

  QueryBuilder<PurchaseRecord, String?, QQueryOperations>
      wardrobeItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wardrobeItemId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWishlistItemCollection on Isar {
  IsarCollection<WishlistItem> get wishlistItems => this.collection();
}

const WishlistItemSchema = CollectionSchema(
  name: r'WishlistItem',
  id: -5849335386916499629,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
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
    r'currentPrice': PropertySchema(
      id: 3,
      name: r'currentPrice',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 5,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isAvailable': PropertySchema(
      id: 6,
      name: r'isAvailable',
      type: IsarType.bool,
    ),
    r'isPriceAlertSet': PropertySchema(
      id: 7,
      name: r'isPriceAlertSet',
      type: IsarType.bool,
    ),
    r'itemName': PropertySchema(
      id: 8,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
    r'occasions': PropertySchema(
      id: 10,
      name: r'occasions',
      type: IsarType.stringList,
    ),
    r'preferredColors': PropertySchema(
      id: 11,
      name: r'preferredColors',
      type: IsarType.stringList,
    ),
    r'preferredSizes': PropertySchema(
      id: 12,
      name: r'preferredSizes',
      type: IsarType.stringList,
    ),
    r'priceRange': PropertySchema(
      id: 13,
      name: r'priceRange',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 14,
      name: r'priority',
      type: IsarType.long,
    ),
    r'productUrl': PropertySchema(
      id: 15,
      name: r'productUrl',
      type: IsarType.string,
    ),
    r'relatedOutfitIds': PropertySchema(
      id: 16,
      name: r'relatedOutfitIds',
      type: IsarType.stringList,
    ),
    r'storeName': PropertySchema(
      id: 17,
      name: r'storeName',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 18,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'targetPrice': PropertySchema(
      id: 19,
      name: r'targetPrice',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 20,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _wishlistItemEstimateSize,
  serialize: _wishlistItemSerialize,
  deserialize: _wishlistItemDeserialize,
  deserializeProp: _wishlistItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _wishlistItemGetId,
  getLinks: _wishlistItemGetLinks,
  attach: _wishlistItemAttach,
  version: '3.1.0+1',
);

int _wishlistItemEstimateSize(
  WishlistItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.occasions.length * 3;
  {
    for (var i = 0; i < object.occasions.length; i++) {
      final value = object.occasions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredColors.length * 3;
  {
    for (var i = 0; i < object.preferredColors.length; i++) {
      final value = object.preferredColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredSizes.length * 3;
  {
    for (var i = 0; i < object.preferredSizes.length; i++) {
      final value = object.preferredSizes[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.priceRange;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.relatedOutfitIds.length * 3;
  {
    for (var i = 0; i < object.relatedOutfitIds.length; i++) {
      final value = object.relatedOutfitIds[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.storeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _wishlistItemSerialize(
  WishlistItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.currentPrice);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.imageUrl);
  writer.writeBool(offsets[6], object.isAvailable);
  writer.writeBool(offsets[7], object.isPriceAlertSet);
  writer.writeString(offsets[8], object.itemName);
  writer.writeString(offsets[9], object.notes);
  writer.writeStringList(offsets[10], object.occasions);
  writer.writeStringList(offsets[11], object.preferredColors);
  writer.writeStringList(offsets[12], object.preferredSizes);
  writer.writeString(offsets[13], object.priceRange);
  writer.writeLong(offsets[14], object.priority);
  writer.writeString(offsets[15], object.productUrl);
  writer.writeStringList(offsets[16], object.relatedOutfitIds);
  writer.writeString(offsets[17], object.storeName);
  writer.writeStringList(offsets[18], object.tags);
  writer.writeDouble(offsets[19], object.targetPrice);
  writer.writeDateTime(offsets[20], object.updatedAt);
}

WishlistItem _wishlistItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WishlistItem();
  object.brand = reader.readStringOrNull(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.currentPrice = reader.readDoubleOrNull(offsets[3]);
  object.description = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[5]);
  object.isAvailable = reader.readBool(offsets[6]);
  object.isPriceAlertSet = reader.readBool(offsets[7]);
  object.itemName = reader.readString(offsets[8]);
  object.notes = reader.readStringOrNull(offsets[9]);
  object.occasions = reader.readStringList(offsets[10]) ?? [];
  object.preferredColors = reader.readStringList(offsets[11]) ?? [];
  object.preferredSizes = reader.readStringList(offsets[12]) ?? [];
  object.priceRange = reader.readStringOrNull(offsets[13]);
  object.priority = reader.readLong(offsets[14]);
  object.productUrl = reader.readStringOrNull(offsets[15]);
  object.relatedOutfitIds = reader.readStringList(offsets[16]) ?? [];
  object.storeName = reader.readStringOrNull(offsets[17]);
  object.tags = reader.readStringList(offsets[18]) ?? [];
  object.targetPrice = reader.readDoubleOrNull(offsets[19]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[20]);
  return object;
}

P _wishlistItemDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readStringList(offset) ?? []) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringList(offset) ?? []) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringList(offset) ?? []) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wishlistItemGetId(WishlistItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wishlistItemGetLinks(WishlistItem object) {
  return [];
}

void _wishlistItemAttach(
    IsarCollection<dynamic> col, Id id, WishlistItem object) {
  object.id = id;
}

extension WishlistItemQueryWhereSort
    on QueryBuilder<WishlistItem, WishlistItem, QWhere> {
  QueryBuilder<WishlistItem, WishlistItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WishlistItemQueryWhere
    on QueryBuilder<WishlistItem, WishlistItem, QWhereClause> {
  QueryBuilder<WishlistItem, WishlistItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterWhereClause> idBetween(
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

extension WishlistItemQueryFilter
    on QueryBuilder<WishlistItem, WishlistItem, QFilterCondition> {
  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryLessThan(
    String value, {
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      currentPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentPrice',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      currentPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentPrice',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      currentPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      currentPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      currentPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      currentPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      isAvailableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      isPriceAlertSetEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPriceAlertSet',
        value: value,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> notesContains(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      occasionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'occasions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      occasionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'occasions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      occasionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasions',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      occasionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'occasions',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredColors',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredColors',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredSizes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredSizes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredSizes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredSizes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredSizes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredSizes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredSizes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredSizes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredSizes',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredSizes',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredSizes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredSizes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredSizes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredSizes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredSizes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      preferredSizesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredSizes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priceRange',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priceRange',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceRange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceRange',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priceRangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceRange',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productUrl',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productUrl',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      productUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relatedOutfitIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'relatedOutfitIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'relatedOutfitIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relatedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'relatedOutfitIds',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      relatedOutfitIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relatedOutfitIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      storeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      targetPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetPrice',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      targetPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetPrice',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      targetPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      targetPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      targetPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      targetPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<WishlistItem, WishlistItem, QAfterFilterCondition>
      updatedAtBetween(
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
}

extension WishlistItemQueryObject
    on QueryBuilder<WishlistItem, WishlistItem, QFilterCondition> {}

extension WishlistItemQueryLinks
    on QueryBuilder<WishlistItem, WishlistItem, QFilterCondition> {}

extension WishlistItemQuerySortBy
    on QueryBuilder<WishlistItem, WishlistItem, QSortBy> {
  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByCurrentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByIsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByIsAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByIsPriceAlertSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPriceAlertSet', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByIsPriceAlertSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPriceAlertSet', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByPriceRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByPriceRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByProductUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByProductUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByTargetPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      sortByTargetPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension WishlistItemQuerySortThenBy
    on QueryBuilder<WishlistItem, WishlistItem, QSortThenBy> {
  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByCurrentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByIsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByIsAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByIsPriceAlertSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPriceAlertSet', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByIsPriceAlertSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPriceAlertSet', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByPriceRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByPriceRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceRange', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByProductUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByProductUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productUrl', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByTargetPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy>
      thenByTargetPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPrice', Sort.desc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension WishlistItemQueryWhereDistinct
    on QueryBuilder<WishlistItem, WishlistItem, QDistinct> {
  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPrice');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByIsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAvailable');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct>
      distinctByIsPriceAlertSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPriceAlertSet');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByOccasions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occasions');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct>
      distinctByPreferredColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredColors');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct>
      distinctByPreferredSizes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredSizes');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByPriceRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceRange', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByProductUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct>
      distinctByRelatedOutfitIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relatedOutfitIds');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByStoreName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByTargetPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPrice');
    });
  }

  QueryBuilder<WishlistItem, WishlistItem, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension WishlistItemQueryProperty
    on QueryBuilder<WishlistItem, WishlistItem, QQueryProperty> {
  QueryBuilder<WishlistItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<WishlistItem, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<WishlistItem, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<WishlistItem, double?, QQueryOperations> currentPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPrice');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<WishlistItem, bool, QQueryOperations> isAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAvailable');
    });
  }

  QueryBuilder<WishlistItem, bool, QQueryOperations> isPriceAlertSetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPriceAlertSet');
    });
  }

  QueryBuilder<WishlistItem, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<WishlistItem, List<String>, QQueryOperations>
      occasionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occasions');
    });
  }

  QueryBuilder<WishlistItem, List<String>, QQueryOperations>
      preferredColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredColors');
    });
  }

  QueryBuilder<WishlistItem, List<String>, QQueryOperations>
      preferredSizesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredSizes');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> priceRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceRange');
    });
  }

  QueryBuilder<WishlistItem, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> productUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productUrl');
    });
  }

  QueryBuilder<WishlistItem, List<String>, QQueryOperations>
      relatedOutfitIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relatedOutfitIds');
    });
  }

  QueryBuilder<WishlistItem, String?, QQueryOperations> storeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeName');
    });
  }

  QueryBuilder<WishlistItem, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<WishlistItem, double?, QQueryOperations> targetPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPrice');
    });
  }

  QueryBuilder<WishlistItem, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoppableOutfitInspirationCollection on Isar {
  IsarCollection<ShoppableOutfitInspiration> get shoppableOutfitInspirations =>
      this.collection();
}

const ShoppableOutfitInspirationSchema = CollectionSchema(
  name: r'ShoppableOutfitInspiration',
  id: 1765784655898556858,
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
    r'imageUrl': PropertySchema(
      id: 2,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'influencer': PropertySchema(
      id: 3,
      name: r'influencer',
      type: IsarType.string,
    ),
    r'isBookmarked': PropertySchema(
      id: 4,
      name: r'isBookmarked',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 5,
      name: r'items',
      type: IsarType.objectList,
      target: r'ShoppableItem',
    ),
    r'likes': PropertySchema(
      id: 6,
      name: r'likes',
      type: IsarType.long,
    ),
    r'occasion': PropertySchema(
      id: 7,
      name: r'occasion',
      type: IsarType.string,
    ),
    r'saves': PropertySchema(
      id: 8,
      name: r'saves',
      type: IsarType.long,
    ),
    r'season': PropertySchema(
      id: 9,
      name: r'season',
      type: IsarType.string,
      enumMap: _ShoppableOutfitInspirationseasonEnumValueMap,
    ),
    r'sourceName': PropertySchema(
      id: 10,
      name: r'sourceName',
      type: IsarType.string,
    ),
    r'sourceUrl': PropertySchema(
      id: 11,
      name: r'sourceUrl',
      type: IsarType.string,
    ),
    r'style': PropertySchema(
      id: 12,
      name: r'style',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 13,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 14,
      name: r'title',
      type: IsarType.string,
    ),
    r'totalPrice': PropertySchema(
      id: 15,
      name: r'totalPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _shoppableOutfitInspirationEstimateSize,
  serialize: _shoppableOutfitInspirationSerialize,
  deserialize: _shoppableOutfitInspirationDeserialize,
  deserializeProp: _shoppableOutfitInspirationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ShoppableItem': ShoppableItemSchema},
  getId: _shoppableOutfitInspirationGetId,
  getLinks: _shoppableOutfitInspirationGetLinks,
  attach: _shoppableOutfitInspirationAttach,
  version: '3.1.0+1',
);

int _shoppableOutfitInspirationEstimateSize(
  ShoppableOutfitInspiration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.influencer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[ShoppableItem]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount +=
          ShoppableItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.occasion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.season;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.sourceName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.style;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _shoppableOutfitInspirationSerialize(
  ShoppableOutfitInspiration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.imageUrl);
  writer.writeString(offsets[3], object.influencer);
  writer.writeBool(offsets[4], object.isBookmarked);
  writer.writeObjectList<ShoppableItem>(
    offsets[5],
    allOffsets,
    ShoppableItemSchema.serialize,
    object.items,
  );
  writer.writeLong(offsets[6], object.likes);
  writer.writeString(offsets[7], object.occasion);
  writer.writeLong(offsets[8], object.saves);
  writer.writeString(offsets[9], object.season?.name);
  writer.writeString(offsets[10], object.sourceName);
  writer.writeString(offsets[11], object.sourceUrl);
  writer.writeString(offsets[12], object.style);
  writer.writeStringList(offsets[13], object.tags);
  writer.writeString(offsets[14], object.title);
  writer.writeDouble(offsets[15], object.totalPrice);
}

ShoppableOutfitInspiration _shoppableOutfitInspirationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppableOutfitInspiration(
    description: reader.readString(offsets[1]),
    imageUrl: reader.readStringOrNull(offsets[2]),
    influencer: reader.readStringOrNull(offsets[3]),
    items: reader.readObjectList<ShoppableItem>(
          offsets[5],
          ShoppableItemSchema.deserialize,
          allOffsets,
          ShoppableItem(),
        ) ??
        [],
    occasion: reader.readStringOrNull(offsets[7]),
    season: _ShoppableOutfitInspirationseasonValueEnumMap[
        reader.readStringOrNull(offsets[9])],
    sourceName: reader.readStringOrNull(offsets[10]),
    sourceUrl: reader.readStringOrNull(offsets[11]),
    style: reader.readStringOrNull(offsets[12]),
    tags: reader.readStringList(offsets[13]) ?? const [],
    title: reader.readString(offsets[14]),
    totalPrice: reader.readDouble(offsets[15]),
  );
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isBookmarked = reader.readBool(offsets[4]);
  object.likes = reader.readLong(offsets[6]);
  object.saves = reader.readLong(offsets[8]);
  return object;
}

P _shoppableOutfitInspirationDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readObjectList<ShoppableItem>(
            offset,
            ShoppableItemSchema.deserialize,
            allOffsets,
            ShoppableItem(),
          ) ??
          []) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (_ShoppableOutfitInspirationseasonValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringList(offset) ?? const []) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShoppableOutfitInspirationseasonEnumValueMap = {
  r'spring': r'spring',
  r'summer': r'summer',
  r'autumn': r'autumn',
  r'winter': r'winter',
  r'allSeason': r'allSeason',
};
const _ShoppableOutfitInspirationseasonValueEnumMap = {
  r'spring': Season.spring,
  r'summer': Season.summer,
  r'autumn': Season.autumn,
  r'winter': Season.winter,
  r'allSeason': Season.allSeason,
};

Id _shoppableOutfitInspirationGetId(ShoppableOutfitInspiration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shoppableOutfitInspirationGetLinks(
    ShoppableOutfitInspiration object) {
  return [];
}

void _shoppableOutfitInspirationAttach(
    IsarCollection<dynamic> col, Id id, ShoppableOutfitInspiration object) {
  object.id = id;
}

extension ShoppableOutfitInspirationQueryWhereSort on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QWhere> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoppableOutfitInspirationQueryWhere on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QWhereClause> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

extension ShoppableOutfitInspirationQueryFilter on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QFilterCondition> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'influencer',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'influencer',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'influencer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'influencer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'influencer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'influencer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'influencer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'influencer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      influencerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'influencer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      influencerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'influencer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'influencer',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> influencerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'influencer',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> isBookmarkedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBookmarked',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> likesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'likes',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> likesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'likes',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> likesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'likes',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> likesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'likes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'occasion',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'occasion',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionEqualTo(
    String? value, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionGreaterThan(
    String? value, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionLessThan(
    String? value, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionStartsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionEndsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      occasionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'occasion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      occasionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'occasion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> occasionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'occasion',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> savesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saves',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> savesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saves',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> savesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saves',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> savesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saves',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonEqualTo(
    Season? value, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonGreaterThan(
    Season? value, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonLessThan(
    Season? value, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonBetween(
    Season? lower,
    Season? upper, {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonStartsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonEndsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      seasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      seasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'season',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> seasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceName',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceName',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      sourceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      sourceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceUrl',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceUrl',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      sourceUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      sourceUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> sourceUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'style',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'style',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'style',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      styleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'style',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      styleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'style',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'style',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> styleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'style',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementEqualTo(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementGreaterThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementLessThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementBetween(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementStartsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementEndsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsLengthEqualTo(int length) {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsIsEmpty() {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsIsNotEmpty() {
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsLengthLessThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsLengthGreaterThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> tagsLengthBetween(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleBetween(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> totalPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> totalPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> totalPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> totalPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ShoppableOutfitInspirationQueryObject on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QFilterCondition> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterFilterCondition> itemsElement(FilterQuery<ShoppableItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension ShoppableOutfitInspirationQueryLinks on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QFilterCondition> {}

extension ShoppableOutfitInspirationQuerySortBy on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QSortBy> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByInfluencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'influencer', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByInfluencerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'influencer', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByIsBookmarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByLikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySaves() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saves', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySavesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saves', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension ShoppableOutfitInspirationQuerySortThenBy on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QSortThenBy> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByInfluencer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'influencer', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByInfluencerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'influencer', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByIsBookmarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByLikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByOccasion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByOccasionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occasion', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySaves() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saves', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySavesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saves', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'style', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QAfterSortBy> thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension ShoppableOutfitInspirationQueryWhereDistinct on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QDistinct> {
  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByInfluencer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'influencer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBookmarked');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likes');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByOccasion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occasion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctBySaves() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saves');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctBySeason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctBySourceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctBySourceUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByStyle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'style', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, ShoppableOutfitInspiration,
      QDistinct> distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }
}

extension ShoppableOutfitInspirationQueryProperty on QueryBuilder<
    ShoppableOutfitInspiration, ShoppableOutfitInspiration, QQueryProperty> {
  QueryBuilder<ShoppableOutfitInspiration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String?, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String?, QQueryOperations>
      influencerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'influencer');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, bool, QQueryOperations>
      isBookmarkedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBookmarked');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, List<ShoppableItem>,
      QQueryOperations> itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, int, QQueryOperations>
      likesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likes');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String?, QQueryOperations>
      occasionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occasion');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, int, QQueryOperations>
      savesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saves');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, Season?, QQueryOperations>
      seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String?, QQueryOperations>
      sourceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceName');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String?, QQueryOperations>
      sourceUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceUrl');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String?, QQueryOperations>
      styleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'style');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, List<String>, QQueryOperations>
      tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, String, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ShoppableOutfitInspiration, double, QQueryOperations>
      totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoppingPreferencesCollection on Isar {
  IsarCollection<ShoppingPreferences> get shoppingPreferences =>
      this.collection();
}

const ShoppingPreferencesSchema = CollectionSchema(
  name: r'ShoppingPreferences',
  id: -6922478323884859188,
  properties: {
    r'avoidedBrands': PropertySchema(
      id: 0,
      name: r'avoidedBrands',
      type: IsarType.stringList,
    ),
    r'avoidedColors': PropertySchema(
      id: 1,
      name: r'avoidedColors',
      type: IsarType.stringList,
    ),
    r'blacklistedStores': PropertySchema(
      id: 2,
      name: r'blacklistedStores',
      type: IsarType.stringList,
    ),
    r'enablePriceAlerts': PropertySchema(
      id: 3,
      name: r'enablePriceAlerts',
      type: IsarType.bool,
    ),
    r'enableWishlistNotifications': PropertySchema(
      id: 4,
      name: r'enableWishlistNotifications',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 5,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'maxItemPrice': PropertySchema(
      id: 6,
      name: r'maxItemPrice',
      type: IsarType.double,
    ),
    r'monthlyBudget': PropertySchema(
      id: 7,
      name: r'monthlyBudget',
      type: IsarType.double,
    ),
    r'notifyOnNewArrivals': PropertySchema(
      id: 8,
      name: r'notifyOnNewArrivals',
      type: IsarType.bool,
    ),
    r'notifyOnPriceDrops': PropertySchema(
      id: 9,
      name: r'notifyOnPriceDrops',
      type: IsarType.bool,
    ),
    r'notifyOnSales': PropertySchema(
      id: 10,
      name: r'notifyOnSales',
      type: IsarType.bool,
    ),
    r'onlyShopSales': PropertySchema(
      id: 11,
      name: r'onlyShopSales',
      type: IsarType.bool,
    ),
    r'preferSustainableBrands': PropertySchema(
      id: 12,
      name: r'preferSustainableBrands',
      type: IsarType.bool,
    ),
    r'preferredBrands': PropertySchema(
      id: 13,
      name: r'preferredBrands',
      type: IsarType.stringList,
    ),
    r'preferredColors': PropertySchema(
      id: 14,
      name: r'preferredColors',
      type: IsarType.stringList,
    ),
    r'preferredStores': PropertySchema(
      id: 15,
      name: r'preferredStores',
      type: IsarType.stringList,
    ),
    r'preferredStyles': PropertySchema(
      id: 16,
      name: r'preferredStyles',
      type: IsarType.stringList,
    ),
    r'shoppingFrequency': PropertySchema(
      id: 17,
      name: r'shoppingFrequency',
      type: IsarType.string,
    )
  },
  estimateSize: _shoppingPreferencesEstimateSize,
  serialize: _shoppingPreferencesSerialize,
  deserialize: _shoppingPreferencesDeserialize,
  deserializeProp: _shoppingPreferencesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _shoppingPreferencesGetId,
  getLinks: _shoppingPreferencesGetLinks,
  attach: _shoppingPreferencesAttach,
  version: '3.1.0+1',
);

int _shoppingPreferencesEstimateSize(
  ShoppingPreferences object,
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
  bytesCount += 3 + object.avoidedColors.length * 3;
  {
    for (var i = 0; i < object.avoidedColors.length; i++) {
      final value = object.avoidedColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.blacklistedStores.length * 3;
  {
    for (var i = 0; i < object.blacklistedStores.length; i++) {
      final value = object.blacklistedStores[i];
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
  bytesCount += 3 + object.preferredColors.length * 3;
  {
    for (var i = 0; i < object.preferredColors.length; i++) {
      final value = object.preferredColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredStores.length * 3;
  {
    for (var i = 0; i < object.preferredStores.length; i++) {
      final value = object.preferredStores[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.preferredStyles.length * 3;
  {
    for (var i = 0; i < object.preferredStyles.length; i++) {
      final value = object.preferredStyles[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.shoppingFrequency.length * 3;
  return bytesCount;
}

void _shoppingPreferencesSerialize(
  ShoppingPreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.avoidedBrands);
  writer.writeStringList(offsets[1], object.avoidedColors);
  writer.writeStringList(offsets[2], object.blacklistedStores);
  writer.writeBool(offsets[3], object.enablePriceAlerts);
  writer.writeBool(offsets[4], object.enableWishlistNotifications);
  writer.writeDateTime(offsets[5], object.lastUpdated);
  writer.writeDouble(offsets[6], object.maxItemPrice);
  writer.writeDouble(offsets[7], object.monthlyBudget);
  writer.writeBool(offsets[8], object.notifyOnNewArrivals);
  writer.writeBool(offsets[9], object.notifyOnPriceDrops);
  writer.writeBool(offsets[10], object.notifyOnSales);
  writer.writeBool(offsets[11], object.onlyShopSales);
  writer.writeBool(offsets[12], object.preferSustainableBrands);
  writer.writeStringList(offsets[13], object.preferredBrands);
  writer.writeStringList(offsets[14], object.preferredColors);
  writer.writeStringList(offsets[15], object.preferredStores);
  writer.writeStringList(offsets[16], object.preferredStyles);
  writer.writeString(offsets[17], object.shoppingFrequency);
}

ShoppingPreferences _shoppingPreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppingPreferences();
  object.avoidedBrands = reader.readStringList(offsets[0]) ?? [];
  object.avoidedColors = reader.readStringList(offsets[1]) ?? [];
  object.blacklistedStores = reader.readStringList(offsets[2]) ?? [];
  object.enablePriceAlerts = reader.readBool(offsets[3]);
  object.enableWishlistNotifications = reader.readBool(offsets[4]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[5]);
  object.maxItemPrice = reader.readDouble(offsets[6]);
  object.monthlyBudget = reader.readDouble(offsets[7]);
  object.notifyOnNewArrivals = reader.readBool(offsets[8]);
  object.notifyOnPriceDrops = reader.readBool(offsets[9]);
  object.notifyOnSales = reader.readBool(offsets[10]);
  object.onlyShopSales = reader.readBool(offsets[11]);
  object.preferSustainableBrands = reader.readBool(offsets[12]);
  object.preferredBrands = reader.readStringList(offsets[13]) ?? [];
  object.preferredColors = reader.readStringList(offsets[14]) ?? [];
  object.preferredStores = reader.readStringList(offsets[15]) ?? [];
  object.preferredStyles = reader.readStringList(offsets[16]) ?? [];
  object.shoppingFrequency = reader.readString(offsets[17]);
  return object;
}

P _shoppingPreferencesDeserializeProp<P>(
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
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readStringList(offset) ?? []) as P;
    case 14:
      return (reader.readStringList(offset) ?? []) as P;
    case 15:
      return (reader.readStringList(offset) ?? []) as P;
    case 16:
      return (reader.readStringList(offset) ?? []) as P;
    case 17:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shoppingPreferencesGetId(ShoppingPreferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shoppingPreferencesGetLinks(
    ShoppingPreferences object) {
  return [];
}

void _shoppingPreferencesAttach(
    IsarCollection<dynamic> col, Id id, ShoppingPreferences object) {
  object.id = id;
}

extension ShoppingPreferencesQueryWhereSort
    on QueryBuilder<ShoppingPreferences, ShoppingPreferences, QWhere> {
  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoppingPreferencesQueryWhere
    on QueryBuilder<ShoppingPreferences, ShoppingPreferences, QWhereClause> {
  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterWhereClause>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterWhereClause>
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

extension ShoppingPreferencesQueryFilter on QueryBuilder<ShoppingPreferences,
    ShoppingPreferences, QFilterCondition> {
  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedBrandsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avoidedBrands',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedBrandsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avoidedBrands',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedBrandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avoidedBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedBrandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avoidedBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avoidedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avoidedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avoidedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avoidedColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avoidedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avoidedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avoidedColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avoidedColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avoidedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avoidedColors',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      avoidedColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'avoidedColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blacklistedStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blacklistedStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blacklistedStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blacklistedStores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blacklistedStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blacklistedStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blacklistedStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blacklistedStores',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blacklistedStores',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blacklistedStores',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blacklistedStores',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blacklistedStores',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blacklistedStores',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blacklistedStores',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blacklistedStores',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      blacklistedStoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blacklistedStores',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      enablePriceAlertsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enablePriceAlerts',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      enableWishlistNotificationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableWishlistNotifications',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      maxItemPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxItemPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      maxItemPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxItemPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      maxItemPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxItemPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      maxItemPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxItemPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      monthlyBudgetEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyBudget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      monthlyBudgetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyBudget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      monthlyBudgetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyBudget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      monthlyBudgetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyBudget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      notifyOnNewArrivalsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnNewArrivals',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      notifyOnPriceDropsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnPriceDrops',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      notifyOnSalesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnSales',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      onlyShopSalesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onlyShopSales',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferSustainableBrandsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferSustainableBrands',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredBrandsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredBrandsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredBrands',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
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

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredColors',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredColors',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredStores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredStores',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredStores',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredStores',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStores',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStores',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStores',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStores',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStores',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStores',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredStyles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredStyles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredStyles',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredStyles',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStyles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStyles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStyles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStyles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStyles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      preferredStylesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'preferredStyles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shoppingFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shoppingFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shoppingFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shoppingFrequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shoppingFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shoppingFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shoppingFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shoppingFrequency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shoppingFrequency',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterFilterCondition>
      shoppingFrequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shoppingFrequency',
        value: '',
      ));
    });
  }
}

extension ShoppingPreferencesQueryObject on QueryBuilder<ShoppingPreferences,
    ShoppingPreferences, QFilterCondition> {}

extension ShoppingPreferencesQueryLinks on QueryBuilder<ShoppingPreferences,
    ShoppingPreferences, QFilterCondition> {}

extension ShoppingPreferencesQuerySortBy
    on QueryBuilder<ShoppingPreferences, ShoppingPreferences, QSortBy> {
  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByEnablePriceAlerts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePriceAlerts', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByEnablePriceAlertsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePriceAlerts', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByEnableWishlistNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWishlistNotifications', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByEnableWishlistNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWishlistNotifications', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByMaxItemPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItemPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByMaxItemPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItemPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByMonthlyBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByMonthlyBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByNotifyOnNewArrivals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnNewArrivals', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByNotifyOnNewArrivalsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnNewArrivals', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByNotifyOnPriceDrops() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrops', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByNotifyOnPriceDropsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrops', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByNotifyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnSales', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByNotifyOnSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnSales', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByOnlyShopSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlyShopSales', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByOnlyShopSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlyShopSales', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByPreferSustainableBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferSustainableBrands', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByPreferSustainableBrandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferSustainableBrands', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByShoppingFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shoppingFrequency', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      sortByShoppingFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shoppingFrequency', Sort.desc);
    });
  }
}

extension ShoppingPreferencesQuerySortThenBy
    on QueryBuilder<ShoppingPreferences, ShoppingPreferences, QSortThenBy> {
  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByEnablePriceAlerts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePriceAlerts', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByEnablePriceAlertsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePriceAlerts', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByEnableWishlistNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWishlistNotifications', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByEnableWishlistNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWishlistNotifications', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByMaxItemPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItemPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByMaxItemPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxItemPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByMonthlyBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByMonthlyBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByNotifyOnNewArrivals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnNewArrivals', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByNotifyOnNewArrivalsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnNewArrivals', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByNotifyOnPriceDrops() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrops', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByNotifyOnPriceDropsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnPriceDrops', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByNotifyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnSales', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByNotifyOnSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnSales', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByOnlyShopSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlyShopSales', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByOnlyShopSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onlyShopSales', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByPreferSustainableBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferSustainableBrands', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByPreferSustainableBrandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferSustainableBrands', Sort.desc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByShoppingFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shoppingFrequency', Sort.asc);
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QAfterSortBy>
      thenByShoppingFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shoppingFrequency', Sort.desc);
    });
  }
}

extension ShoppingPreferencesQueryWhereDistinct
    on QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct> {
  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByAvoidedBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avoidedBrands');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByAvoidedColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avoidedColors');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByBlacklistedStores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blacklistedStores');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByEnablePriceAlerts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enablePriceAlerts');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByEnableWishlistNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableWishlistNotifications');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByMaxItemPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxItemPrice');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByMonthlyBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyBudget');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByNotifyOnNewArrivals() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnNewArrivals');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByNotifyOnPriceDrops() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnPriceDrops');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByNotifyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnSales');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByOnlyShopSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onlyShopSales');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByPreferSustainableBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferSustainableBrands');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByPreferredBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredBrands');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByPreferredColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredColors');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByPreferredStores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredStores');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByPreferredStyles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredStyles');
    });
  }

  QueryBuilder<ShoppingPreferences, ShoppingPreferences, QDistinct>
      distinctByShoppingFrequency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shoppingFrequency',
          caseSensitive: caseSensitive);
    });
  }
}

extension ShoppingPreferencesQueryProperty
    on QueryBuilder<ShoppingPreferences, ShoppingPreferences, QQueryProperty> {
  QueryBuilder<ShoppingPreferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      avoidedBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avoidedBrands');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      avoidedColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avoidedColors');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      blacklistedStoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blacklistedStores');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      enablePriceAlertsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enablePriceAlerts');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      enableWishlistNotificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableWishlistNotifications');
    });
  }

  QueryBuilder<ShoppingPreferences, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<ShoppingPreferences, double, QQueryOperations>
      maxItemPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxItemPrice');
    });
  }

  QueryBuilder<ShoppingPreferences, double, QQueryOperations>
      monthlyBudgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyBudget');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      notifyOnNewArrivalsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnNewArrivals');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      notifyOnPriceDropsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnPriceDrops');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      notifyOnSalesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnSales');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      onlyShopSalesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onlyShopSales');
    });
  }

  QueryBuilder<ShoppingPreferences, bool, QQueryOperations>
      preferSustainableBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferSustainableBrands');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      preferredBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredBrands');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      preferredColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredColors');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      preferredStoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredStores');
    });
  }

  QueryBuilder<ShoppingPreferences, List<String>, QQueryOperations>
      preferredStylesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredStyles');
    });
  }

  QueryBuilder<ShoppingPreferences, String, QQueryOperations>
      shoppingFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shoppingFrequency');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ShoppingListItemSchema = Schema(
  name: r'ShoppingListItem',
  id: -3816175988203906805,
  properties: {
    r'actualPrice': PropertySchema(
      id: 0,
      name: r'actualPrice',
      type: IsarType.double,
    ),
    r'alternativePrices': PropertySchema(
      id: 1,
      name: r'alternativePrices',
      type: IsarType.doubleList,
    ),
    r'alternativeUrls': PropertySchema(
      id: 2,
      name: r'alternativeUrls',
      type: IsarType.stringList,
    ),
    r'category': PropertySchema(
      id: 3,
      name: r'category',
      type: IsarType.string,
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
    r'estimatedPrice': PropertySchema(
      id: 6,
      name: r'estimatedPrice',
      type: IsarType.double,
    ),
    r'isPurchased': PropertySchema(
      id: 7,
      name: r'isPurchased',
      type: IsarType.bool,
    ),
    r'itemName': PropertySchema(
      id: 8,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 10,
      name: r'priority',
      type: IsarType.long,
    ),
    r'purchasedAt': PropertySchema(
      id: 11,
      name: r'purchasedAt',
      type: IsarType.dateTime,
    ),
    r'purchasedStore': PropertySchema(
      id: 12,
      name: r'purchasedStore',
      type: IsarType.string,
    ),
    r'suggestionId': PropertySchema(
      id: 13,
      name: r'suggestionId',
      type: IsarType.string,
    )
  },
  estimateSize: _shoppingListItemEstimateSize,
  serialize: _shoppingListItemSerialize,
  deserialize: _shoppingListItemDeserialize,
  deserializeProp: _shoppingListItemDeserializeProp,
);

int _shoppingListItemEstimateSize(
  ShoppingListItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alternativePrices.length * 8;
  bytesCount += 3 + object.alternativeUrls.length * 3;
  {
    for (var i = 0; i < object.alternativeUrls.length; i++) {
      final value = object.alternativeUrls[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.purchasedStore;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.suggestionId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _shoppingListItemSerialize(
  ShoppingListItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actualPrice);
  writer.writeDoubleList(offsets[1], object.alternativePrices);
  writer.writeStringList(offsets[2], object.alternativeUrls);
  writer.writeString(offsets[3], object.category);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.description);
  writer.writeDouble(offsets[6], object.estimatedPrice);
  writer.writeBool(offsets[7], object.isPurchased);
  writer.writeString(offsets[8], object.itemName);
  writer.writeString(offsets[9], object.notes);
  writer.writeLong(offsets[10], object.priority);
  writer.writeDateTime(offsets[11], object.purchasedAt);
  writer.writeString(offsets[12], object.purchasedStore);
  writer.writeString(offsets[13], object.suggestionId);
}

ShoppingListItem _shoppingListItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppingListItem();
  object.actualPrice = reader.readDoubleOrNull(offsets[0]);
  object.alternativePrices = reader.readDoubleList(offsets[1]) ?? [];
  object.alternativeUrls = reader.readStringList(offsets[2]) ?? [];
  object.category = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.estimatedPrice = reader.readDouble(offsets[6]);
  object.isPurchased = reader.readBool(offsets[7]);
  object.itemName = reader.readString(offsets[8]);
  object.notes = reader.readStringOrNull(offsets[9]);
  object.priority = reader.readLong(offsets[10]);
  object.purchasedAt = reader.readDateTimeOrNull(offsets[11]);
  object.purchasedStore = reader.readStringOrNull(offsets[12]);
  object.suggestionId = reader.readStringOrNull(offsets[13]);
  return object;
}

P _shoppingListItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ShoppingListItemQueryFilter
    on QueryBuilder<ShoppingListItem, ShoppingListItem, QFilterCondition> {
  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      actualPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualPrice',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      actualPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualPrice',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      actualPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      actualPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      actualPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      actualPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativePrices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativePrices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativePrices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativePrices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativePricesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      alternativeUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryLessThan(
    String value, {
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      estimatedPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      estimatedPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      estimatedPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      estimatedPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      isPurchasedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPurchased',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchasedAt',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchasedAt',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchasedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchasedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchasedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchasedStore',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchasedStore',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchasedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchasedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchasedStore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'purchasedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'purchasedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'purchasedStore',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'purchasedStore',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasedStore',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      purchasedStoreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'purchasedStore',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'suggestionId',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'suggestionId',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestionId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListItem, ShoppingListItem, QAfterFilterCondition>
      suggestionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestionId',
        value: '',
      ));
    });
  }
}

extension ShoppingListItemQueryObject
    on QueryBuilder<ShoppingListItem, ShoppingListItem, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ShoppableItemSchema = Schema(
  name: r'ShoppableItem',
  id: 1830260711849397873,
  properties: {
    r'alternativePrices': PropertySchema(
      id: 0,
      name: r'alternativePrices',
      type: IsarType.doubleList,
    ),
    r'alternativeStores': PropertySchema(
      id: 1,
      name: r'alternativeStores',
      type: IsarType.stringList,
    ),
    r'alternativeUrls': PropertySchema(
      id: 2,
      name: r'alternativeUrls',
      type: IsarType.stringList,
    ),
    r'brand': PropertySchema(
      id: 3,
      name: r'brand',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 4,
      name: r'category',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 6,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 8,
      name: r'price',
      type: IsarType.double,
    ),
    r'url': PropertySchema(
      id: 9,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _shoppableItemEstimateSize,
  serialize: _shoppableItemSerialize,
  deserialize: _shoppableItemDeserialize,
  deserializeProp: _shoppableItemDeserializeProp,
);

int _shoppableItemEstimateSize(
  ShoppableItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alternativePrices.length * 8;
  bytesCount += 3 + object.alternativeStores.length * 3;
  {
    for (var i = 0; i < object.alternativeStores.length; i++) {
      final value = object.alternativeStores[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.alternativeUrls.length * 3;
  {
    for (var i = 0; i < object.alternativeUrls.length; i++) {
      final value = object.alternativeUrls[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _shoppableItemSerialize(
  ShoppableItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.alternativePrices);
  writer.writeStringList(offsets[1], object.alternativeStores);
  writer.writeStringList(offsets[2], object.alternativeUrls);
  writer.writeString(offsets[3], object.brand);
  writer.writeString(offsets[4], object.category);
  writer.writeString(offsets[5], object.description);
  writer.writeString(offsets[6], object.imageUrl);
  writer.writeString(offsets[7], object.name);
  writer.writeDouble(offsets[8], object.price);
  writer.writeString(offsets[9], object.url);
}

ShoppableItem _shoppableItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppableItem(
    brand: reader.readStringOrNull(offsets[3]),
    category: reader.readStringOrNull(offsets[4]) ?? '',
    description: reader.readStringOrNull(offsets[5]),
    imageUrl: reader.readStringOrNull(offsets[6]),
    name: reader.readStringOrNull(offsets[7]) ?? '',
    price: reader.readDoubleOrNull(offsets[8]) ?? 0.0,
    url: reader.readStringOrNull(offsets[9]) ?? '',
  );
  object.alternativePrices = reader.readDoubleList(offsets[0]) ?? [];
  object.alternativeStores = reader.readStringList(offsets[1]) ?? [];
  object.alternativeUrls = reader.readStringList(offsets[2]) ?? [];
  return object;
}

P _shoppableItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 9:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ShoppableItemQueryFilter
    on QueryBuilder<ShoppableItem, ShoppableItem, QFilterCondition> {
  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativePrices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativePrices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativePrices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativePrices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativePricesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativePrices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeStores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeStores',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeStores',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeStores',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeStores',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeStores',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeStores',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeStores',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeStores',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeStores',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeStoresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeStores',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativeUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativeUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativeUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativeUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativeUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      alternativeUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternativeUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryLessThan(
    String value, {
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
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

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppableItem, ShoppableItem, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension ShoppableItemQueryObject
    on QueryBuilder<ShoppableItem, ShoppableItem, QFilterCondition> {}
