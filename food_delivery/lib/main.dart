import 'package:flutter/material.dart';
import 'package:food_delivery/model/notes_model.dart';
import 'package:food_delivery/ui/route/routes.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox<NotesModel>('data_box');
  Hive.registerAdapter<NotesModel>(NotesModelAdapter());

  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
      
        primarySwatch: Colors.blue,
      ),
      initialRoute: splash,
      getPages: getpages,
      // routes: {
      //   '/login': (context) => const Login(),
      // },
    );
  }
}
