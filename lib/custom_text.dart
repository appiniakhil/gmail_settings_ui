import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final Color? color;
  final double? size;
  final TextOverflow? overflow;
  final int? lines;

  const CustomText({
    super.key,
    required this.text,
    this.weight,
    this.color,
    this.size,
    this.overflow, this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: weight, color: color, fontSize: size),
      overflow:overflow,
      maxLines: lines,
    );
  }
}
