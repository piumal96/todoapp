class Todo{
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  //create the Constructor
  Todo({ this.id, required this.title, required this.creationDate, required this.isChecked});

  //to save data in database we need to convert it to map
  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1:0

    };
  }
  // this function is for debuging only
  @override
  String toString(){
    //TODO impliment to string
  return 'Todo(id:$id,title:$title,creationDate:$creationDate,isCheckd:$isChecked)';
}


}