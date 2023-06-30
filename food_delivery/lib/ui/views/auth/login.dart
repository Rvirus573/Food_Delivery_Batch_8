import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              TextFormField(decoration: const InputDecoration(hintText: "email",prefixIcon: Icon(Icons.email)),),
              TextFormField(),
            ],
          ),
        ),
      )),
    );
  }
}
