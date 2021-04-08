import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  Tools({
    Key? key,
    required this.opacity,
    required this.handleOpacityChange,
    required this.bottom,
  }) : super(key: key);

  final double opacity;
  final double bottom;

  final ValueChanged<double> handleOpacityChange;

  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {

  ///
  late double bottom;

  @override
  void initState() {
    bottom = widget.bottom;
    super.initState();
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      bottom = bottom - details.delta.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: widget.opacity.clamp(0.1, 1.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                GestureDetector(
                  onVerticalDragUpdate: onVerticalDragUpdate,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child:
                        Icon(Icons.unfold_more, color: iconColor(), size: 24),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: CupertinoSlider(
                    value: widget.opacity,
                    onChanged: widget.handleOpacityChange,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color iconColor() {
    var color = Theme.of(context).iconTheme.color != Colors.black87
        ? Theme.of(context).iconTheme.color
        : Theme.of(context).primaryColor == Colors.white
            ? Colors.grey
            : Colors.white;

    return color!;
  }
}
