import 'package:flutter/material.dart';

import 'tools.dart';

class PixelPerfect extends StatefulWidget {
  /// The [child] argument is a required argument usually your scaffold widget.
  /// The [bottom] argument is space from the bottom of the screen to
  /// Pixel Perfect toolbar in px. Default value is 20.0 px;
  /// The [offset] argument is init image offset.
  /// Default value is Offset(0, 0)

  const PixelPerfect._({
    Key? key,
    required this.child,
    this.offset = Offset.zero,
    this.image,
    this.bottom = 20,
    required this.initOpacity,
  })  : assert(initOpacity >= 0.0 && initOpacity <= 1.0),
        super(key: key);

  /// Creates an PixelPerfect Basic Widget.
  /// The [assetPath] argument is the path to your asset design image
  /// The [scale] argument is scale parameter of your image. Default value is 1;

  factory PixelPerfect({
    Key? key,
    required Widget child,
    String? assetPath,
    double? scale = 1.0,
    Offset offset = Offset.zero,
    double initBottom = 20.0,
    double initOpacity = 0.4,
  }) {
    return PixelPerfect._(
      key: key,
      child: child,
      offset: offset,
      image: assetPath != null
          ? Image.asset(
              assetPath,
              fit: BoxFit.none,
              scale: scale,
            )
          : null,
      bottom: initBottom,
      initOpacity: initOpacity,
    );
  }

  /// Creates an PixelPerfect extended Widget.
  /// The [image] argument is your image with your design.

  factory PixelPerfect.extended({
    Key? key,
    Image? image,
    Offset offset = Offset.zero,
    double initBottom = 20.0,
    double initOpacity = 0.4,
    required Widget child,
  }) =>
      PixelPerfect._(
        key: key,
        child: child,
        image: image,
        bottom: initBottom,
        offset: offset,
        initOpacity: initOpacity,
      );

  final Widget child;
  final Offset offset;
  final Image? image;
  final double bottom;
  final double initOpacity;

  @override
  _PixelPerfectState createState() => _PixelPerfectState();
}

class _PixelPerfectState extends State<PixelPerfect> {
  bool isDragSwitcherOn = false;
  late Offset offset;

  late double initX;
  late double initY;
  late double opacity;
  late bool isHide;

  void onPanStart(DragStartDetails details) {
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
  }

  @override
  void initState() {
    offset = widget.offset;
    opacity = widget.initOpacity;
    isHide = widget.initOpacity == 0;
    super.initState();
  }

  void onPanUpdate(DragUpdateDetails details) {
    var x = details.globalPosition.dx - initX;
    var y = details.globalPosition.dy - initY;
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
      offset = offset + Offset(x, y);
    });
  }

  @override
  Widget build(BuildContext context) {
    var hasImage = widget.image != null;
    var isDraggable = isDragSwitcherOn && opacity != 0;
    return Material(
      child: GestureDetector(
        onPanStart: isDraggable ? onPanStart : null,
        onPanUpdate: isDraggable ? onPanUpdate : null,
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AbsorbPointer(
              absorbing: isDraggable,
              child: widget.child,
            ),
            Positioned(
              left: offset.dx - (isDraggable ? 1 : 0), // divide border width
              top: offset.dy - (isDraggable ? 1 : 0), // divide border width
              child: IgnorePointer(
                ignoring: true,
                child: Opacity(
                  opacity: opacity,
                  child: hasImage
                      ? Container(
                          decoration: isDraggable
                              ? BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                )
                              : null,
                          child: widget.image!,
                        )
                      : const Text('no image'),
                ),
              ),
            ),
            Tools(
              opacity: opacity,
              handleOpacityChange: handleOpacityChange,
              bottom: widget.bottom,
              toggleDrag: () => setState(() {
                isDragSwitcherOn = !isDragSwitcherOn;
              }),
              isHide: opacity == 0,
              isRangeShown: !isHide,
              toogleHide: () {
                var isHide = opacity != 0;
                setState(() {
                  this.isHide = isHide;
                  opacity = isHide
                      ? 0.0
                      : widget.initOpacity == 0
                          ? 0.4
                          : widget.initOpacity;
                });
              },
              isDrag: isDragSwitcherOn,
            ),
          ],
        ),
      ),
    );
  }

  void handleOpacityChange(double v) {
    setState(() => opacity = v);
  }
}
