import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  Tools({
    Key? key,
    required this.opacity,
    required this.handleOpacityChange,
    required this.bottom,
    required this.isDrag,
    required this.toggleDrag,
  }) : super(key: key);

  final double opacity;
  final double bottom;
  final bool isDrag;
  final VoidCallback toggleDrag;

  final ValueChanged<double> handleOpacityChange;

  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
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
      left: 5,
      right: 5,
      child: Opacity(
        opacity: widget.opacity.clamp(0.1, 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => widget.toggleDrag(),
              child: _Button(
                icon: Icons.open_with,
                isColorsInverted: widget.isDrag,
              ),
            ),
            const SizedBox(width: 5),
            Row(
              children: [
                GestureDetector(
                  onVerticalDragUpdate: onVerticalDragUpdate,
                  child: const _Button(
                    icon: Icons.unfold_more,
                  ),
                ),
                const SizedBox(width: 5),
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
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.icon,
    this.isColorsInverted = false,
  }) : super(key: key);

  final IconData icon;
  final bool isColorsInverted;

  @override
  Widget build(BuildContext context) {
    late Color background;
    late Color color;
    if (isColorsInverted) {
      background = iconColor(context);
      color = Theme.of(context).primaryColor;
    } else {
      background = Theme.of(context).primaryColor;
      color = iconColor(context);
    }
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        color: background,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  Color iconColor(BuildContext context) {
    var color = Theme.of(context).iconTheme.color != Colors.black87
        ? Theme.of(context).iconTheme.color
        : Theme.of(context).primaryColor == Colors.white
            ? Colors.grey
            : Colors.white;

    return color!;
  }
}
