import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/database_service.dart';
import '../../core/themes/app_theme.dart';
import '../../core/services/backup_service.dart';
import '../../core/config/background_removal_config.dart';
import '../../core/config/api_config.dart';
import '../providers/clothing_provider.dart';
import '../providers/outfit_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/settings_provider.dart';
import 'manage_categories_screen.dart';

// Type alias for cleaner code
typedef RemovalMethod = BackgroundRemovalMethod;

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final BackupService _backupService = BackupService();
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final themeMode = ref.watch(themeProvider);
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          _buildAppSection(settings, themeMode),
          const SizedBox(height: 32),
          _buildImageProcessingSection(),
          const SizedBox(height: 32),
          _buildDataSection(),
          const SizedBox(height: 32),
          _buildBackupSection(),
          const SizedBox(height: 32),
          _buildAboutSection(),
        ],
      ),
    );
  }

  Widget _buildBackupSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Backup & Restore',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.backup, color: AppTheme.pastelPink),
              title: const Text('Create Backup'),
              subtitle: const Text('Export your wardrobe data'),
              trailing: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.arrow_forward_ios),
              onTap: _isProcessing ? null : _createBackup,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.share, color: AppTheme.gold),
              title: const Text('Share Backup'),
              subtitle: const Text('Share your wardrobe backup'),
              trailing: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.arrow_forward_ios),
              onTap: _isProcessing ? null : _shareBackup,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.restore, color: AppTheme.primaryBlack),
              title: const Text('Restore Backup'),
              subtitle: const Text('Import wardrobe data from backup'),
              trailing: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.arrow_forward_ios),
              onTap: _isProcessing ? null : _restoreBackup,
            ),
          ],
        ),
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
              leading: const Icon(Icons.refresh, color: AppTheme.mediumGray),
              title: const Text('Refresh Data'),
              subtitle: const Text('Reload all data from database'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _refreshData,
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.delete_sweep, color: Colors.red),
              title: const Text('Clear All Data'),
              subtitle: const Text('Delete all items and outfits'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _showClearDataDialog,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppSection(SettingsState settings, ThemeMode themeMode) {
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
              title: const Text('Manage Style Categories'),
              subtitle: const Text('Add, edit, or remove style categories'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: _navigateToManageCategories,
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
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.dark_mode, color: AppTheme.mediumGray),
              title: const Text('Dark Mode'),
              subtitle: const Text('Toggle dark theme'),
              trailing: Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  ref.read(themeProvider.notifier).toggleDarkMode();
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

  Future<void> _createBackup() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final filePath = await _backupService.exportBackup();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Backup created successfully!\nSaved to: $filePath'),
            backgroundColor: AppTheme.pastelPink,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create backup: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _shareBackup() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      await _backupService.shareBackup();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to share backup: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _restoreBackup() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Restore Backup'),
        content: const Text(
          'This will replace all your current data with the backup data. This action cannot be undone.\n\nDo you want to continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Restore',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final backupData = await _backupService.importBackup();
      await _backupService.restoreBackup(backupData);
      
      // Refresh all providers
      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(filteredClothingItemsProvider);
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
      ref.invalidate(wardrobeStatsProvider);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Backup restored successfully! 🎉'),
            backgroundColor: AppTheme.pastelPink,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to restore backup: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _refreshData() {
    ref.invalidate(allClothingItemsProvider);
    ref.invalidate(filteredClothingItemsProvider);
    ref.invalidate(allOutfitsProvider);
    ref.invalidate(filteredOutfitsProvider);
    ref.invalidate(favoriteOutfitsProvider);
    ref.invalidate(wardrobeStatsProvider);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data refreshed successfully!'),
        backgroundColor: AppTheme.pastelPink,
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

  void _showClearDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Data'),
        content: const Text(
          'This will permanently delete all your clothing items, outfits, and related data. This action cannot be undone.\n\nAre you absolutely sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _clearAllData();
            },
            child: const Text(
              'Delete All',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _clearAllData() async {
    try {
      final databaseService = DatabaseService.instance;
      await databaseService.clear();
      
      // Refresh all providers
      ref.invalidate(allClothingItemsProvider);
      ref.invalidate(filteredClothingItemsProvider);
      ref.invalidate(allOutfitsProvider);
      ref.invalidate(filteredOutfitsProvider);
      ref.invalidate(favoriteOutfitsProvider);
      ref.invalidate(wardrobeStatsProvider);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All data cleared successfully!'),
          backgroundColor: AppTheme.pastelPink,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to clear data: $e'),
          backgroundColor: Colors.red,
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
                'Data Collection:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• All data is stored locally on your device'),
              Text('• No personal information is collected'),
              Text('• Photos are processed locally'),
              SizedBox(height: 16),
              Text(
                'Data Usage:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Data is used only for app functionality'),
              Text('• No data is shared with third parties'),
              Text('• Backup files are under your control'),
              SizedBox(height: 16),
              Text(
                'Your Rights:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• You own all your data'),
              Text('• You can export or delete data anytime'),
              Text('• No tracking or analytics'),
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
}