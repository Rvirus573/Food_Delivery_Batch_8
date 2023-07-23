import 'package:flutter/material.dart';
import 'package:food_delivery/model/boxes.dart';
import 'package:food_delivery/model/notes_model.dart';
import 'package:get/get.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerAge,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                  hintText: 'Enter Your Age',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerMobile,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                  hintText: 'Enter Your Mobile Number',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final newData = NotesModel(
                    name: controllerName.text,
                    age: controllerAge.text,
                    mobile: controllerMobile.text,
                  );
                  final box = Boxes.getData();
                  box.add(newData);
                  controllerName.clear();
                  controllerAge.clear();
                  controllerMobile.clear();

                  FocusManager.instance.primaryFocus!.unfocus();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Add Message"),
                    ),
                  );
                  //  Get.snackbar("Sucessfull", "Added New Data");
                },
                child: const Text("ADD Data"),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                      color: Colors.cyan[50],
                      child: ValueListenableBuilder<Box<NotesModel>>(
                          valueListenable: Boxes.getData().listenable(),
                          builder: (context, box, _) {
                            var data = box.values.toList().cast<NotesModel>();

                            return ListView.builder(
                                shrinkWrap: true,
                                reverse: true,
                                itemCount: box.length,
                                itemBuilder: (_, index) {
                                  var nameText = data[index].name.toString();
                                  var ageText = data[index].age.toString();
                                  var mobileText =
                                      data[index].mobile.toString();

                                  return Card(
                                    child: ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Name: $nameText"),
                                          Text("Age: $ageText"),
                                        ],
                                      ),
                                      subtitle: Text("Mobile: $mobileText"),
                                      trailing: FittedBox(
                                          child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              editData(data[index], nameText,
                                                  ageText, mobileText);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              //data[index].delete();
                                              delete(data[index]);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  );
                                });
                          }))),
            ],
          ),
        ),
      ),
    );
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }

  Future<void> editData(
      NotesModel notesModel, String name, String age, String mobile) async {
    controllerName.text = name;
    controllerAge.text = age;
    controllerMobile.text = mobile;
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              height: 500,
              width: 500,
              color: Colors.cyan[50],
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Edit Name',
                        hintText: 'Edit Your Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controllerAge,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Edit Age',
                        hintText: 'Edit Your Age',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controllerMobile,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Edit Mobile Number',
                        hintText: 'Edit Mobile Number',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // *! On Press Update

                        notesModel.name = controllerName.text.toString();
                        notesModel.age = controllerAge.text.toString();
                        notesModel.mobile = controllerMobile.text.toString();
                        notesModel.save();
                        controllerName.clear();

                        controllerAge.clear();
                        controllerMobile.clear();
                        FocusManager.instance.primaryFocus!.unfocus();
                        Navigator.pop(context);
                      },
                      child: const Text("Update Data"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
