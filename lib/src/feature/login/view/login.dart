import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/model/controller.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/core/widgets/custom_text_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "LogIn"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextForm(
                    controller: ControllerApp.emailLog,
                    label: const Text("Email"),
                    hint: "Enter Your Email",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.emailLog.clear();
                  },
                  icon: const Icon(Icons.clear)),
                    prefix: const Icon(Icons.email),
                    obsc: false,
                    txtInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    controller: ControllerApp.passwordLog,
                    label: const Text("Password"),
                    hint: "Enter Your Password",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.passwordLog.clear();
                  },
                  icon: const Icon(Icons.clear)),
                    prefix: const Icon(Icons.password_outlined),
                    obsc: true,
                    txtInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter';
                      } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password must contain at least one lowercase letter';
                      } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                          .hasMatch(value)) {
                        return 'Password must contain at least one special character';
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('LogIn is done')),
                  );
                }
              },
              child: Text('Done',style: textStyle1(),),
            ),
                ],
              )),
        ),
      ),
    );
  }
}