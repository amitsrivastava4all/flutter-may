// Nested function
calc(){
  add(x,y){
    return x + y;
  }
  sub(x,y){
    return x - y;
  }
  //return [add, sub];
  return {"addition":add, "subtract":sub};
}
// void calc(){
// int add(int x , int y){
//   return x + y;
// }
// int sub(int x, int y ){
//   return x - y;
// }
// }
/*
class Calc{
int add(int x , int y){
  return x + y;
}
}
class Customer{
  add(){

  }
}
class Order{
  add(){

  }
}*/
void main(){
  // Map Style Code
  Map<String, Function> map = calc();
  int result = map["addition"](100,200);
  print(result);
  //var map = calc();
  // List style code 
  // List<Function> list = calc();
  // int result= list[0](100,200);
  // print(result);
  // result = list[1] (100,200);
  // print(result);
  // //var list = calc();
}