import 'package:flutter/material.dart';

class Slideable extends StatefulWidget {
  final Widget child;
  final Widget background;
  final VoidCallback onSlided;
  final VoidCallback? onTap;
  final actionThreshold = 0.1;
  const Slideable(
      {Key? key,
      this.onTap,
      required this.background,
      required this.child,
      required this.onSlided})
      : super(key: key);

  @override
  State<Slideable> createState() => _SlideableState();
}

class _SlideableState extends State<Slideable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _dragExtent = 0;
  Size size = Size(0, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onHorizontalDragStart: onDragStart,
      onHorizontalDragEnd: onDragEnd,
      onHorizontalDragUpdate: onDragUpdate,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: widget.background,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => SlideTransition(
              position: AlwaysStoppedAnimation(Offset(-_controller.value, 0)),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  void onDragStart(DragStartDetails details) {
    setState(() {
      _dragExtent = 0;
      size = context.size!;
      _controller.reset();
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    _dragExtent += details.primaryDelta!;
    if (_dragExtent >= 0 || _dragExtent < -100) {
      return;
    }
    setState(() {
      _controller.value = _dragExtent.abs() / context.size!.width;
    });
  }

  void onDragEnd(DragEndDetails details) {
    if (_controller.value > widget.actionThreshold) {
      widget.onSlided();
    }
    _controller.fling(velocity: -1);

    // Scaffold.of(context)..
  }
}



// () {
//         showDialog(
//           context: context,
//           builder: (context) => MyDialog(),
//         );
//       }