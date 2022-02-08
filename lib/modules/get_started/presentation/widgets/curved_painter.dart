import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      // ..color = Color(0xFFD8B6A9)
      // ..color = Color(0xFFFFFCF5)
      // ..color = const Color(0xFFCB5F5F)
      ..color = const Color(0xFF1D321D)
      // ..color = const Color(0xFF109172)
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height * 0.585);
    path.quadraticBezierTo(
        size.width / 1.85, size.height * 0.5, size.width, size.height * 0.573);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
