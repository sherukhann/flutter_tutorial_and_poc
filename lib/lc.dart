import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class LCApp extends StatelessWidget {
  const LCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
          )),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final yourName = TextEditingController();

  final partnerName = TextEditingController();

  int? lovepercentage;
  var loading = false;
  var isError = false;
  var darkMode = false;

  // constructor - called when widger called - used for both stateful and stateless
  _HomePageState() {
    debugPrint(">>>>>>> constructor callled");
    yourName.text = 'sk';
    partnerName.text = 'coding';
  }

  // used for only statefull widget, can be called once, used to regitser lishter, useEffect with empty array
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    debugPrint(">>>>>>> initState callled");
    super.initState();
  }

  // just like useEffect with return funciton, uysed to clean up the code
  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    debugPrint(">>>>>>> disposal callled");
    yourName.dispose();
    partnerName.dispose();
    super.dispose();
  }

  void calculateLove() {
    // check form validation
    if (yourName.text.isEmpty || partnerName.text.isEmpty) {
      setState(() {
        isError = true;
      });
      return;
    }
    // start the loading
    setState(() {
      loading = true;
      isError = false;
    });

    // stop the loading and calculate the percentage
    Timer(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
        lovepercentage = Random().nextInt(100);
      });
    });
  }

  String? validate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  InputDecoration myInputDecorator(text) {
    return InputDecoration(
      hintText: text,
      // focusedBorder: const UnderlineInputBorder(
      //   borderSide:
      //       BorderSide(color: Colors.purple, width: 3),
      // ),
    );
  }

  // state full widget
  @override
  Widget build(BuildContext context) {
    debugPrint(">>>>>>> build callled");
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'my first app',
            style: TextStyle(
              fontSize: 24,
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          // backgroundColor: Colors.green,
        ),
        body: Container(
            color: Colors.white,
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: yourName,
                      validator: validate,
                      decoration: myInputDecorator('Your Name'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: partnerName,
                      validator: validate,
                      decoration: myInputDecorator('Partner Name'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint(yourName.text);
                          debugPrint(partnerName.text);
                          calculateLove();
                        }
                      },
                      icon: const Icon(Icons.favorite),
                      label: const Text(
                        'Calculate Love',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                      ),
                    ),
                    if (loading) const CircularProgressIndicator(),
                    if (lovepercentage != null)
                      Text(
                        '${yourName.text} loves ${partnerName.text} $lovepercentage%',
                        // style: const TextStyle(
                        //   fontSize: 20,
                        // ),
                      ),
                    Switch(
                        value: darkMode,
                        onChanged: (val) {
                          setState(() {
                            darkMode = val;
                          });
                        })
                  ],
                ))));
  }
}
