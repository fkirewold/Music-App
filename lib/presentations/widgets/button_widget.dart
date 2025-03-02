import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  final Color? color;
  final double? iconSize;
  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.icon,
    this.color,this.iconSize});


  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed,
    color: color,
     icon: icon,
     iconSize:iconSize ,);
  }
}