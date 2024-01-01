import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  const CustomCard({super.key, required this.colour, this.cardChild, this.setGender});
  final Color colour;
  final Widget? cardChild;
  final Function? setGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setGender!();
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(15)),
        child: cardChild,
      ),
    );
  }
}
