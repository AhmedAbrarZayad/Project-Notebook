import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scribe_canvas/scribe_canvas.dart';

class CanvasScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CanvasScreenState();
}

class CanvasScreenState extends ConsumerState<CanvasScreen> {
  final _controller = ScribeCanvasController();
  bool _isEraser = false;
  @override
  Widget build(BuildContext context) {
    return ScribeCanvas(
      controller: _controller,
      isEraser: _isEraser,
      onToggleEraser: (val) => setState(() => _isEraser = val),
      onStrokeEnd: () => setState(() {}),
      onUndo: () => setState(() {}),
      onRedo: () => setState(() {}),
    );
  }
}
