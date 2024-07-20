// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// TODO: import form_field_validator library
import 'package:form_field_validator/form_field_validator.dart';

class FormValidation3Screen extends StatefulWidget {
  const FormValidation3Screen({Key? key}) : super(key: key);

  @override
  State<FormValidation3Screen> createState() => _FormValidation3ScreenState();
}

class _FormValidation3ScreenState extends State<FormValidation3Screen> {
  double num1 = 0, num2 = 0, result = 0;
  final _formKey = GlobalKey<FormState>();

  Future<dynamic> _showMessageDialog(BuildContext context, String msg) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text(
                'Result',
                style: TextStyle(fontSize: 16),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(msg),
                  ],
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ]);
        });
  }

  void doProcess() {
    // TODO: do something to update state of result for showing correctly
    result = num1 + num2;
    _showMessageDialog(context, '$num1 + $num2 = $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validator #3'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(22, 20, 20, 0),
              alignment: Alignment.topLeft,
              child: const Text('Number #1'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Number #1',
                  hintText: 'input number for sum',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  num1 = double.parse(value);
                },
                // validator:
                // TODO: add validator from library
                // - using RequiredValidator
                // - using PatternValidator
                validator: MultiValidator([
                  RequiredValidator(errorText:"กรุณากรอกข้อมูล"),
                  PatternValidator("^[0-9]", errorText: "กรุณาข้อมูลให้ถูกต้อง")
                ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(22, 20, 20, 0),
              alignment: Alignment.topLeft,
              child: const Text('Number #2'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Number #2',
                  hintText: 'input number for sum',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  num2 = double.parse(value);
                  //Do something with this value
                },
                // validator:
                // TODO: add validator from library
                // - using RequiredValidator
                // - using PatternValidator
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          doProcess();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                'Result: $result',
                style: const TextStyle(fontSize: 30, color: Colors.deepPurple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
