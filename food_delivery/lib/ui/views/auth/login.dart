import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/route/routes.dart';
import 'package:food_delivery/ui/widget/custom_from_field.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),

        // scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              customFormField("email", Icons.mail_lock_outlined,
                  _emailController, TextInputType.emailAddress, (val) {
                if (val.isEmpty) {
                  return 'this field cant\'t be empty';
                }
                // if (!val.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+'))) {
                //   return 'enter a valid email address';
                // }

                else if (!EmailValidator.validate(val)) {
                  return 'enter a valid email address';
                }
              }),
              const SizedBox(
                height: 20,
              ),
              customFormField("Password", Icons.password_rounded,
                  _passwordController, TextInputType.text, (val) {
                if (val.isEmpty) {
                  return 'this field cant\'t be empty';
                } else if (val.length < 3) {
                  return 'password must be minimum 3 characters';
                } else if (val.length > 8) {
                  return 'password not more 8 characters';
                }
              }, obsecastText: true),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                          overlayColor:
                              const MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Get.toNamed(home);
                        }
                      },
                      child: const Text("Login")),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(signup),
                      text: 'Create Now ! ',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
