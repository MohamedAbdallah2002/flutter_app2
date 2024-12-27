import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/border_text_form.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    required this.hint,
    required this.suffixIcon,
    required this.prefix, required this.obsc, required this.txtInputType, 

  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget label;
  final String hint;
  final Widget suffixIcon;
  final Widget prefix;
  final bool obsc;
  final TextInputType txtInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: txtInputType,
        obscureText:obsc ,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          label: label,
          hintText: hint,
          prefix: prefix,
          suffixIcon: suffixIcon,
          border: inputBorder(color: Colors.green),
          enabledBorder: inputBorder(color: Colors.blue),
          focusedBorder: inputBorder(color: Colors.black),
        ),
      ),
    );
  }
}