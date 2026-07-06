import 'package:frontend/features/canvas/screens/canvas_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => CanvasScreen())],
);
