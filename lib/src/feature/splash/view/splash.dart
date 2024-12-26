import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/feature/home/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds: 10),(){
      Navigator.pushReplacement  (
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "Flutter App"),
      body: Center(
        child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset("assets/6569935.png"),
            ),
      ),
    );
  }
}