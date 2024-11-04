import 'package:flutter/material.dart';

class ItemSizeDisplay extends StatelessWidget {
  const ItemSizeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final renderBox = context.findRenderObject() as RenderBox?;
        final size = renderBox?.size;

        return Text(
          size != null
              ? 'Widget size: ${size.width.toStringAsFixed(1)} x ${size.height.toStringAsFixed(1)}'
              : 'Calculating size...',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
