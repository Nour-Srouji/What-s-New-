
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {

  final void Function(bool isChecked) onChanged;

  const MyCheckBox({Key? key,required this.onChanged}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value!;
        });
        widget.onChanged(_value);
      },
    );
  }
}
