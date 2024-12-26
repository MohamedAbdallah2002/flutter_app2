import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';

import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/feature/personal/view/main1_info.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.name1, required this.bDate});

  final String name1;
  final String bDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "Details"),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Spacer(flex: 4),
          ElevatedButton(
              onPressed: () {}, child: Text(name1, style: textStyle1())),
          ElevatedButton(
              onPressed: () {}, child: Text(bDate, style: textStyle1())),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const Main1()),
                );
              },
              child: Text("Main1", style: textStyle1())),
          const Spacer(flex: 4),
        ]),
      ),
    );
  }
}
