import 'package:flutter/material.dart';
import 'package:todoapp/Screens/home_page.dart';
import 'package:todoapp/model/db.model.dart';
import 'package:todoapp/model/todo_model.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  var db= DatabaseConnect();
  //insert sample todo
  await db.insertTodo(Todo(id: 1, title: 'This is the Sample', creationDate: DateTime.now(), isChecked: true, ));
  print(await db.getTodo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
