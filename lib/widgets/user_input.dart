import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class UserInput extends StatelessWidget {
  var textController=TextEditingController();
  final Function insertFunction;

  UserInput({Key? key, required this.insertFunction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: Color(0xFFDAB5FF),
      child: Row(
        children: [
          //This will be the input box
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'add new todo',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
           SizedBox(
            width: 10,
          ),
          //this will be the button
          GestureDetector(
            onTap: () {
              var myTodo= Todo( title: textController.text, creationDate: DateTime.now(), isChecked: false);
              insertFunction(myTodo);
            },
            child: Container(

              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: const Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
            ),
          )
        ],
      ),
    );
  }
}
