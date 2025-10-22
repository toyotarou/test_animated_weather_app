import 'dart:math' as math;

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

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_rotateController);

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    _cloudAnimation = Tween<double>(
      begin: -150.0,
      end: 150.0,
    ).animate(CurvedAnimation(parent: _cloudController, curve: Curves.easeInOut));

    _waveAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_waveController);

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

              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [_buildMainWeatherCard()]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _buildMainWeatherCard() {
    return AnimatedBuilder(
      animation: _slideAnimation2,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation2.value),

          child: FadeTransition(
            opacity: _fadeAnimation,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withValues(alpha: 0.35),
                          Colors.white.withValues(alpha: 0.15),
                          Colors.white.withValues(alpha: 0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 30,
                          offset: Offset(0, 15),
                          spreadRadius: -5,
                        ),

                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: Offset(0, -10),
                          spreadRadius: -10,
                        ),
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: _waveAnimation,
                            builder: (context, child) {
                              return SizedBox(
                                width: 120,
                                height: 120,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedBuilder(
                                      animation: _breathAnimation,
                                      builder: (context, child) {
                                        return Transform.scale(
                                          scale: _breathAnimation.value,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,

                                              gradient: RadialGradient(
                                                colors: [
                                                  Colors.yellowAccent.withValues(alpha: 0.3),
                                                  Colors.transparent,
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),

                                    AnimatedBuilder(
                                      animation: _rotateAnimation,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: _rotateAnimation.value,

                                          child: CustomPaint(painter: SunRaysPainter(), size: Size(80, 80)),
                                        );
                                      },
                                    ),

                                    AnimatedBuilder(
                                      animation: _pulseAnimation,
                                      builder: (context, child) {
                                        return Transform.scale(
                                          scale: _pulseAnimation.value,
                                          child: Container(
                                            width: 65,
                                            height: 65,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,

                                              gradient: RadialGradient(colors: [Color(0xffffe082), Color(0xFFFF8740)]),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.yellowAccent.withValues(alpha: 0.4),

                                                  blurRadius: 20,
                                                  spreadRadius: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),

                                    AnimatedBuilder(
                                      animation: _cloudAnimation,
                                      builder: (context, child) {
                                        return Transform.translate(
                                          offset: Offset(_cloudAnimation.value * 0.2, 15),

                                          child: Transform.scale(
                                            scale: 0.8,

                                            child: CustomPaint(painter: CloudPainter(), size: Size(100, 55)),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 25),

                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulseAnimation.value,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '24',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 95,
                                        fontWeight: FontWeight.bold,
                                        height: 0.9,
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        '°',

                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 70,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 15),

                          AnimatedBuilder(
                            animation: _breathAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _breathAnimation.value,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),

                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
                                  ),

                                  child: Text(
                                    'Partly Cloudy',

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,

                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildTempItem("H: 26°", Colors.redAccent.withValues(alpha: 0.7)),

                              Container(
                                width: 2,
                                height: 20,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),

                              _buildTempItem("L: 18°", Colors.blueAccent.withValues(alpha: 0.7)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  ///
  _buildTempItem(String temp, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),

      child: Text(
        temp,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SunRaysPainter extends CustomPainter {
  ///
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellowAccent.withValues(alpha: 0.6)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2;

    for (int i = 0; i < 12; i++) {
      final angle = (i * 30) * math.pi / 180;

      final start = Offset(center.dx + math.cos(angle) * (radius - 15), center.dy + math.sin(angle) * (radius - 15));

      final end = Offset(center.dx + math.cos(angle) * radius, center.dy + math.sin(angle) * radius);

      canvas.drawLine(start, end, paint);
    }
  }

  ///
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CloudPainter extends CustomPainter {
  ///
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.95)
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    canvas.save();

    canvas.translate(2, 3);

    _drawCloudShape(canvas, size, shadowPaint);

    canvas.restore();

    _drawCloudShape(canvas, size, paint);

    final highlightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    canvas.save();

    canvas.translate(-1, -1);

    _drawCloudShape(canvas, size * 0.8, highlightPaint);

    canvas.restore();
  }

  ///
  void _drawCloudShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    final baseY = size.height * 0.7;

    final width = size.width;

    final height = size.height;

    path.moveTo(width * 0.1, baseY);

    path.cubicTo(width * 0.05, baseY, width * 0.02, baseY - height * 0.1, width * 0.08, baseY - height * 0.15);

    path.cubicTo(
      width * 0.12,
      baseY - height * 0.3,
      width * 0.18,
      baseY - height * 0.45,
      width * 0.28,
      baseY - height * 0.4,
    );

    path.cubicTo(
      width * 0.25,
      baseY - height * 0.55,
      width * 0.35,
      baseY - height * 0.65,
      width * 0.45,
      baseY - height * 0.55,
    );

    path.cubicTo(
      width * 0.48,
      baseY - height * 0.7,
      width * 0.58,
      baseY - height * 0.75,
      width * 0.68,
      baseY - height * 0.65,
    );

    path.cubicTo(
      width * 0.75,
      baseY - height * 0.7,
      width * 0.85,
      baseY - height * 0.6,
      width * 0.88,
      baseY - height * 0.45,
    );

    path.cubicTo(
      width * 0.92,
      baseY - height * 0.35,
      width * 0.95,
      baseY - height * 0.2,
      width * 0.9,
      baseY - height * 0.1,
    );

    path.cubicTo(width * 0.88, baseY, width * 0.8, baseY + height * 0.02, width * 0.7, baseY);

    path.cubicTo(width * 0.5, baseY - height * 0.02, width * 0.3, baseY + height * 0.02, width * 0.1, baseY);

    path.close();

    canvas.drawPath(path, paint);

    _drawSmallPuff(canvas, Offset(width * 0.15, baseY - height * 0.2), width * 0.08, paint);

    _drawSmallPuff(canvas, Offset(width * 0.75, baseY - height * 0.25), width * 0.06, paint);

    _drawSmallPuff(canvas, Offset(width * 0.55, baseY - height * 0.45), width * 0.05, paint);
  }

  ///
  void _drawSmallPuff(Canvas canvas, Offset center, double radius, Paint paint) {
    final puffPaint = Paint()
      ..color = paint.color
      ..style = PaintingStyle.fill;

    final path = Path();

    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * math.pi / 180;

      final variance = radius * (0.7 + math.sin(i * 2.3) * 0.3);

      final x = center.dx + math.cos(angle) * variance;

      final y = center.dy + math.sin(angle) * variance * 0.8;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        final prevAngle = ((i - 1) * 45) * math.pi / 180;

        final prevVariance = radius * (0.7 + math.sin((i - 1) * 2.3) * 0.3);

        final prevX = center.dx + math.cos(prevAngle) * prevVariance;

        final prevY = center.dy + math.sin(prevAngle) * prevVariance * 0.8;

        final controlX = (prevX + x) / 2 + (math.sin(i) * radius * 0.1);

        final controlY = (prevY + y) / 2 + (math.cos(i) * radius * 0.1);

        path.quadraticBezierTo(controlX, controlY, x, y);
      }
    }

    path.close();

    canvas.drawPath(path, puffPaint);
  }

  ///
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
