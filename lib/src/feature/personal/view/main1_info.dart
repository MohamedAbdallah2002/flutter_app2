/*
import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/core/widgets/custom_text_form.dart';
import 'package:flutter_app2/src/feature/detail/view/details.dart';

class Main1 extends StatefulWidget {
  const Main1({super.key});

  @override
  State<Main1> createState() => _DetailsState();
}

class _DetailsState extends State<Main1> {
  TextEditingController name2 = TextEditingController();
  TextEditingController dTime = TextEditingController();
  
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  void initState() {
    super.initState();

    name2.addListener(
      () {
        setState(() {});
      },
    );
    dTime.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "Main1"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
              child: Column(children: [
            CustomTextForm(
              
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Name must contain only letters and spaces';
                }
                return null;
              },
              controller: name2,
              label: const Text("Name"),
              hint: "Enter Your Name",
              suffixIcon: IconButton(
                  onPressed: () {
                    name2.clear();
                  },
                  icon: const Icon(Icons.clear)),
              prefix: const Icon(Icons.person),
              obsc: false,
              txtInputType: TextInputType.text,
            ),
            CustomTextForm(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a date';
                }
                try {
                  final parsedDate = DateTime.parse(value);

                  if (parsedDate.isBefore(DateTime(1000))) {
                    return 'Date cannot be before the year 1000';
                  }
                } catch (e) {
                  return 'Invalid date format. Use YYYY-MM-DD';
                }
                return null;
              },
              controller: dTime,
              label: const Text("Date Birth"),
              hint: "Enter Your Date Birth",
              suffixIcon: IconButton(
                  onPressed: () {
                    dTime.clear();
                  },
                  icon: const Icon(Icons.clear)),
              prefix: const Icon(Icons.date_range),
              obsc: false,
              txtInputType: TextInputType.datetime,
            ),
            Text("Name : ${name2.text}"),
            Text("Date : ${dTime.text}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Details(name1: name2.text, bDate: calcYears().text)),
                  );
                },
                child: Text("InfoDetails", style: textStyle1())),
          ])),
        ),
      ),
    );
  }
}
int calcYears(){

  DateTime currentDate=DateTime.now();
  DateTime dateTime=DateTime(parsedDate);
  Duration difference=currentDate.difference(dateTime);
  int years=(difference.inDays/356).floor();
  
  return years;
}*/


import 'package:flutter/material.dart';
import 'package:flutter_app2/src/core/style_app/app_bar.dart';
import 'package:flutter_app2/src/core/style_app/style_text.dart';
import 'package:flutter_app2/src/core/widgets/custom_text_form.dart';
import 'package:flutter_app2/src/feature/detail/view/details.dart';

class Main1 extends StatefulWidget {
  const Main1({super.key});

  @override
  State<Main1> createState() => _Main1State();
}

class _Main1State extends State<Main1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    nameController.addListener(() {
      setState(() {});
    });
    dateController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyApp(text: "Main1"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return 'Name must contain only letters and spaces';
                    }
                    return null;
                  },
                  controller: nameController,
                  label: const Text("Name"),
                  hint: "Enter Your Name",
                  suffixIcon: IconButton(
                    onPressed: () {
                      nameController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  prefix: const Icon(Icons.person),
                  obsc: false,
                  txtInputType: TextInputType.text,
                ),
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    try {
                      final parsedDate = DateTime.parse(value);
                      if (parsedDate.isBefore(DateTime(1000))) {
                        return 'Date cannot be before the year 1000';
                      }
                    } catch (e) {
                      return 'Invalid date format. Use YYYY-MM-DD';
                    }
                    return null;
                  },
                  controller: dateController,
                  label: const Text("Date of Birth"),
                  hint: "Enter Your Date of Birth",
                  suffixIcon: IconButton(
                    onPressed: () {
                      dateController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  prefix: const Icon(Icons.date_range),
                  obsc: false,
                  txtInputType: TextInputType.datetime,
                ),
                Text("Name: ${nameController.text}"),
                Text("Date: ${dateController.text}"),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            name1: nameController.text,
                            bDate: calcYears(dateController.text).toString(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("InfoDetails", style: textStyle1()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int calcYears(String date) {
    try {
      DateTime birthDate = DateTime.parse(date);
      DateTime currentDate = DateTime.now();
      Duration difference = currentDate.difference(birthDate);
      return (difference.inDays / 365).floor();
    } catch (e) {
      return 0; 
    }
  }
}

 