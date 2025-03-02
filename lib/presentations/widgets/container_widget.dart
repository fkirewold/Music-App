import 'package:flutter/material.dart';


class ContainerWidget extends StatelessWidget {
  final double? hieght;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? color;
  final DecorationImage? image;
  final BoxBorder? border;
   final BoxShape? shape;
  const ContainerWidget({
    super.key, 
    this.hieght, 
    this.width, 
    this.color, 
    this.shape,
    this.image, 
    this.borderRadius,
     this.border
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        image: image,
        color: color,
        shape: shape??BoxShape.rectangle,
      ),
    );
  }
}