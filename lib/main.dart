import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/themes/app_theme.dart';
import 'core/services/database_service.dart';
import 'presentation/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");
  
  await DatabaseService.instance.isar;
  
  runApp(
    const ProviderScope(
      child: WardrobeApp(),
    ),
  );
}

class WardrobeApp extends ConsumerWidget {
  const WardrobeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Outfits',
          theme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
