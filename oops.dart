class Student{
  int id;
  String name;
  double salary;
  /*
  Student(int id , String name, double salary){
    this.id = id;
    this.name = name;
    this.salary = salary;
  }*/
  Student(this.id ,this.name , this.salary);
  Student.myNamedCons(int id, String name){
    this.id = id;
    this.name = name;
  }
 /* void display(){
    print("Id is $id Name $name Salary $salary");
  }*/
  @override
  String toString(){
    return "Id is $id Name is $name and Salary is $salary";
  }

}
void main(){
  Student ram = Student(1001,"Ram",9999);
  print(ram is Student);
  print(ram.runtimeType);
  print(ram.runtimeType.runtimeType);
  //Student ram = new Student(1001, "Ram",9999);
  //Student ram = Student.myNamedCons(1001, "Ram");
  print(ram);  // ram.toString()

  //ram.display();
}