import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../domain/entities/color_palette.dart';
import '../../core/themes/app_theme.dart';
import '../providers/color_palette_provider.dart';
import 'create_color_palette_screen.dart';

class ColorPalettesScreen extends ConsumerWidget {
  const ColorPalettesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palettesAsync = ref.watch(allColorPalettesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palettes'),
      ),
      body: palettesAsync.when(
        data: (palettes) {
          if (palettes.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildPaletteGrid(context, ref, palettes);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading palettes: $error'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreatePalette(context),
        backgroundColor: AppTheme.pastelPink,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.palette_outlined,
            size: 64,
            color: AppTheme.mediumGray,
          ),
          const SizedBox(height: 24),
          const Text(
            'No Color Palettes Yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.mediumGray,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Create your first color palette',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _navigateToCreatePalette(context),
            icon: const Icon(Icons.add),
            label: const Text('Create Palette'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.pastelPink,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaletteGrid(BuildContext context, WidgetRef ref, List<ColorPalette> palettes) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: palettes.length,
        itemBuilder: (context, index) {
          final palette = palettes[index];
          return _buildPaletteCard(context, ref, palette);
        },
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }

  Widget _buildPaletteCard(BuildContext context, WidgetRef ref, ColorPalette palette) {
    return GestureDetector(
      onTap: () => _navigateToEditPalette(context, palette),
      onLongPress: () => _showDeleteDialog(context, ref, palette),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (palette.imagePath != null)
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  palette.imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppTheme.lightGray,
                      child: const Icon(
                        Icons.broken_image,
                        color: AppTheme.mediumGray,
                        size: 48,
                      ),
                    );
                  },
                ),
              )
            else
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: AppTheme.lightGray,
                  child: Row(
                    children: palette.colors.map((color) {
                      return Expanded(
                        child: Container(color: color),
                      );
                    }).toList(),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (palette.name != null)
                    Text(
                      palette.name!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    Text(
                      'Palette ${palette.colors.length} colors',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    children: palette.colors.map((color) {
                      return Expanded(
                        child: Container(
                          height: 32,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCreatePalette(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateColorPaletteScreen(),
      ),
    );
  }

  void _navigateToEditPalette(BuildContext context, ColorPalette palette) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateColorPaletteScreen(palette: palette),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, ColorPalette palette) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Color Palette'),
        content: Text(
          'Are you sure you want to delete ${palette.name ?? "this palette"}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              await _deletePalette(context, ref, palette);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _deletePalette(BuildContext context, WidgetRef ref, ColorPalette palette) async {
    try {
      final repository = ref.read(colorPaletteRepositoryProvider);
      await repository.deleteColorPalette(palette.id);

      // Invalidate the provider to refresh the list
      ref.invalidate(allColorPalettesProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Color palette deleted successfully!'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete palette: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
