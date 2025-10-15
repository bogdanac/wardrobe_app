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
  List<String> _preferredColors = [];
  MetallicElements? _selectedMetallicElements;
  bool _isGenerating = false;
  
  // ML-specific parameters
  String? _occasion;
  String? _mood;
  double? _temperature;
  bool _useMLRecommendations = false;
  
  // ML Recommender
  MLOutfitRecommender? _mlRecommender;

  @override
  void initState() {
    super.initState();
    _initializeMLRecommender();
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
              child: Column(
                children: [
                  _buildFiltersSection(),
                  const Divider(),
                  generatedOutfits.isEmpty
                      ? _buildEmptyState()
                      : _buildGeneratedOutfits(generatedOutfits),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isGenerating ? null : _generateOutfits,
        icon: _isGenerating
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryBlack),
                ),
              )
            : const Icon(Icons.shuffle),
        label: Text(
          _isGenerating ? 'Generating...' : 'Generate Outfits',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
          _buildMLToggle(),
          const SizedBox(height: 16),
          if (_useMLRecommendations) _buildMLControls(),
          UnifiedFilters(
            showCategories: true,
            showSeasons: true,
            showWeather: true,
            showColors: true,
            showClothingTypes: false,
            showFavorites: false,
            showMetallicElements: true,
            selectedCategories: _selectedCategories,
            selectedSeasons: [_selectedSeason],
            selectedWeatherRanges: _selectedWeatherRanges,
            selectedColors: _preferredColors,
            selectedTypes: const [],
            selectedFavorites: null,
            selectedMetallicElements: _selectedMetallicElements,
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
            onColorsChanged: (colors) {
              setState(() {
                _preferredColors = colors;
              });
            },
            onTypesChanged: (types) {},
            onFavoritesChanged: (favorites) {},
            onMetallicElementsChanged: (elements) {
              setState(() {
                _selectedMetallicElements = elements;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.auto_awesome,
            size: 48,
            color: AppTheme.mediumGray,
          ),
          SizedBox(height: 16),
          Text(
            'No outfits generated yet',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
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
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
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

  Future<void> _generateOutfits() async {
    setState(() {
      _isGenerating = true;
    });

    try {
      if (_useMLRecommendations && _mlRecommender != null) {
        // Use ML-powered recommendations
        final outfits = await _mlRecommender!.generateRecommendations(
          count: 6,
          season: _selectedSeason != Season.allSeason ? _selectedSeason : null,
          weatherRanges: _selectedWeatherRanges.isEmpty ? null : _selectedWeatherRanges,
          occasion: _occasion,
          preferredColors: _preferredColors.isEmpty ? null : _preferredColors,
          temperature: _temperature,
          mood: _mood,
        );
        
        // Update the provider with ML-generated outfits
        ref.read(generatedOutfitsProvider.notifier).setOutfits(outfits);
      } else {
        // Use traditional generation
        await ref.read(generatedOutfitsProvider.notifier).generateOutfits(
          count: 6,
          categories: _selectedCategories.isEmpty ? null : _selectedCategories,
          season: _selectedSeason,
          weatherRanges: _selectedWeatherRanges.isEmpty ? null : _selectedWeatherRanges,
          preferredColors: _preferredColors.isEmpty ? null : _preferredColors,
        );
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Outfits generated successfully! ✨'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to generate outfits: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isGenerating = false;
      });
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
      _preferredColors.clear();
    });
    ref.read(generatedOutfitsProvider.notifier).clearGenerated();
  }
}