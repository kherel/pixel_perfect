library pixel_perfect;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'src/tools.dart';

class PixelPerfect extends StatefulWidget {
  const PixelPerfect({
    Key? key,
    required this.child,
    this.offset = Offset.zero,
    this.image,
    this.bottom = 20,
  }) : super(key: key);

  final Widget child;
  final Offset offset;
  final String? image;
  final double bottom;

  @override
  _PixelPerfectState createState() => _PixelPerfectState();
}

class _PixelPerfectState extends State<PixelPerfect> {
  double opacity = 0.4;

  @override
  Widget build(BuildContext context) {
    var hasImage = widget.image != null;
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          IgnorePointer(
            ignoring: true,
            child: Opacity(
              opacity: opacity,
              child: hasImage
                  ? Transform.translate(
                      offset: widget.offset,
                      child: Image.asset(widget.image!),
                    )
                  : Text('no image'),
            ),
          ),
          Tools(
            opacity: opacity,
            handleOpacityChange: handleOpacityChange,
            bottom: widget.bottom,
          ),
        ],
      ),
    );
  }

  void handleOpacityChange(double v) {
    setState(() => opacity = v);
  }
}
