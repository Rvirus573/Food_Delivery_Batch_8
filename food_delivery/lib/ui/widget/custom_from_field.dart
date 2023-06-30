import 'package:flutter/material.dart';

Widget customFormField(hint, prifixIcon, controller, keyboardtype, validator,
    {obsecastText = false}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardtype,
    obscureText: obsecastText,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(prifixIcon),
    ),
    validator: validator,
  );
}
