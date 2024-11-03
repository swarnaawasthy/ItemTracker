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
          size != null ? 'Size: ${size.width} x ${size.height}' : 'Calculating size...',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
