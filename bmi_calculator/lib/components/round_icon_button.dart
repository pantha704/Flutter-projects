import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.fn, this.longFn});
  final IconData icon;
  final Function fn;
  final Function? longFn;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => fn(),
      onLongPress: () => longFn!(),
      constraints: BoxConstraints(
        minWidth: 56,
        minHeight: 56,
      ),
      elevation: 0,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}
