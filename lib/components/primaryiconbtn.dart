import 'package:flutter/material.dart';
import 'package:mydream/constants/colours.dart';

class PrimaryIconButton extends StatelessWidget {
  final IconData icons;
  final double size;
  final Function func;

  const PrimaryIconButton(
      {@required this.icons, @required this.func, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          icons,
          color: k_primarycolor,
          size: size == null ? 40 : size,
        ),
        onPressed: func);
  }
}