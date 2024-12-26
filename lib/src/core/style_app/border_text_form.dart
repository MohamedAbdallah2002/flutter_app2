import 'package:flutter/material.dart';

OutlineInputBorder inputBorder({required Color color}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide:BorderSide(color: color),
  );
}