import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';

class EnumUtils {
  static String getClothingTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return 'Top';
      case ClothingType.bottom:
        return 'Bottom';
      case ClothingType.shoes:
        return 'Shoes';
      case ClothingType.accessory:
        return 'Accessory';
      case ClothingType.outerwear:
        return 'Outerwear';
      case ClothingType.undergarment:
        return 'Undergarment';
      case ClothingType.jewelry:
        return 'Jewelry';
      case ClothingType.bag:
        return 'Bag';
      case ClothingType.hat:
        return 'Hat';
      case ClothingType.scarf:
        return 'Scarf';
      case ClothingType.belt:
        return 'Belt';
      case ClothingType.gloves:
        return 'Gloves';
      case ClothingType.swimwear:
        return 'Swimwear';
      case ClothingType.sleepwear:
        return 'Sleepwear';
      case ClothingType.activewear:
        return 'Activewear';
      case ClothingType.dress:
        return 'Dress';
      case ClothingType.jumpsuit:
        return 'Jumpsuit';
      case ClothingType.suit:
        return 'Suit';
    }
  }

  static IconData getClothingTypeIcon(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return Icons.style;
      case ClothingType.bottom:
        return Icons.man;
      case ClothingType.shoes:
        return Icons.directions_walk;
      case ClothingType.accessory:
        return Icons.star;
      case ClothingType.outerwear:
        return Icons.checkroom;
      case ClothingType.undergarment:
        return Icons.people;
      case ClothingType.jewelry:
        return Icons.diamond;
      case ClothingType.bag:
        return Icons.work;
      case ClothingType.hat:
        return Icons.sports_baseball;
      case ClothingType.scarf:
        return Icons.dry_cleaning;
      case ClothingType.belt:
        return Icons.line_style;
      case ClothingType.gloves:
        return Icons.back_hand;
      case ClothingType.swimwear:
        return Icons.pool;
      case ClothingType.sleepwear:
        return Icons.bedtime;
      case ClothingType.activewear:
        return Icons.fitness_center;
      case ClothingType.dress:
        return Icons.woman;
      case ClothingType.jumpsuit:
        return Icons.woman_2;
      case ClothingType.suit:
        return Icons.business;
    }
  }

  static String getSeasonLabel(Season season) {
    switch (season) {
      case Season.spring:
        return 'Spring';
      case Season.summer:
        return 'Summer';
      case Season.autumn:
        return 'Autumn';
      case Season.winter:
        return 'Winter';
      case Season.allSeason:
        return 'All Season';
    }
  }

  static IconData getSeasonIcon(Season season) {
    switch (season) {
      case Season.spring:
        return Icons.local_florist;
      case Season.summer:
        return Icons.wb_sunny;
      case Season.autumn:
        return Icons.eco;
      case Season.winter:
        return Icons.ac_unit;
      case Season.allSeason:
        return Icons.public;
    }
  }

  static String getWeatherRangeLabel(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot:
        return 'Very Hot (28°C+)';
      case WeatherRange.hot:
        return 'Hot (22°C+)';
      case WeatherRange.warm:
        return 'Warm (14°C+)';
      case WeatherRange.cool:
        return 'Cool (4°C+)';
      case WeatherRange.cold:
        return 'Cold (-4°C+)';
      case WeatherRange.veryCold:
        return 'Very Cold (-15°C+)';
    }
  }

  static IconData getWeatherRangeIcon(WeatherRange range) {
    switch (range) {
      case WeatherRange.veryHot:
        return Icons.wb_sunny;
      case WeatherRange.hot:
        return Icons.light_mode;
      case WeatherRange.warm:
        return Icons.wb_cloudy;
      case WeatherRange.cool:
        return Icons.cloud;
      case WeatherRange.cold:
        return Icons.ac_unit;
      case WeatherRange.veryCold:
        return Icons.severe_cold;
    }
  }

  static String getMetallicElementsLabel(MetallicElements element) {
    switch (element) {
      case MetallicElements.none:
        return 'None';
      case MetallicElements.gold:
        return 'Gold';
      case MetallicElements.silver:
        return 'Silver';
    }
  }

  static String getSizeFitLabel(SizeFit fit) {
    switch (fit) {
      case SizeFit.perfect:
        return 'Perfect Fit';
      case SizeFit.tooSmall:
        return 'Too Small';
      case SizeFit.tooLarge:
        return 'Too Large';
      case SizeFit.cropped:
        return 'Cropped';
      case SizeFit.oversized:
        return 'Oversized';
    }
  }
}