import 'package:flutter/material.dart';

class BrandSwitcher extends StatelessWidget {
  const BrandSwitcher({
    Key? key,
    required this.isAcitve,
    required this.color,
  }) : super(key: key);

  final bool isAcitve;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 20,
      width: 30,
      alignment: isAcitve ? Alignment.topRight : Alignment.topLeft,
      decoration: BoxDecoration(
        color: isAcitve ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(17.5),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        width: 14,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 3),
              color: Colors.black.withOpacity(0.15),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 3),
              color: Colors.black.withOpacity(0.06),
            )
          ],
        ),
      ),
    );
  }
}
