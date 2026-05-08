import 'package:flutter/material.dart';

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key});

  @override
  State<PaintScreen> createState() =>
      _PaintScreenState();
}

class _PaintScreenState
    extends State<PaintScreen> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text("Pintar"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                points.clear();
              });
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),

      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(
              details.localPosition,
            );
          });
        },
        onPanEnd: (details) {
          points.add(null);
        },
        child: CustomPaint(
          painter: DrawingPainter(
            points,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class DrawingPainter
    extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter(this.points);

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final paint = Paint()
      ..strokeCap =
          StrokeCap.round
      ..strokeWidth = 5;

    for (int i = 0;
    i < points.length - 1;
    i++) {
      if (points[i] != null &&
          points[i + 1] != null) {
        canvas.drawLine(
          points[i]!,
          points[i + 1]!,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(
      CustomPainter oldDelegate) {
    return true;
  }
}