class Person{
  int id;
  String name;
  String address;
  Person(this.id , this.name, this.address);
  String toString(){
    return "Id is $id Name is $name Address is $address";
  }
}
class User extends Person{
  String email;
  User(this.email):super(1001, "Amit",'Delhi');
  String toString(){
    return "Email is $email ${super.toString()}";
  }
}
void main(){
  User user = User("amit@yahoo.com");
  print(user); // user.toString();
}