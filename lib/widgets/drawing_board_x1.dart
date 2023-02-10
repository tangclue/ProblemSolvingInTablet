import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class DrawingBoardX1 extends DrawingBoard {
  @override
  final bool showDefaultTools = true;
  @override
  final bool boardPanEnabled = false;
  @override
  final bool showDefaultActions = true;

  const DrawingBoardX1({
    super.key,
    required super.background,
  });
}
