import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/canvas/components/canvas_painter.dart';

class Canvas extends ConsumerStatefulWidget {
  const Canvas({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CanvasState();
}


class _CanvasState extends ConsumerState<Canvas> {

  double x = 0;
  double y = 0;

  void _updateLocation(PointerEvent details){
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.all(double.infinity),
      child: Listener(
        onPointerMove: _updateLocation,
        child: CustomPaint(
          painter: CanvasPainter(),
        ),
      )
    );
  }
}