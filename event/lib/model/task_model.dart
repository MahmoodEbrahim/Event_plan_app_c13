class TaskModel{
  String id;
  String title;
  String desc;
  bool isDone;
  String category;
  int date;

  TaskModel(
  {
    this.id='',
    required this.category,
    required this.desc,
    required this.isDone,
    required this.date,
    required this.title,
}
      );
  TaskModel.fromJson(Map<String,dynamic> json):this(
    id: json['id'],
    category: json['category'],
    desc: json['desc'],
    isDone: json['isDone'],
    date: json['date'],
    title: json['title'],


  );
  Map<String,dynamic> toJson (){
    return{
      "id": id,
      "category": category,
      'desc': desc,
      'isDone': isDone,
      'date': date,
      'title': title,



    };
  }

}