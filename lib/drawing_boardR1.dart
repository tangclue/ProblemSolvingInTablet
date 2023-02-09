import 'package:flutter/material.dart';

class DrawingBoardR1 extends StatefulWidget {
  const DrawingBoardR1({Key? key}) : super(key: key);

  @override
  _DrawingBoardR1State createState() => _DrawingBoardR1State();
}

class _DrawingBoardR1State extends State<DrawingBoardR1> {
  List<dynamic> _points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset localPosition =
              renderBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (details) => _points.add(null),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          CustomPaint(
            painter: DrawingPainter(_points),
            size: Size.infinite,
          ),
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.points);

  final List<dynamic> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(DrawingPainter old) => old.points != points;
}
