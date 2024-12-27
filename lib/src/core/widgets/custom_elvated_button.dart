import 'package:flutter/material.dart';

class CustomElavtedButton extends StatelessWidget {
  const CustomElavtedButton({
    super.key,
    required this.formKey,
    required this.txt1,
    required this.txt2,
  });

  final GlobalKey<FormState> formKey;
  final String txt1;
  final String txt2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(txt1)));
          }
        },
        child: Text(txt2, style: const TextStyle(color: Colors.lightBlue)));
  }
}
