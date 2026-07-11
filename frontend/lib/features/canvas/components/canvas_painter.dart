import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

class CanvasPainter extends CustomPainter {

  const CanvasPainter({required this.points, required this.previousPoints});
  final List<List<PointVector>> previousPoints;
  final List<PointVector> points;
  @override
  void paint(Canvas canvas, Size size) {
    //print("length of previous points accumulated are ${previousPoints.length}");
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    
    for(var strokes in previousPoints){
      _drawStroke(strokes, paint, canvas);
    }

    if (points.isNotEmpty){
      _drawStroke(points, paint, canvas);
    }else{
      return;
    }

  }

  void _drawStroke(List<PointVector> points, Paint paint, Canvas canvas) {
    if(points.isEmpty)return;
    final strokes = getStroke(
      points,
      options: StrokeOptions(
        size: 10,
        thinning: 0.6,
        smoothing: 0.55,
        streamline: 0.5,
        simulatePressure: true,
        start: StrokeEndOptions.start(taperEnabled: true, customTaper: 0, cap: true),
        end: StrokeEndOptions.end(taperEnabled: true, customTaper: 0, cap: true),
      ),
    );
    final path = Path();
    path.moveTo(strokes[0].dx, strokes[0].dy);
    for(int i=1;i<strokes.length;i++){
      path.lineTo(strokes[i].dx, strokes[i].dy);
    }

    path.close();
    canvas.drawPath(path, paint);
  }


  @override
  bool shouldRepaint(covariant CanvasPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}