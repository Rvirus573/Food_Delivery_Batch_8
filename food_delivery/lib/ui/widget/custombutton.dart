import 'package:flutter/material.dart';

Widget customButton(title, ontab) {
  return InkWell(
      onTap: ontab,
splashColor: Colors.white,
borderRadius: BorderRadius.circular(10),
    child: Ink(
      height: 40,
      decoration: BoxDecoration(color: Colors.pink[400],
      borderRadius: BorderRadius.circular(10),
      
      ),
        
  child: Center(
    child: Text(title),
    ),
  
    ),
  );
}