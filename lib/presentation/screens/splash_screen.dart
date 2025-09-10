import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/themes/app_theme.dart';
import 'home_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _dotsController;
  late AnimationController _backgroundController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _dotsOpacity;
  late Animation<double> _backgroundOpacity;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationSequence();
  }

  void _initializeAnimations() {
    // Logo animations
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _logoScale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));

    _logoOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    // Text animations
    _textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _textOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    ));

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOutBack,
    ));

    // Dots animation
    _dotsController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _dotsOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _dotsController,
      curve: Curves.easeIn,
    ));

    // Background animation
    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _backgroundOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _backgroundController,
      curve: Curves.easeIn,
    ));
  }

  void _startAnimationSequence() async {
    // Start background animation
    _backgroundController.forward();

    // Start logo animation
    await Future.delayed(const Duration(milliseconds: 200));
    _logoController.forward();

    // Start dots animation
    await Future.delayed(const Duration(milliseconds: 300));
    _dotsController.forward();

    // Start text animation
    await Future.delayed(const Duration(milliseconds: 200));
    _textController.forward();

    // Navigate to home after animations complete
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, _) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _dotsController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlack,
      body: AnimatedBuilder(
        animation: _backgroundController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  AppTheme.primaryBlack.withOpacity(0.8),
                  AppTheme.primaryBlack,
                ],
                stops: [0.0, _backgroundOpacity.value],
              ),
            ),
            child: Stack(
              children: [
                // Animated background dots
                _buildAnimatedDots(),
                // Main content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo with animations
                      AnimatedBuilder(
                        animation: _logoController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _logoScale.value,
                            child: Opacity(
                              opacity: _logoOpacity.value,
                              child: _buildLogo(),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // App name with animations
                      AnimatedBuilder(
                        animation: _textController,
                        builder: (context, child) {
                          return SlideTransition(
                            position: _textSlide,
                            child: Opacity(
                              opacity: _textOpacity.value,
                              child: const Text(
                                'Outfits',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryWhite,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Subtitle
                      AnimatedBuilder(
                        animation: _textController,
                        builder: (context, child) {
                          return SlideTransition(
                            position: _textSlide,
                            child: Opacity(
                              opacity: _textOpacity.value * 0.8,
                              child: const Text(
                                'Your Style, Organized',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.mediumGray,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppTheme.primaryBlack,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppTheme.pastelPink.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Dress silhouette
          Icon(
            Icons.checkroom,
            size: 60,
            color: AppTheme.primaryWhite,
          ),
          // Decorative dots around the dress
          Positioned(
            top: 20,
            left: 25,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppTheme.pastelPink,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppTheme.gold,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 30,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            right: 25,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.purple.shade200,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedDots() {
    return AnimatedBuilder(
      animation: _dotsController,
      builder: (context, child) {
        return Opacity(
          opacity: _dotsOpacity.value,
          child: Stack(
            children: [
              // Top-left floating dots
              Positioned(
                top: 100,
                left: 30,
                child: _buildFloatingDot(AppTheme.pastelPink, 12),
              ),
              Positioned(
                top: 180,
                left: 80,
                child: _buildFloatingDot(AppTheme.gold, 8),
              ),
              // Top-right floating dots
              Positioned(
                top: 120,
                right: 40,
                child: _buildFloatingDot(Colors.lightBlue.shade300, 10),
              ),
              Positioned(
                top: 200,
                right: 90,
                child: _buildFloatingDot(Colors.purple.shade200, 6),
              ),
              // Bottom floating dots
              Positioned(
                bottom: 150,
                left: 50,
                child: _buildFloatingDot(Colors.orange.shade300, 9),
              ),
              Positioned(
                bottom: 180,
                right: 60,
                child: _buildFloatingDot(Colors.pink.shade200, 11),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFloatingDot(Color color, double size) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 2000 + (size * 100).toInt()),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, -10 * (0.5 - (value - 0.5).abs())),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color.withOpacity(0.7),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}