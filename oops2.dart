class Employee{
  int _id;
  String _name;
  double _salary;
  Employee(this._id, this._name);
  void set id(int id){
     this._id = id;
  }
  int get id{
    return this._id;
  }



}
void main(){
  Employee emp = Employee(1010,"Shyam");
  emp._id = 1001;
  emp._name = "Ram";
  emp._salary = 32432;
  print("Id ${emp._id} Name ${emp._name}");

}