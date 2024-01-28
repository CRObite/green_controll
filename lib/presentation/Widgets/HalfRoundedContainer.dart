import 'package:flutter/material.dart';

class HalfRoundedContainer extends StatelessWidget {
  const HalfRoundedContainer({super.key, required this.title, required this.color, required this.textColor});

  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(top: 16,left: 16),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,  color: textColor),),
          ],
        ),
      ),
    );
  }
}
