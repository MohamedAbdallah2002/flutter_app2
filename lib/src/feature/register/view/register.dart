import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/model/controller.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/core/widgets/custom_text_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "Register"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextForm(
                    controller: ControllerApp.name,
                    label: const Text("Name"),
                    hint: "Enter Your Name",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.name.clear();
                  },
                  icon: const Icon(Icons.clear)),
                    prefix: const Icon(Icons.person),
                    obsc: false,
                    txtInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Name must contain only letters and spaces';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    controller: ControllerApp.id,
                    label: const Text("ID"),
                    hint: "Enter Your ID",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.id.clear();
                  },
                  icon: const Icon(Icons.clear)),
                    prefix: const Icon(Icons.numbers),
                    obsc: true,
                    txtInputType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'National ID is required';
                      } else if (value.length != 14) {
                        return 'National ID must be exactly 14 digits';
                      } else if (!RegExp(r'^\d{14}$').hasMatch(value)) {
                        return 'National ID must contain only numbers';
                      }

                      value.substring(1, 7);
                      final int year = int.parse(value.substring(1, 3)) +
                          (value.startsWith('2') ? 1900 : 2000);
                      final int month = int.parse(value.substring(3, 5));
                      final int day = int.parse(value.substring(5, 7));

                      try {
                        DateTime dateOfBirth = DateTime(year, month, day);
                        if (dateOfBirth.isAfter(DateTime.now())) {
                          return 'Date of birth cannot be in the future';
                        }
                      } catch (e) {
                        return 'Invalid date of birth in National ID';
                      }

                      return null;
                    },
                  ),
                  CustomTextForm(
                    controller: ControllerApp.phone,
                    label: const Text("Phone"),
                    hint: "Enter Your Phone",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.phone.clear();
                  },
                  icon: const Icon(Icons.clear)),
                    prefix: const Icon(Icons.phone),
                    obsc: false,
                    txtInputType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      } else if (!RegExp(r'^01[0125]\d{8}$').hasMatch(value)) {
                        return 'Enter a valid Egyptian phone number';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    controller: ControllerApp.token,
                    label: const Text("Token"),
                    hint: "Enter Your Token",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.token.clear();
                  },
                  icon: const Icon(Icons.clear)),
                    prefix: const Icon(Icons.token),
                    obsc: true,
                    txtInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Token is required';
                      } else if (value.length < 6 || value.length > 64) {
                        return 'Token must be between 6 and 64 characters long';
                      } else if (!RegExp(r'^[a-zA-Z0-9-_]+$').hasMatch(value)) {
                        return 'Token can only contain letters, numbers, dashes, and underscores';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    controller: ControllerApp.email,
                    label: const Text("Email"),
                    hint: "Enter Your Email",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.email.clear();
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
                    controller: ControllerApp.password,
                    label: const Text("Password"),
                    hint: "Enter Your Password",
                    suffixIcon: IconButton(
                  onPressed: () {
                    ControllerApp.password.clear();
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
                          const SnackBar(content: Text('Register is done')),
                        );
                      }
                    },
                    child:  Text('Save',style: textStyle1(),),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}