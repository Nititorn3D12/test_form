// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class FormElementScreen extends StatefulWidget {
  FormElementScreen({Key? key}) : super(key: key);

  @override
  State<FormElementScreen> createState() => _FormElementScreenState();
}

class _FormElementScreenState extends State<FormElementScreen> {
  bool _checkBox1Checked = false;
  String _gender = 'male';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Show Form Elements'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _textFormField(),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
              ),
              _textFormFieldSecure(),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: const Text('Checkbox'),
              ),
              _checkBox(),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text('Radio button'),
              ),
              _radioListTile(),
            ],
          ),
        ));
  }

  Widget _textFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'entry something',
        labelText: 'TextFormField',
        icon: const Icon(Icons.person_add),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 32)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 2)),
      ),
      onChanged: ((value) {
        // TODO : move value into some variable or another
      }),
    );
  }

  Widget _textFormFieldSecure() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      //obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: 'entry something secured',
        labelText: 'TextFormField *',
        icon: const Icon(Icons.key_outlined),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 32)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 2)),
      ),
      onChanged: ((value) {
        // TODO : move value into some variable or another
      }),
    );
  }

  Widget _checkBox() {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child: Checkbox(
            value: _checkBox1Checked,
            activeColor: Colors.redAccent,
            onChanged: (value) {
              setState(() {
                _checkBox1Checked = value!;
              });
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text('Checkbox1 text'),
      ],
    );
  }

  Widget _radioListTile() {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: const Text('Male'),
          value: 'male',
          groupValue: _gender,
          onChanged: (value) {
            setState(() {
              _gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text('Female'),
          value: 'female',
          groupValue: _gender,
          onChanged: (value) {
            setState(() {
              _gender = value.toString();
            });
          },
        ),
      ],
    );
  }
}
