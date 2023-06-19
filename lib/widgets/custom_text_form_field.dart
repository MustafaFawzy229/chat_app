import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.onChanged, this.obsecureText = false});

  String? hintText;
  bool obsecureText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is empty';
        }
      },
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
