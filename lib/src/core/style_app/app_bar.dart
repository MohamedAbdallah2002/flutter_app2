
import 'package:flutter/material.dart';

AppBar appBarMyApp({required String text}){
  return AppBar(
        elevation: 0,
        centerTitle: true,
        title:  Text(
          text,
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}