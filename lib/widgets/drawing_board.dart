import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tang_clue/constants/sizes.dart';

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({super.key});

  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  List<List<Offset>> _drawings = [];
  List<Offset> _currentDrawing = <Offset>[];

  void _clearDrawing() {
    setState(() {
      _drawings.clear();
      _currentDrawing = [];
      _drawings = [];
    });
  }

  void _finishDrawing() {
    setState(() {
      _drawings.add(_currentDrawing);
      _currentDrawing = <Offset>[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("a"),
      onPanUpdate: (details) {
        // print(details);
        // print(_currentDrawing);
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset localPosition =
              renderBox.globalToLocal(details.globalPosition);
          _currentDrawing = List.from(_currentDrawing)..add(localPosition);

          _drawings = List.from(_drawings);
          if (_drawings.isNotEmpty) {
            _drawings.removeLast();
          }
          _drawings.add(_currentDrawing);
          print(_drawings);
        });
      },
      onPanEnd: (details) => _finishDrawing(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: Sizes.size5)),
            width: 10000,
            height: 10000,
            child: ClipRect(
              child: CustomPaint(
                // willChange: false,
                painter: DrawingsPainter(_drawings),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: CupertinoButton(
                  onPressed: _clearDrawing, child: const Text("clear"))),
        ],
      ),
    );
  }
}

class DrawingsPainter extends CustomPainter {
  DrawingsPainter(this.drawings);

  final List<List<Offset>> drawings;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (var drawing in drawings) {
      if (drawing.length > 1) {
        for (int i = 0; i < drawing.length - 1; i++) {
          canvas.drawLine(drawing[i], drawing[i + 1], paint);
        }
      } else {
        canvas.drawPoints(PointMode.points, drawing, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingsPainter oldDelegate) {
    print('im updating');
    return oldDelegate.drawings != drawings;
  }
  // true;
}
