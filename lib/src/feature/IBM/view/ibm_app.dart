// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/core/widgets/custom_text_form.dart';

class IbmApp extends StatefulWidget {
  const IbmApp({super.key});

  @override
  State<IbmApp> createState() => _IbmAppState();
}

class _IbmAppState extends State<IbmApp> {
  double massHuman = 0;
  TextEditingController wPerson = TextEditingController();
  TextEditingController hPerson = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    wPerson.addListener(() {
      setState(() {});
    });
    hPerson.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    wPerson.dispose();
    hPerson.dispose();
    super.dispose();
  }

  void calculateMass() {
    if (formkey.currentState?.validate() ?? false) {
      final weight = double.tryParse(wPerson.text);
      final height = double.tryParse(hPerson.text)! / 100; 
      if (weight != null && height != null && height > 0) {
        setState(() {
          massHuman = weight / (height * height);
        });
      }
    }
  }
String getShape(double massHuman) {
    if (massHuman < 18.5) {
      return "Skinny";
    } else if (massHuman >= 18.5 && massHuman < 24.9) {
      return "Normal";
    } else if (massHuman >= 25 && massHuman < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "IBM"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    final weight = double.tryParse(value);
                    if (weight == null) {
                      return 'Please enter a valid number';
                    }
                    if (weight <= 0) {
                      return 'Weight must be greater than 0';
                    }
                    if (weight > 500) {
                      return 'Weight must be less than or equal to 500 kg';
                    }
                    return null;
                  },
                  controller: wPerson,
                  suffixIcon: IconButton(
                    onPressed: () {
                      wPerson.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  prefix: const Icon(Icons.line_weight_rounded),
                  txtInputType: TextInputType.number,
                  label: const Text("Weight"),
                  hint: "Enter Your Weight",
                  obsc: false,
                ),
                CustomTextForm(
                  label: const Text("Height"),
                  hint: "Enter Your Height",
                  obsc: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    final height = double.tryParse(value);
                    if (height == null) {
                      return 'Please enter a valid number';
                    }
                    if (height < 50) {
                      return 'Height must be at least 50 cm';
                    }
                    if (height > 300) {
                      return 'Height must be less than or equal to 300 cm';
                    }
                    return null;
                  },
                  controller: hPerson,
                  suffixIcon: IconButton(
                    onPressed: () {
                      hPerson.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  prefix: const Icon(Icons.height),
                  txtInputType: TextInputType.number,
                ),
                Text(
                  'Mass: ${massHuman.toStringAsFixed(2)} kg/m²', 
                  style: textStyle1(),
                ), 
                SizedBox(height: 10,),
                 Text(
                  'Body Condition : ${getShape(massHuman)}', 
                  style: textStyle1(),
                ),
                ElevatedButton(
                  onPressed: calculateMass,
                  child:  Text("Calc Mass",style: textStyle1(),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}