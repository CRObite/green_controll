import 'package:flutter/material.dart';
import 'package:green_control/util/AppColors.dart';

class LongTextField extends StatefulWidget {
  const LongTextField({super.key, required this.type, required this.hintText, required this.controller});

  final TextInputType type;
  final String hintText;
  final TextEditingController controller;

  @override
  State<LongTextField> createState() => _LongTextFieldState();
}

class _LongTextFieldState extends State<LongTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.type == TextInputType.visiblePassword
          ? obscureText
          : false,
      decoration: InputDecoration(
        labelText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10.0),
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
    );
  }
}
