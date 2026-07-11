import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/canvas/components/canvas.dart';

class CanvasScreen extends ConsumerStatefulWidget {
  const CanvasScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CanvasScreenState();
}



class CanvasScreenState extends ConsumerState<CanvasScreen> {
  @override
  Widget build(BuildContext context) {
    return Canvas();
  }
}
