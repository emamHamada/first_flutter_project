import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? bolden;
  final  Color? color;
  final  FontStyle? style;
  final AlignmentGeometry? align;
  final EdgeInsetsGeometry? padding;
  final double? w;

  const CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.bolden,
      this.color,
      this.style,
      this.align,
      this.padding,
      this.w})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
            fontSize: size, fontWeight: bolden, color: color, fontStyle: style),
      ),
    );
  }
}
