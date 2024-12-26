import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/feature/IBM/view/ibm_app.dart';
import 'package:flutter_app2/src/feature/login/view/login.dart';
import 'package:flutter_app2/src/feature/personal/view/main1_info.dart';
import 'package:flutter_app2/src/feature/register/view/register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "My Data "),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset("assets/6569935.png"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: Text("Do you have an account ?", style: textStyle1())),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: Text("Create a new account", style: textStyle1())),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Main1()),
                );
              },
              child: Text("Main", style: textStyle1())),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IbmApp()),
                );
              },
              child: Text("IBM", style: textStyle1())),
        ],
      ),
    );
  }
}
