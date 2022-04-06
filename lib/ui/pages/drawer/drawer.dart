import 'package:flutter/material.dart';

/**
 *don't understand this please check it later
 *
 */

import '../news/news.dart';
import 'custom_drawer.dart';

class NavigationDrawer extends StatefulWidget {
  // final Widget child;

  const NavigationDrawer({key, }) : super(key: key);

  static _NavigationDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_NavigationDrawerState>();

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  //DashBoardController controller = Get.put(DashBoardController());

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: _NavigationDrawerState.duration);
    super.initState();
    //_controller.isCompleted ? controller.setIcon() : controller.setIcon();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
                  CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: NewsScreen()),
              ),
            ],
          );
        },
      ),
    );
  }
}
