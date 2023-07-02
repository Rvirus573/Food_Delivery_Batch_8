import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/route/routes.dart';
import 'package:food_delivery/ui/widget/custom_from_field.dart';
import 'package:food_delivery/ui/widget/custombutton.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _userNametroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final ImagePicker picker = ImagePicker();

  final _formkey = GlobalKey<FormState>();

  XFile? image;

  pickImageFromGrallery() async {
    image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {});
    // print(image!.name);
    // print(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a New Account',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 179, 24, 24)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child:

                      // CircleAvatar(
                      //   radius: 50,
                      //   child: Image.file(
                      //     File(image!.path),
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                    child: image == null
                        ? Center(
                            child: IconButton(
                                onPressed: () {
                                  pickImageFromGrallery();
                                },
                                icon: const Icon(Icons.camera)),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(image!.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customFormField('User Name', Icons.people_alt_rounded,
                    _userNametroller, TextInputType.text, (val) {
                  if (val!.isEmpty) {
                    return 'this field is empty';
                  } else if (val.length < 4) {
                    return 'field is too small';
                  }
                }),
                customFormField('email', Icons.mark_email_read_rounded,
                    _emailcontroller, TextInputType.emailAddress, (val) {
                  if (val.isEmpty) {
                    return 'this field cant\'t be empty';
                  } else if (!EmailValidator.validate(val)) {
                    return 'enter a valid email address';
                  }
                }),
                customFormField('password', Icons.password_rounded,
                    _passwordcontroller, TextInputType.name, (val) {
                  if (val.isEmpty) {
                    return 'this field cant\'t be empty';
                  } else if (val.length < 3) {
                    return 'password must be minimum 3 characters';
                  } else if (val.length > 8) {
                    return 'password not more 8 characters';
                  }
                }, obsecastText: true),
                const SizedBox(
                  height: 10,
                ),
                customButton('Sign Up', () {
                  if (_formkey.currentState!.validate()) {
                    if (image == null) {
                      Get.snackbar('Warning!', 'Please upload Image first');
                    } else {
                      Get.toNamed(login);
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text("Please Log in"),
                      // ));
                      Get.snackbar('Successful', 'Please Log in',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  } else {
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //   content: Text("Failed"),
                    // ));
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Allready have an account? ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: 'Signin',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
