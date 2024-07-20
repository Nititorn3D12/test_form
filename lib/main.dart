import 'package:flutter/material.dart';
import 'formValidation1.dart';
import 'formValidation2.dart';
import 'formValidation3.dart';
import 'formElements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Form Elements'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: Text('Navigation to another pages!'))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 0, // Shadow scale
            ),
            child: const Text('Open FormElements Page'),
            onPressed: () {
              // go to FormElementPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormElementScreen(),
                ),
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 0, // Shadow scale
            ),
            onPressed: () {
              // TODO: go to FormValidationPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormValidation1Screen(),
                ),
              );
            },
            child: const Text('Go to Form Validation #1'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              elevation: 0, // Shadow scale
            ),
            onPressed: () {
              // TODO: go to FormValidationPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormValidation2Screen(),
                ),
              );
            },
            child: const Text('Go to Form Validation #2'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
              foregroundColor: Colors.black,
              elevation: 0, // Shadow scale
            ),
            onPressed: () {
              // TODO: go to FormValidationPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormValidation3Screen(),
                ),
              );
            },
            child: const Text('Go to Form Validation #3'),
          ),
        ],
      ),
    );
  }
}
