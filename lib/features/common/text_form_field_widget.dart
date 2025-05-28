import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final bool hideText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.hideText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.w500, fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: validator,
      ),
    );
  }
}