class Task {
  String id;
  String name;
  String desc;
  String date;
  bool isMarked = false;
  bool isAdded = false;
  bool isEdit = false;
  Task(this.name, this.desc);
  Map<String, dynamic> convertToMap() {
    Map<String, dynamic> map = {
      "name": this.name,
      "descr": this.desc,
      "date": this.date
    };
    return map;
  }
}
