import 'package:flutter/material.dart';

/// Default clothing item categories with descriptions
class DefaultCategories {
  static const List<CategoryInfo> items = [
    CategoryInfo(
      name: 'sporty',
      description: 'Cute sporty clothes',
      color: Color(0xFF66BB6A), // Green
      icon: Icons.weekend,
    ),
    CategoryInfo(
      name: 'gimmicky',
      description: 'Interesting / futuristic',
      color: Color(0xFF76FF03), // Neon Green
      icon: Icons.auto_awesome,
    ),
    CategoryInfo(
      name: 'professional',
      description: 'Office and business attire',
      color: Color(0xFF5C6BC0), // Indigo
      icon: Icons.business,
    ),
    CategoryInfo(
      name: 'basics',
      description: 'Timeless staples: jeans, white shirts, black little dress, minimalist vibes',
      color: Color(0xFF8D6E63), // Neutral Brown
      icon: Icons.checkroom,
    ),
    CategoryInfo(
      name: 'preppy',
      description: 'Bows, polka dots, ruffless, pastels, cute childish vibes',
      color: Color(0xFFF8BBD0), // Pastel Pink
      icon: Icons.school,
    ),
    CategoryInfo(
      name: 'boho',
      description: 'Boho, cowboy, ethnic',
      color: Color(0xFFFFC107), // Yellow
      icon: Icons.nature_people,
    ),
    CategoryInfo(
      name: 'old money',
      description: 'Mature, tweed and pearls',
      color: Color(0xFFCD7C68),
      icon: Icons.diamond,
    ),
    CategoryInfo(
      name: 'rock',
      description: 'Punk, rocky, grunge',
      color: Color(0xFF3A3A3A), // Black
      icon: Icons.music_note,
    ),
    CategoryInfo(
      name: 'romantic',
      description: 'Feminine, womanly items, strong colors and curvy lines',
      color: Color(0xFFE91E63), // Pink/Rose
      icon: Icons.favorite_border,
    ),
    CategoryInfo(
      name: 'sexy',
      description: 'Mesh, lace, leather, short dresses, high heels',
      color: Color(0xFFE53935), // Bright Red
      icon: Icons.favorite,
    ),
  ];

  /// Get color for a category name
  static Color? getColor(String name) {
    try {
      return items.firstWhere((c) => c.name == name).color;
    } catch (e) {
      return null;
    }
  }

  /// Get icon for a category name
  static IconData? getIcon(String name) {
    try {
      return items.firstWhere((c) => c.name == name).icon;
    } catch (e) {
      return null;
    }
  }

  /// Get description for a category name
  static String? getDescription(String name) {
    try {
      return items.firstWhere((c) => c.name == name).description;
    } catch (e) {
      return null;
    }
  }
}

/// Default outfit styles with descriptions
class DefaultOutfitStyles {
  static const List<CategoryInfo> items = [
    CategoryInfo(
      name: 'scorpio venus',
      description: 'Mysterious, sensual, and intense vibes',
      color: Color(0xFF59341E), // Deep Brown/Coffee
      icon: Icons.auto_awesome,
    ),
    CategoryInfo(
      name: 'work',
      description: 'Professional office outfits (and IT or education events)',
      color: Color(0xFF5C6BC0), // Indigo
      icon: Icons.business,
    ),
    CategoryInfo(
      name: 'gym',
      description: 'Athletic and workout outfits',
      color: Color(0xFF66BB6A), // Green
      icon: Icons.fitness_center,
    ),
    CategoryInfo(
      name: 'pilates',
      description: 'Comfortable workout wear',
      color: Color(0xFFD4A5A5), // Dusty pink - more visible than pastel yellow
      icon: Icons.self_improvement,
    ),
    CategoryInfo(
      name: 'high heels dance',
      description: 'Dancing in heels',
      color: Color(0xFF212121), // Black
      icon: Icons.music_note,
    ),
    CategoryInfo(
      name: 'comfy',
      description: 'Relaxed, comfortable and stylish (therapy, retreats, wellness events, travel, airport)',
      color: Color(0xFF00ACC1), // Blue
      icon: Icons.weekend,
    ),
    CategoryInfo(
      name: 'walk friendly',
      description: 'Stylish outfits with comfortable walking shoes',
      color: Color(0xFF81C784), // Green
      icon: Icons.directions_walk,
    ),
    CategoryInfo(
      name: 'tea date',
      description: 'Casual hangouts (boardgames)',
      color: Color(0xFFFF9800), // Orange
      icon: Icons.emoji_food_beverage,
    ),
    CategoryInfo(
      name: 'brunch',
      description: 'Daytime styled gatherings (city breaks, café hopping)',
      color: Color(0xFFF48FB1), // Pink
      icon: Icons.brunch_dining,
    ),
    CategoryInfo(
      name: 'wine date',
      description: 'Elegant evening looks (with the girls, group hangouts)',
      color: Color(0xFF800020), // Burgundy
      icon: Icons.wine_bar,
    ),
    CategoryInfo(
      name: 'romantic date',
      description: 'Special dates (with my bf)',
      color: Color(0xFFE53935), // Red
      icon: Icons.favorite,
    ),
    CategoryInfo(
      name: 'mall',
      description: 'Shopping and errands',
      color: Color(0xFF26A69A), // Teal
      icon: Icons.shopping_bag,
    ),
    CategoryInfo(
      name: 'holidays',
      description: 'Beach vibes and vacation looks',
      color: Color(0xFF00BCD4), // Turquoise/Cyan
      icon: Icons.beach_access,
    ),
    CategoryInfo(
      name: 'festivals',
      description: 'Bold and creative festival looks',
      color: Color(0xFFFFC107), // Amber
      icon: Icons.music_note,
    ),
    CategoryInfo(
      name: 'ballet show',
      description: 'Theatre and cultural performances',
      color: Color(0xFFBA68C8), // Lavender
      icon: Icons.theater_comedy,
    ),
    CategoryInfo(
      name: 'parties',
      description: 'Fun and festive outfits (indoor concerts, nightclub, Christmas, New Year)',
      color: Color(0xFF9C27B0), // Purple
      icon: Icons.celebration,
    ),
    CategoryInfo(
      name: 'formal',
      description: 'Weddings, galas, black tie events',
      color: Color(0xFF424242), // Dark Grey
      icon: Icons.diamond,
    ),
  ];

  /// Get color for an outfit style name
  static Color? getColor(String name) {
    try {
      return items.firstWhere((s) => s.name == name).color;
    } catch (e) {
      return null;
    }
  }

  /// Get icon for an outfit style name
  static IconData? getIcon(String name) {
    try {
      return items.firstWhere((s) => s.name == name).icon;
    } catch (e) {
      return null;
    }
  }

  /// Get description for an outfit style name
  static String? getDescription(String name) {
    try {
      return items.firstWhere((s) => s.name == name).description;
    } catch (e) {
      return null;
    }
  }
}

/// Information about a category or outfit style
class CategoryInfo {
  final String name;
  final String description;
  final Color color;
  final IconData icon;

  const CategoryInfo({
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
  });
}
