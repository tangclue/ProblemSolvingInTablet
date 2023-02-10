import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:tang_clue/widgets/drawing_board_X1.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final DrawingController _drawingController = DrawingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draw!"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            width: 400,
            height: 400,
            child: DrawingBoardX1(
              background:
                  Container(width: 400, height: 200, color: Colors.orange),
            ),
          ),
          const Text("make your own drawing")
        ],
      ),
    );
  }
}
