import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import '../../core/themes/typography.dart';
import '../../core/services/ml_outfit_recommender.dart';
import '../providers/outfit_provider.dart';
import '../providers/clothing_provider.dart';
import '../providers/color_palette_provider.dart';
import '../widgets/outfit_card.dart';
import '../widgets/unified_filters.dart';
import 'create_outfit_screen.dart';

class GeneratorScreen extends ConsumerStatefulWidget {
  const GeneratorScreen({super.key});

  @override
  ConsumerState<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends ConsumerState<GeneratorScreen> {
  List<String> _selectedCategories = [];
  Season _selectedSeason = Season.allSeason;
  List<WeatherRange> _selectedWeatherRanges = [];
  String? _selectedColorPaletteId;
  bool _isGenerating = false;

  // ML-specific parameters
  String? _occasion;
  String? _mood;
  double? _temperature;
  bool _useMLRecommendations = false;

  // Text-based generation
  final TextEditingController _textPromptController = TextEditingController();
  bool _useTextPrompt = false;

  // ML Recommender
  MLOutfitRecommender? _mlRecommender;

  @override
  void initState() {
    super.initState();
    _initializeMLRecommender();
  }

  @override
  void dispose() {
    _textPromptController.dispose();
    super.dispose();
  }

  Future<void> _initializeMLRecommender() async {
    final clothingRepository = ref.read(clothingRepositoryProvider);
    final outfitRepository = ref.read(outfitRepositoryProvider);
    _mlRecommender = MLOutfitRecommender(clothingRepository, outfitRepository);
  }

  @override
  Widget build(BuildContext context) {
    final generatedOutfits = ref.watch(generatedOutfitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Outfit'),
        actions: [
          IconButton(
            onPressed: _clearFilters,
            icon: const Icon(Icons.clear_all),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            kToolbarHeight -
                            80, // Height of button container
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      _buildFiltersSection(),
                      const Divider(),
                      if (generatedOutfits.isEmpty)
                        Expanded(child: _buildEmptyState())
                      else
                        _buildGeneratedOutfits(generatedOutfits),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Fixed generate button at bottom
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isGenerating ? null : _generateOutfits,
                  icon: _isGenerating
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(Icons.shuffle),
                  label: Text(
                    _isGenerating ? 'Generating...' : 'Generate Outfits',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.darkerPink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customize Your Generation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildTextPromptSection(),
          const SizedBox(height: 16),
          _buildMLToggle(),
          const SizedBox(height: 16),
          if (_useMLRecommendations) _buildMLControls(),
          if (_useMLRecommendations) const SizedBox(height: 16),
          UnifiedFilters(
            showCategories: true,
            showSeasons: true,
            showWeather: true,
            showColors: false,
            showClothingTypes: false,
            showFavorites: false,
            showMetallicElements: false,
            selectedCategories: _selectedCategories,
            selectedSeasons: [_selectedSeason],
            selectedWeatherRanges: _selectedWeatherRanges,
            selectedColors: const [],
            selectedTypes: const [],
            selectedFavorites: null,
            selectedMetallicElements: null,
            onCategoriesChanged: (categories) {
              setState(() {
                _selectedCategories = categories;
              });
            },
            onSeasonsChanged: (seasons) {
              setState(() {
                _selectedSeason = seasons.isNotEmpty ? seasons.first : Season.allSeason;
              });
            },
            onWeatherChanged: (ranges) {
              setState(() {
                _selectedWeatherRanges = ranges;
              });
            },
            onColorsChanged: (colors) {},
            onTypesChanged: (types) {},
            onFavoritesChanged: (favorites) {},
            onMetallicElementsChanged: (elements) {},
          ),
          const SizedBox(height: 16),
          _buildColorPaletteSection(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 64,
              color: AppTheme.mediumGray,
            ),
            const SizedBox(height: 24),
            const Text(
              'No outfits generated yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.mediumGray,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _useTextPrompt
                ? 'Describe your outfit above and tap Generate'
                : 'Set your preferences and tap Generate Outfits',
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.mediumGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneratedOutfits(List<Outfit> outfits) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Generated Outfits (${outfits.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: _saveAllOutfits,
                icon: const Icon(Icons.save_outlined),
                label: const Text('Save All'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: outfits.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => OutfitCard(
              outfit: outfits[index],
              onTap: () => _editGeneratedOutfit(outfits[index]),
              onFavorite: () => _saveOutfit(outfits[index]),
            ),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildColorPaletteSection() {
    final palettesAsync = ref.watch(allColorPalettesProvider);

    return palettesAsync.when(
      data: (palettes) {
        if (palettes.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.lightGray.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.mediumGray.withValues(alpha: 0.3),
              ),
            ),
            child: const Column(
              children: [
                Icon(Icons.palette_outlined, size: 32, color: AppTheme.mediumGray),
                SizedBox(height: 8),
                Text(
                  'No color palettes available',
                  style: TextStyle(fontSize: 14, color: AppTheme.mediumGray),
                ),
                SizedBox(height: 4),
                Text(
                  'Create palettes in Settings to filter by colors',
                  style: TextStyle(fontSize: 12, color: AppTheme.mediumGray),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final selectedPalette = _selectedColorPaletteId != null
            ? palettes.firstWhere(
                (p) => p.id == _selectedColorPaletteId,
                orElse: () => palettes.first,
              )
            : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Color Palette',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.lightGray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedColorPaletteId != null
                      ? AppTheme.pastelPink
                      : AppTheme.mediumGray.withValues(alpha: 0.3),
                  width: _selectedColorPaletteId != null ? 2 : 1,
                ),
              ),
              child: Column(
                children: [
                  DropdownButtonFormField<String?>(
                    value: _selectedColorPaletteId,
                    decoration: const InputDecoration(
                      labelText: 'Select a color palette',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: AppTheme.lightGray,
                    ),
                    items: [
                      const DropdownMenuItem<String?>(
                        value: null,
                        child: Text('None'),
                      ),
                      ...palettes.map((palette) {
                        return DropdownMenuItem<String>(
                          value: palette.id,
                          child: Text(
                            palette.name ?? 'Palette ${palette.colors.length} colors',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedColorPaletteId = value;
                      });
                    },
                  ),
                  if (selectedPalette != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: selectedPalette.colors.map((color) {
                        return Expanded(
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildMLToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.lightGray.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _useMLRecommendations ? AppTheme.pastelPink : AppTheme.mediumGray.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome,
            color: _useMLRecommendations ? AppTheme.pastelPink : AppTheme.mediumGray,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI-Powered Recommendations',
                  style: AppTypography.labelLarge.copyWith(
                    color: _useMLRecommendations ? AppTheme.pastelPink : null,
                  ),
                ),
                Text(
                  'Get personalized outfit suggestions based on your style preferences',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _useMLRecommendations,
            onChanged: (value) {
              setState(() {
                _useMLRecommendations = value;
              });
            },
            activeThumbColor: AppTheme.pastelPink,
          ),
        ],
      ),
    );
  }

  Widget _buildTextPromptSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _useTextPrompt ? AppTheme.pastelPink.withValues(alpha: 0.1) : AppTheme.lightGray.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _useTextPrompt ? AppTheme.pastelPink : AppTheme.mediumGray.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.chat_bubble_outline,
                color: _useTextPrompt ? AppTheme.pastelPink : AppTheme.mediumGray,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Text-Based Generation',
                      style: AppTypography.labelLarge.copyWith(
                        color: _useTextPrompt ? AppTheme.pastelPink : null,
                      ),
                    ),
                    Text(
                      'Describe your outfit in natural language',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _useTextPrompt,
                onChanged: (value) {
                  setState(() {
                    _useTextPrompt = value;
                    if (!value) {
                      _textPromptController.clear();
                    }
                  });
                },
                activeColor: AppTheme.pastelPink,
              ),
            ],
          ),
          if (_useTextPrompt) ...[
            const SizedBox(height: 16),
            TextField(
              controller: _textPromptController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'e.g., "I need a romantic outfit for a dinner date in winter" or "Something professional but stylish for a presentation"',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(16),
              ),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Tip: Mention occasion, weather, mood, or style preferences',
              style: AppTypography.bodySmall.copyWith(
                color: AppTheme.mediumGray,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMLControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.pastelPink.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.pastelPink.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Smart Context', style: AppTypography.labelLarge),
          const SizedBox(height: 12),

          // Occasion selection
          const Text('Occasion', style: AppTypography.labelMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              'casual', 'work', 'formal', 'party', 'date', 'gym', 'travel'
            ].map((occasion) => ChoiceChip(
              label: Text(occasion),
              selected: _occasion == occasion,
              onSelected: (selected) {
                setState(() {
                  _occasion = selected ? occasion : null;
                });
              },
              selectedColor: AppTheme.darkerPink,
              backgroundColor: AppTheme.darkerPink.withValues(alpha: 0.9),
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            )).toList(),
          ),

          const SizedBox(height: 16),

          // Mood selection
          const Text('Mood', style: AppTypography.labelMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              'bold', 'minimal', 'romantic', 'edgy', 'professional', 'playful'
            ].map((mood) => ChoiceChip(
              label: Text(mood),
              selected: _mood == mood,
              onSelected: (selected) {
                setState(() {
                  _mood = selected ? mood : null;
                });
              },
              selectedColor: AppTheme.darkerPink,
              backgroundColor: AppTheme.darkerPink.withValues(alpha: 0.9),
              side: BorderSide.none,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            )).toList(),
          ),

          const SizedBox(height: 16),

          // Temperature slider
          const Text('Temperature', style: AppTypography.labelMedium),
          const SizedBox(height: 8),
          Slider(
            value: _temperature ?? 20,
            min: -10,
            max: 40,
            divisions: 50,
            label: _temperature != null ? '${_temperature!.round()}°C' : 'Auto',
            onChanged: (value) {
              setState(() {
                _temperature = value;
              });
            },
            activeColor: AppTheme.pastelPink,
          ),

          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('-10°C', style: AppTypography.bodySmall),
              Text('40°C', style: AppTypography.bodySmall),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _parseTextPrompt(String prompt) {
    final lowerPrompt = prompt.toLowerCase();
    final result = <String, dynamic>{};

    // Parse outfit styles from your category constants
    final outfitStyles = [
      'scorpio venus', 'work', 'gym', 'pilates', 'high heels dance',
      'comfy', 'walk friendly', 'tea date', 'brunch', 'wine date',
      'romantic date', 'mall', 'holidays', 'festivals', 'ballet show',
      'parties', 'formal'
    ];

    final matchedStyles = <String>[];
    for (final style in outfitStyles) {
      if (lowerPrompt.contains(style)) {
        matchedStyles.add(style);
      }
    }

    // Check for common keywords mapping to styles
    if (lowerPrompt.contains('romantic') || lowerPrompt.contains('date night') || lowerPrompt.contains('dinner date')) {
      if (!matchedStyles.contains('romantic date')) matchedStyles.add('romantic date');
    }
    if (lowerPrompt.contains('professional') || lowerPrompt.contains('office') || lowerPrompt.contains('presentation') || lowerPrompt.contains('meeting')) {
      if (!matchedStyles.contains('work')) matchedStyles.add('work');
    }
    if (lowerPrompt.contains('party') || lowerPrompt.contains('celebration') || lowerPrompt.contains('nightclub')) {
      if (!matchedStyles.contains('parties')) matchedStyles.add('parties');
    }
    if (lowerPrompt.contains('wedding') || lowerPrompt.contains('gala') || lowerPrompt.contains('black tie')) {
      if (!matchedStyles.contains('formal')) matchedStyles.add('formal');
    }
    if (lowerPrompt.contains('workout') || lowerPrompt.contains('exercise') || lowerPrompt.contains('fitness')) {
      if (!matchedStyles.contains('gym')) matchedStyles.add('gym');
    }
    if (lowerPrompt.contains('comfortable') || lowerPrompt.contains('comfy') || lowerPrompt.contains('casual') || lowerPrompt.contains('relaxed')) {
      if (!matchedStyles.contains('comfy')) matchedStyles.add('comfy');
    }
    if (lowerPrompt.contains('shopping') || lowerPrompt.contains('errands')) {
      if (!matchedStyles.contains('mall')) matchedStyles.add('mall');
    }
    if (lowerPrompt.contains('beach') || lowerPrompt.contains('vacation') || lowerPrompt.contains('holiday')) {
      if (!matchedStyles.contains('holidays')) matchedStyles.add('holidays');
    }
    if (lowerPrompt.contains('brunch') || lowerPrompt.contains('café') || lowerPrompt.contains('coffee')) {
      if (!matchedStyles.contains('brunch')) matchedStyles.add('brunch');
    }

    result['categories'] = matchedStyles.isNotEmpty ? matchedStyles : null;

    // Parse season
    if (lowerPrompt.contains('winter') || lowerPrompt.contains('cold')) {
      result['season'] = Season.winter;
    } else if (lowerPrompt.contains('summer') || lowerPrompt.contains('hot')) {
      result['season'] = Season.summer;
    } else if (lowerPrompt.contains('spring')) {
      result['season'] = Season.spring;
    } else if (lowerPrompt.contains('autumn') || lowerPrompt.contains('fall')) {
      result['season'] = Season.autumn;
    }

    // Parse weather
    final weatherRanges = <WeatherRange>[];
    if (lowerPrompt.contains('very hot') || lowerPrompt.contains('scorching')) {
      weatherRanges.add(WeatherRange.veryHot);
    } else if (lowerPrompt.contains('hot') || lowerPrompt.contains('warm summer')) {
      weatherRanges.add(WeatherRange.hot);
    } else if (lowerPrompt.contains('warm') || lowerPrompt.contains('mild')) {
      weatherRanges.add(WeatherRange.warm);
    } else if (lowerPrompt.contains('cool') || lowerPrompt.contains('chilly')) {
      weatherRanges.add(WeatherRange.cool);
    } else if (lowerPrompt.contains('very cold') || lowerPrompt.contains('freezing')) {
      weatherRanges.add(WeatherRange.veryCold);
    } else if (lowerPrompt.contains('cold')) {
      weatherRanges.add(WeatherRange.cold);
    }

    if (weatherRanges.isNotEmpty) {
      result['weatherRanges'] = weatherRanges;
    }

    return result;
  }

  Future<void> _generateOutfits() async {
    setState(() {
      _isGenerating = true;
    });

    try {
      // Parse text prompt if enabled
      Map<String, dynamic>? parsedPrompt;
      if (_useTextPrompt && _textPromptController.text.trim().isNotEmpty) {
        parsedPrompt = _parseTextPrompt(_textPromptController.text);
      }

      // Get colors from selected palette
      List<String>? paletteColors;
      if (_selectedColorPaletteId != null) {
        final palettesAsync = ref.read(allColorPalettesProvider);
        await palettesAsync.when(
          data: (palettes) async {
            final palette = palettes.firstWhere(
              (p) => p.id == _selectedColorPaletteId,
              orElse: () => palettes.first,
            );
            // Convert Color objects to hex strings
            paletteColors = palette.colors
                .map((c) => '#${c.value.toRadixString(16).padLeft(8, '0').substring(2)}')
                .toList();
          },
          loading: () {},
          error: (_, __) {},
        );
      }

      // Combine parameters from text prompt AND manual selection
      List<String>? categories;
      if (parsedPrompt?['categories'] != null || _selectedCategories.isNotEmpty) {
        final promptCategories = parsedPrompt?['categories'] as List<String>? ?? [];
        final combined = {...promptCategories, ..._selectedCategories}.toList();
        categories = combined.isEmpty ? null : combined;
      }

      // Use text prompt season if specified, otherwise use manual selection
      final season = parsedPrompt?['season'] as Season? ?? _selectedSeason;

      // Combine weather ranges from both sources
      List<WeatherRange>? weatherRanges;
      if (parsedPrompt?['weatherRanges'] != null || _selectedWeatherRanges.isNotEmpty) {
        final promptRanges = parsedPrompt?['weatherRanges'] as List<WeatherRange>? ?? [];
        final combined = {...promptRanges, ..._selectedWeatherRanges}.toList();
        weatherRanges = combined.isEmpty ? null : combined;
      }

      if (_useMLRecommendations && _mlRecommender != null) {
        // Use ML-powered recommendations
        final outfits = await _mlRecommender!.generateRecommendations(
          count: 6,
          season: season != Season.allSeason ? season : null,
          weatherRanges: weatherRanges,
          occasion: _occasion,
          preferredColors: paletteColors,
          temperature: _temperature,
          mood: _mood,
        );

        // Update the provider with ML-generated outfits
        ref.read(generatedOutfitsProvider.notifier).setOutfits(outfits);
      } else {
        // Use traditional generation
        await ref.read(generatedOutfitsProvider.notifier).generateOutfits(
          count: 6,
          categories: categories,
          season: season,
          weatherRanges: weatherRanges,
          preferredColors: paletteColors,
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Outfits generated successfully!'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate outfits: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  void _editGeneratedOutfit(Outfit outfit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateOutfitScreen(outfit: outfit),
      ),
    );
  }

  Future<void> _saveOutfit(Outfit outfit) async {
    try {
      final repository = ref.read(outfitRepositoryProvider);
      await repository.saveOutfit(outfit.copyWith(isFavorite: true));
      
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Outfit saved to favorites! ❤️'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save outfit: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _saveAllOutfits() async {
    try {
      final outfits = ref.read(generatedOutfitsProvider);
      final repository = ref.read(outfitRepositoryProvider);
      
      for (final outfit in outfits) {
        await repository.saveOutfit(outfit);
      }
      
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.read(generatedOutfitsProvider.notifier).clearGenerated();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${outfits.length} outfits saved successfully! 🎉'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save outfits: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _clearFilters() {
    setState(() {
      _selectedCategories.clear();
      _selectedSeason = Season.allSeason;
      _selectedWeatherRanges.clear();
      _selectedColorPaletteId = null;
    });
    ref.read(generatedOutfitsProvider.notifier).clearGenerated();
  }
}