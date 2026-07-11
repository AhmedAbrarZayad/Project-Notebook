import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/canvas/components/canvas_painter.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

class Canvas extends ConsumerStatefulWidget {
  const Canvas({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CanvasState();
}


class _CanvasState extends ConsumerState<Canvas> {

  List<List<PointVector>> previousPoints = [];
  List<PointVector> currentPoints = [];
  int _activePointers = 0;
  TransformationController transformationController = TransformationController();
  void _updateLocation(PointerEvent details){
    //print("Pressed at ${details.localPosition.dx} and ${details.localPosition.dy}");
    if(_activePointers > 1) {
      currentPoints.clear();
      return;
    }else if(_activePointers == 0) {
      return;
    }
    Matrix4 inverseMatrix = Matrix4.inverted(transformationController.value);
    Offset worldPosition = MatrixUtils.transformPoint(inverseMatrix, details.localPosition);
    
    setState(() {
      currentPoints = [...currentPoints, PointVector(worldPosition.dx, worldPosition.dy)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerEvent details) async {
        setState(() {
          _activePointers++;
        });
        //print("Active pointers count ${_activePointers}");
        _updateLocation(details);
      }, 
      onPointerMove: _updateLocation,
      onPointerUp: (PointerEvent details) {
        setState(() {
          _activePointers = 0;
          previousPoints.add(List.from(currentPoints));
          currentPoints.clear();
        });
      },
      onPointerCancel: (event) {
        _activePointers = 0;
        previousPoints.add(List.from(currentPoints));
        currentPoints.clear(); 
      },
      child: InteractiveViewer(
        panEnabled: _activePointers > 1,
        scaleEnabled: _activePointers > 1,
        boundaryMargin: EdgeInsets.all(0),
        constrained: true,
        transformationController: transformationController,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: CanvasPainter(points: currentPoints, previousPoints: previousPoints),
            child: Image.asset(
              'assets/images/notebook_green_bg.jpg'
            ),
          ),
        ),
      )
      
    );
  }
}