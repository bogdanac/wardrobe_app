import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../../core/themes/app_theme.dart';
import '../../core/config/background_removal_config.dart';
import '../../core/config/api_config.dart';
import '../../core/services/backup_export_service.dart';
import '../../core/services/backup_import_service.dart';
import '../../domain/entities/clothing_item.dart';
import '../providers/clothing_provider.dart';
import '../providers/outfit_provider.dart';
import '../providers/category_provider.dart';
import '../providers/outfit_style_provider.dart';
import '../providers/custom_color_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/auth_provider.dart';
import 'manage_categories_screen.dart';
import 'manage_outfit_styles_screen.dart';
import 'manage_colors_screen.dart';
import 'color_palettes_screen.dart';

// Type alias for cleaner code
typedef RemovalMethod = BackgroundRemovalMethod;

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _isProcessing = false;

  Widget _buildUserProfileSection() {
    final authService = ref.watch(authServiceProvider);
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) return const SizedBox.shrink();

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Profile picture
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppTheme.pastelPink,
                      backgroundImage: authService.userPhotoUrl != null
                          ? NetworkImage(authService.userPhotoUrl!)
                          : null,
                      child: authService.userPhotoUrl == null
                          ? const Icon(Icons.person, size: 30, color: AppTheme.primaryBlack)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    // User info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authService.userDisplayName ?? 'User',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            authService.userEmail ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.mediumGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 32),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Sign Out'),
                  subtitle: const Text('Sign out from your account'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: _showSignOutDialog,
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          _buildUserProfileSection(),
          const SizedBox(height: 16),
          _buildAppSection(settings),
          const SizedBox(height: 16),
          _buildImageProcessingSection(),
          const SizedBox(height: 16),
          _buildDataSection(),
          const SizedBox(height: 16),
          _buildAboutSection(),
        ],
      ),
    );
  }

  Widget _buildImageProcessingSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Image Processing',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder<RemovalMethod>(
              future: BackgroundRemovalConfig.getPreferredMethod(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircularProgressIndicator(),
                    title: Text('Loading...'),
                  );
                }
                
                final currentMethod = snapshot.data!;
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.auto_fix_high, color: AppTheme.pastelPink),
                      title: const Text('Background Removal'),
                      subtitle: Text(BackgroundRemovalConfig.getMethodDisplayName(currentMethod)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => _showBackgroundRemovalDialog(currentMethod),
                    ),
                    if (!ApiConfig.isRemoveBgConfigured) ...[
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.info, color: Colors.orange, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'AI background removal requires API key configuration',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Management',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.backup, color: AppTheme.pastelPink),
              title: const Text('Export Complete Backup'),
              subtitle: const Text('Save all data and images'),
              trailing: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.arrow_forward_ios),
              onTap: _isProcessing ? null : _exportBackup,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.restore, color: AppTheme.gold),
              title: const Text('Import Backup'),
              subtitle: const Text('Restore data from backup files'),
              trailing: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.arrow_forward_ios),
              onTap: _isProcessing ? null : _importBackup,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppSection(SettingsState settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.category, color: AppTheme.pastelPink),
              title: const Text('Manage Item Categories'),
              subtitle: const Text('Categories for individual clothing items'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _navigateToManageCategories,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.style, color: AppTheme.pastelPink),
              title: const Text('Manage Outfit Styles'),
              subtitle: const Text('Styles for complete outfits'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _navigateToManageOutfitStyles,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.palette, color: AppTheme.gold),
              title: const Text('Manage Colors'),
              subtitle: const Text('Customize your items colors'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _navigateToManageColors,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.color_lens, color: AppTheme.pastelPink),
              title: const Text('Color Palettes'),
              subtitle: const Text('Create and manage outfit color palettes'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _navigateToColorPalettes,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.wb_sunny, color: AppTheme.gold),
              title: const Text('Current Season'),
              subtitle: Text(
                settings.currentSeason != null
                    ? _getSeasonLabel(settings.currentSeason!)
                    : 'Not set - showing all items',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _showSeasonDialog(settings.currentSeason),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.notifications, color: AppTheme.mediumGray),
              title: const Text('Notifications'),
              subtitle: const Text('Manage app notifications'),
              trailing: Switch(
                value: settings.notificationsEnabled,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setNotificationsEnabled(value);
                },
                activeThumbColor: AppTheme.pastelPink,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.info, color: AppTheme.mediumGray),
              title: const Text('App Version'),
              subtitle: const Text('1.0.0'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Wardrobe Manager',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2024 Wardrobe Manager',
                  children: const [
                    Text('A modern wardrobe management app to organize your outfits and clothing items.'),
                  ],
                );
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.help, color: AppTheme.mediumGray),
              title: const Text('Help & Support'),
              subtitle: const Text('Get help using the app'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showHelpDialog();
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.privacy_tip, color: AppTheme.mediumGray),
              title: const Text('Privacy Policy'),
              subtitle: const Text('View privacy policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showPrivacyDialog();
              },
            ),
          ],
        ),
      ),
    );
  }


  void _showBackgroundRemovalDialog(RemovalMethod currentMethod) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Background Removal Method'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: RemovalMethod.values.map((method) {
            final isAiAvailable = ApiConfig.isRemoveBgConfigured;
            final canSelect = method != RemovalMethod.ai || isAiAvailable;
            
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Radio<RemovalMethod>(
                value: method,
                groupValue: currentMethod,
                onChanged: canSelect ? (value) {
                  if (value != null) {
                    _updateBackgroundRemovalMethod(value);
                    Navigator.pop(context);
                  }
                } : null,
              ),
              title: Text(
                BackgroundRemovalConfig.getMethodDisplayName(method),
                style: TextStyle(
                  color: canSelect ? null : AppTheme.mediumGray,
                ),
              ),
              subtitle: Text(
                BackgroundRemovalConfig.getMethodDescription(method),
                style: TextStyle(
                  fontSize: 12,
                  color: canSelect ? AppTheme.mediumGray : AppTheme.mediumGray.withValues(alpha: 0.6),
                ),
              ),
              onTap: canSelect ? () {
                _updateBackgroundRemovalMethod(method);
                Navigator.pop(context);
              } : null,
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _updateBackgroundRemovalMethod(RemovalMethod method) async {
    await BackgroundRemovalConfig.setPreferredMethod(method);
    setState(() {}); // Refresh the UI
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Background removal method updated to ${BackgroundRemovalConfig.getMethodDisplayName(method)}'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    }
  }


  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help & Support'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Getting Started:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('1. Add clothing items using the camera or gallery'),
              Text('2. Create outfits by selecting items'),
              Text('3. Use the generator to create new outfit combinations'),
              Text('4. Track your wear statistics'),
              SizedBox(height: 16),
              Text(
                'Features:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Automatic color detection from photos'),
              Text('• Background removal for clean item photos'),
              Text('• Smart outfit generation with color matching'),
              Text('• Detailed statistics and analytics'),
              Text('• Backup and restore functionality'),
              SizedBox(height: 16),
              Text(
                'Need more help?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Contact support for additional assistance.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Data Storage:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Data is synced via Firebase (Google Cloud)'),
              Text('• Cached locally on your device for offline use'),
              Text('• Photos stored in Firebase Cloud Storage'),
              Text('• Enables multi-device sync and backup'),
              SizedBox(height: 16),
              Text(
                'Data Collection:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Only Google account info (email, name, photo)'),
              Text('• Your wardrobe data (items, outfits, photos)'),
              Text('• No tracking, analytics, or third-party sharing'),
              SizedBox(height: 16),
              Text(
                'Your Rights:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• You own all your data'),
              Text('• Export backups anytime'),
              Text('• Sign out to stop sync'),
              Text('• Data deleted when you delete your account'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Understood'),
          ),
        ],
      ),
    );
  }

  void _navigateToManageCategories() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ManageCategoriesScreen(),
      ),
    );
  }

  void _navigateToManageOutfitStyles() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ManageOutfitStylesScreen(),
      ),
    );
  }

  void _navigateToManageColors() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ManageColorsScreen(),
      ),
    );
  }

  void _navigateToColorPalettes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ColorPalettesScreen(),
      ),
    );
  }

  Future<void> _exportBackup() async {
    setState(() => _isProcessing = true);

    try {
      final clothingRepository = ref.read(clothingRepositoryProvider);
      final outfitRepository = ref.read(outfitRepositoryProvider);
      final categoryRepository = ref.read(categoryRepositoryProvider);
      final customColorRepository = ref.read(customColorRepositoryProvider);
      final outfitStyleRepository = ref.read(outfitStyleRepositoryProvider);
      final exportService = BackupExportService(clothingRepository, outfitRepository, categoryRepository, customColorRepository, outfitStyleRepository);

      // Show progress dialog
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Creating backup...'),
              ],
            ),
          ),
        );
      }

      final backupPaths = await exportService.exportCompleteBackup();

      if (mounted) {
        Navigator.pop(context); // Close progress dialog
      }

      // Share the backup files
      await exportService.shareBackupFiles(backupPaths);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Backup created successfully!'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close progress dialog if open
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create backup: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _importBackup() async {
    try {
      // Pick JSON file
      final jsonResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        dialogTitle: 'Select backup JSON file',
      );

      if (jsonResult == null || jsonResult.files.isEmpty) {
        return; // User cancelled
      }

      // Ask if user has ZIP file (optional for old Isar backups)
      final hasZip = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Image Files'),
          content: const Text('Do you have a ZIP file with images?\n\n(Select "No" if using old backup format with local image paths)'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Yes'),
            ),
          ],
        ),
      );

      if (hasZip == null) return; // User cancelled

      String? zipPath;
      if (hasZip) {
        // Pick ZIP file
        final zipResult = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['zip'],
          dialogTitle: 'Select backup ZIP file',
        );

        if (zipResult == null || zipResult.files.isEmpty) {
          return; // User cancelled
        }

        zipPath = zipResult.files.first.path;
      }

      setState(() => _isProcessing = true);

      final clothingRepository = ref.read(clothingRepositoryProvider);
      final outfitRepository = ref.read(outfitRepositoryProvider);
      final categoryRepository = ref.read(categoryRepositoryProvider);
      final customColorRepository = ref.read(customColorRepositoryProvider);
      final outfitStyleRepository = ref.read(outfitStyleRepositoryProvider);
      final importService = BackupImportService(clothingRepository, outfitRepository, categoryRepository, customColorRepository, outfitStyleRepository);

      // Show progress dialog
      String progressText = 'Starting import...';
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(progressText),
                  ],
                ),
              );
            },
          ),
        );
      }

      final result = await importService.importCompleteBackup(
        jsonFilePath: jsonResult.files.first.path!,
        zipFilePath: zipPath,
        onProgress: (progress) {
          progressText = progress;
          if (mounted) {
            setState(() {});
          }
        },
      );

      if (mounted) {
        Navigator.pop(context); // Close progress dialog
      }

      // Refresh all data
      ref.invalidate(allCategoriesProvider);
      ref.invalidate(allOutfitStylesProvider);
      ref.invalidate(allCustomColorsProvider);
      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(filteredClothingItemsProvider);
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
      ref.invalidate(wardrobeStatsProvider);

      if (mounted) {
        // Show result dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Import Complete'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item categories imported: ${result.categoriesImported}'),
                Text('Outfit styles imported: ${result.outfitStylesImported}'),
                Text('Custom colors imported: ${result.customColorsImported}'),
                Text('Items imported: ${result.itemsImported}'),
                Text('Outfits imported: ${result.outfitsImported}'),
                Text('Images uploaded: ${result.imagesUploaded}'),
                if (result.hasErrors) ...[
                  const SizedBox(height: 16),
                  Text('Errors: ${result.errors.length}', style: const TextStyle(color: Colors.orange)),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close progress dialog if open
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to import backup: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  String _getSeasonLabel(Season season) {
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

  void _showSeasonDialog(Season? currentSeason) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Current Season'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<Season?>(
              contentPadding: EdgeInsets.zero,
              title: const Text('None (Show all items)'),
              value: null,
              groupValue: currentSeason,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setCurrentSeason(null);
                Navigator.pop(context);
              },
            ),
            RadioListTile<Season?>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Spring'),
              value: Season.spring,
              groupValue: currentSeason,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setCurrentSeason(Season.spring);
                Navigator.pop(context);
              },
            ),
            RadioListTile<Season?>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Summer'),
              value: Season.summer,
              groupValue: currentSeason,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setCurrentSeason(Season.summer);
                Navigator.pop(context);
              },
            ),
            RadioListTile<Season?>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Autumn'),
              value: Season.autumn,
              groupValue: currentSeason,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setCurrentSeason(Season.autumn);
                Navigator.pop(context);
              },
            ),
            RadioListTile<Season?>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Winter'),
              value: Season.winter,
              groupValue: currentSeason,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setCurrentSeason(Season.winter);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _signOut();
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signed out successfully'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign out: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}