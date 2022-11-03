import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:intl/intl.dart';

class Todocard extends StatefulWidget {
  final int id;
  final String title;
  bool isChecked;
  final DateTime creationDate;
  final Function? insertFunction; // it will handle the changes in checkbox
  final Function? deleteFunction; // it will handle the delete button

  Todocard(
      {Key? key,
      required this.id,
      required this.title,
      required this.creationDate,
       this.insertFunction,
       this.deleteFunction,
      required this.isChecked})
      : super(key: key);

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo=Todo(id:widget.id ,title: widget.title, creationDate: widget.creationDate, isChecked: widget.isChecked);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          //this will be the checkbox
          Container(
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                //change the value of anothertod's is checked
                anotherTodo.isChecked=value!;
                //insert it to database
              //  widget.insertFunction!(anotherTodo);
              },
            ),
          ),
          //this will be the title and date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  DateFormat('dd MMM yyyy - hh:mm aaa').format(widget.creationDate),
                  style: TextStyle(fontSize: 16, color: Color(0xFF8F8F8F)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
              widget.deleteFunction!(anotherTodo);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
