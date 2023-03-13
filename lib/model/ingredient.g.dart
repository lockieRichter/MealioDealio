// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      category: $enumDecode(_$IngredientCategoryEnumMap, json['category']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'category': _$IngredientCategoryEnumMap[instance.category]!,
      'name': instance.name,
    };

const _$IngredientCategoryEnumMap = {
  IngredientCategory.meat: 'meat',
  IngredientCategory.fish: 'fish',
  IngredientCategory.vegetable: 'vegetable',
  IngredientCategory.fruit: 'fruit',
  IngredientCategory.dairy: 'dairy',
  IngredientCategory.bakery: 'bakery',
  IngredientCategory.grain: 'grain',
  IngredientCategory.spice: 'spice',
  IngredientCategory.other: 'other',
};
