import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tang_clue/constants/sizes.dart';

class DrawingBoardR0 extends StatefulWidget {
  const DrawingBoardR0({super.key});

  @override
  _DrawingBoardR0State createState() => _DrawingBoardR0State();
}

class _DrawingBoardR0State extends State<DrawingBoardR0> {
  final TextEditingController _ansController = TextEditingController();
  String _ans = "";
  List<Offset> _points = <Offset>[];
  List<List<Offset>> listPoints = [
    [const Offset(0, 0)]
  ];
  void onClear() {
    setState(() {
      listPoints = [
        [const Offset(0, 0)]
      ];
      print(listPoints);
    });
  }

  void _onSubmit() {
    print(_ans);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ansController.addListener(() {
      setState(() {
        _ans = _ansController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          body: Stack(children: [
            GestureDetector(
              onPanStart: (details) {
                _points.clear();
              },
              onPanUpdate: (details) {
                setState(() {
                  // RenderBox box = context.findRenderObject();
                  RenderBox box = context.findRenderObject() as RenderBox;
                  Offset point = box.globalToLocal(details.globalPosition);
                  // _points.add(point);
                  _points = List.from(_points)..add(point);
                  listPoints.add(_points);
                  // print(_points);
                  print(listPoints.last);
                });
              },
              // onPanEnd: (details) => _points.add(null),

              child: Stack(children: [
                for (var points in listPoints)
                  CustomPaint(
                    painter: DrawPainter(points),
                    size: Size.infinite,
                  ),
              ]),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CupertinoButton(
                onPressed: onClear,
                child: const Text(
                  "Clear",
                  style: TextStyle(fontSize: Sizes.size32),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onEditingComplete: _onSubmit,
                controller: _ansController,
                decoration: const InputDecoration(hintText: "정답을 입력하세요."),
              ),
            ),
          ]),
        ));
  }
}

class DrawPainter extends CustomPainter {
  DrawPainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(DrawPainter oldDelegate) => oldDelegate.points != points;
}
