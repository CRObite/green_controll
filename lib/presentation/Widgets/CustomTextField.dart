import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.type, required this.hintText, required this.labelText, required this.controller});


  final TextInputType type;
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.labelText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: widget.controller,
              obscureText: widget.type == TextInputType.visiblePassword
                  ? obscureText
                  : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 16,
                ),
                suffixIcon: widget.type == TextInputType.visiblePassword
                    ? IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,

                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
