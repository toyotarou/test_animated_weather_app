import 'dart:math' as Math;

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late AnimationController _rotateController;
  late AnimationController _pulseController;
  late AnimationController _cloudController;
  late AnimationController _waveController;
  late AnimationController _breathController;
  late AnimationController _shimmerController;

  late Animation<double> _slideAnimation;
  late Animation<double> _slideAnimation2;
  late Animation<double> _slideAnimation3;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fadeDelayedAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _cloudAnimation;
  late Animation<double> _waveAnimation;
  late Animation<double> _breathAnimation;
  late Animation<double> _shimmerAnimation;
  late Animation<double> _scaleAnimation;

  ///
  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _slideController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _fadeController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _rotateController = AnimationController(vsync: this, duration: Duration(seconds: 25));
    _pulseController = AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    _cloudController = AnimationController(vsync: this, duration: Duration(seconds: 12));
    _waveController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _breathController = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _shimmerController = AnimationController(vsync: this, duration: Duration(seconds: 2));

    _slideAnimation = Tween<double>(
      begin: 150.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));

    _slideAnimation2 = Tween<double>(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Interval(0.2, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _slideAnimation3 = Tween<double>(begin: 250.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Interval(0.4, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    _fadeDelayedAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * Math.pi).animate(_rotateController);

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    _cloudAnimation = Tween<double>(
      begin: -150.0,
      end: 150.0,
    ).animate(CurvedAnimation(parent: _cloudController, curve: Curves.easeInOut));

    _waveAnimation = Tween<double>(begin: 0.0, end: 2 * Math.pi).animate(_waveController);

    _breathAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _breathController, curve: Curves.easeInOut));

    _shimmerAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(_shimmerController);

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.00,
    ).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeInOut));

    _slideController.forward();
    _fadeController.forward();
    _mainController.forward();
    _rotateController.forward();
    _pulseController.repeat(reverse: true);
    _cloudController.repeat(reverse: true);
    _waveController.repeat();
    _breathController.repeat(reverse: true);
    _shimmerController.repeat(reverse: true);
  }

  ///
  @override
  void dispose() {
    super.dispose();

    _slideController.dispose();
    _fadeController.dispose();
    _mainController.dispose();
    _rotateController.dispose();
    _pulseController.dispose();
    _cloudController.dispose();
    _waveController.dispose();
    _breathController.dispose();
    _shimmerController.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1e3c72), Color(0xFF2a5298), Color(0xFF4a98e2), Color(0xFF7868ee), Color(0xFF9378db)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.2, 0.5, 0.8, 1.0],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _slideAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value),

                    child: FadeTransition(
                      opacity: _fadeAnimation,

                      child: Container(
                        padding: EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedBuilder(
                              animation: _breathAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _breathAnimation.value,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AnimatedBuilder(
                                        animation: _shimmerAnimation,
                                        builder: (context, child) {
                                          return ShaderMask(
                                            shaderCallback: (bounds) {
                                              return LinearGradient(
                                                colors: [Colors.yellowAccent, Colors.blueAccent, Colors.greenAccent],
                                                stops: [0.0, 0.5, 1.0],
                                                transform: GradientRotation(_shimmerAnimation.value),
                                              ).createShader(bounds);
                                            },
                                            child: Text(
                                              'New York',

                                              style: TextStyle(
                                                color: Colors.white,

                                                fontSize: 32,

                                                fontWeight: FontWeight.bold,
                                                letterSpacing: -0.5,
                                              ),
                                            ),
                                          );
                                        },
                                      ),

                                      SizedBox(height: 5),

                                      Text(
                                        'Today, Oct 2 - 9:45 AM',

                                        style: TextStyle(
                                          color: Colors.white.withValues(alpha: 0.8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            AnimatedBuilder(
                              animation: _pulseAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _pulseAnimation.value,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withValues(alpha: 0.3),
                                          Colors.white.withValues(alpha: 0.1),
                                        ],
                                      ),

                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1.5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withValues(alpha: 0.1),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Icon(Icons.my_location, color: Colors.white, size: 26),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
