import 'package:flutter/material.dart';


import '../../util/AppColors.dart';
import 'CustomShadow.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.type, required this.hintText, required this.labelText, required this.controller, required this.onChanged});


  final TextInputType type;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Function onChanged;


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
        boxShadow: CustomShadow.shadow
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.labelText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
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

              onChanged: (value) {
                widget.onChanged();
              },
            ),
          ],
        ),
      ),
    );
  }
}
