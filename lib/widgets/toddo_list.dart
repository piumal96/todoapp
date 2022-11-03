import 'package:flutter/material.dart';
import 'package:todoapp/model/db.model.dart';
import 'package:todoapp/widgets/todo_card.dart';

class Todolist extends StatelessWidget {
  //create an object of database connection
  final Function insertFunction;
  final Function deleteFunction;
  final db = DatabaseConnect();
  Todolist(
      {required this.insertFunction, required this.deleteFunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data =
              snapshot.data; // this is the data we have to show.(list of todo)
          var datalength = data!.length;

          return datalength == 0
              ? Center(
                  child: Text("No data found"),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => Todocard(
                      id: data[i].id,
                      title: data[i].title,
                      creationDate: data[i].creationDate,
                      insertFunction: insertFunction,
                      deleteFunction: deleteFunction,
                      isChecked: data[i].isChecked),
                );
        },
      ),
    );
  }
}
