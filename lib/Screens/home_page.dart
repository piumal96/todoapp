
import 'package:flutter/material.dart';
import 'package:todoapp/model/db.model.dart';
import 'package:todoapp/widgets/toddo_list.dart';
import 'package:todoapp/widgets/todo_card.dart';
import 'package:todoapp/widgets/user_input.dart';

import '../model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  //we have to create our function here,where the two widgets can communicate
  //create a database object so we can access database function
  var db=DatabaseConnect();

  //function to add
  void addItem(Todo todo)async {
    await db.insertTodo(todo);
    setState(() {

    });
  }
  //function to delete
  void deleteItem(Todo todo)async{
    await db.deleteTodo(todo);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Todolist(insertFunction: addItem,deleteFunction: deleteItem,),
          UserInput(insertFunction: addItem,),
          SizedBox(height: 5,)

        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Simple Todo APP"),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print("Taped");
        },
        child: Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        Icon(Icons.person),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
