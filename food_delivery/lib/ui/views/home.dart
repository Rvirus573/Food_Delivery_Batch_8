import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController todocontroller = TextEditingController();
  final TextEditingController todoAgecontroller = TextEditingController();
  final TextEditingController updateController = TextEditingController();
  Box? todo, todoAge;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todo = Hive.box('todo');
    todoAge = Hive.box("todoage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local DB'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: todocontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.green),
                  hintText: 'Enter Your Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: todoAgecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.green),
                hintText: 'Enter Your Age',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                  onPressed: () async {
                    final userInput = todocontroller.text;
                    final userInputAge = todoAgecontroller.text;
                    await todo!.add(userInput);
                    await todoAge!.add(userInputAge).then((value) =>
                        Get.snackbar('Success', 'New Todo Added',
                            snackPosition: SnackPosition.BOTTOM));

                    // setState(() {});
                  },
                  child: const Text('Write a new todo')),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box('todo').listenable(),
                builder: (context, value, child) {
                  return ListView.builder(
                    reverse: true,
                    itemCount: todo!.keys.toList().length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 5,
                        shadowColor: Colors.pink[300],
                        child: ListTile(
                          title: Text(todo!.getAt(index)),
                          subtitle: Text(todoAge!.getAt(index)),
                          trailing: FittedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (_) {
                                          return Dialog(
                                            child: Container(
                                              height: 300,
                                              color: Color.fromARGB(
                                                  255, 222, 192, 192),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 20),
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: 'Name',
                                                        labelText: 'hasan',
                                                      ),
                                                      controller:
                                                          updateController,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          final updateInput =
                                                              updateController
                                                                  .text;
                                                          todo!
                                                              .putAt(index,
                                                                  updateInput)
                                                              .then((value) =>
                                                                  Get.back())
                                                              .then((value) =>
                                                                  Get.snackbar(
                                                                      'Success',
                                                                      'New Todo Added'));
                                                          updateController
                                                              .clear();
                                                        },
                                                        child: const Text(
                                                            'Update Your Text')),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.update,
                                    color: Colors.green,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await todo!.deleteAt(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
