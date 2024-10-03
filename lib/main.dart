import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(XboxLogoApp());

class XboxLogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xbox Logo Animation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: XboxLogoScreen(),
    );
  }
}

class XboxLogoScreen extends StatefulWidget {
  @override
  _XboxLogoScreenState createState() => _XboxLogoScreenState();
}

class _XboxLogoScreenState extends State<XboxLogoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * 2.0 * 3.141592653589793, // Rotation in Radians
              child: child,
            );
          },
          child: SvgPicture.asset(
            'assets/images/xbox_logo.svg',
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
