import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';

class EnumUtils {
  static String getClothingTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return 'Top';
      case ClothingType.bottom:
        return 'Bottom';
      case ClothingType.dress:
        return 'Dress';
      case ClothingType.shoes:
        return 'Shoes';
      case ClothingType.bag:
        return 'Bag';
      case ClothingType.accessory:
        return 'Accessory';
      case ClothingType.outerwear:
        return 'Coat';
      case ClothingType.activewear:
        return 'Activewear';
      case ClothingType.swimwear:
        return 'Swimwear';
    }
  }

  static IconData getClothingTypeIcon(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return Icons.checkroom;
      case ClothingType.bottom:
        return Icons.compress;
      case ClothingType.dress:
        return Icons.weekend;
      case ClothingType.shoes:
        return Icons.elevator_rounded;
      case ClothingType.bag:
        return Icons.shopping_bag_outlined;
      case ClothingType.accessory:
        return Icons.star;
      case ClothingType.outerwear:
        return Icons.ac_unit;
      case ClothingType.activewear:
        return Icons.directions_run;
      case ClothingType.swimwear:
        return Icons.pool;
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
        return 'Hot (> 25°C)';
      case WeatherRange.hot:
        return 'Warm (18°C - 24°C)';
      case WeatherRange.warm:
        return 'Chill (10°C - 17°C)';
      case WeatherRange.cool:
        return 'Cool (3°C - 9°C)';
      case WeatherRange.cold:
        return 'Cold (-5°C - 2°C)';
      case WeatherRange.veryCold:
        return 'Freezing (< -5°C)';
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