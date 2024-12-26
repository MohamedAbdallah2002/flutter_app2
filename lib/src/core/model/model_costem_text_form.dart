import 'package:flutter/material.dart';

class ModelCostemTextForm {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget label;
  final String hint;
  final Widget suffixIcon;
  final Widget prefix;
  final bool obsc;
  final TextInputType txtInputType;

const ModelCostemTextForm({
    required this.controller,
    this.validator,
    required this.label,
    required this.hint,
    required this.suffixIcon,
    required this.prefix, required this.obsc, required this.txtInputType,

  });
}



  