int add(int x , int y){
  return x +y;
}
add2(x, y){
  return x + y;
}
// Anonymous Function
final add3= (x,y){
  return x + y;
} ;
// Fat Arrow Function
final add4 = (x,y)=> x + y;
void main(){
  var name = "Amit";
  print(name.runtimeType);
  print(name.runtimeType.runtimeType);
  int x = 100;
  print(x.runtimeType);
  print(x.runtimeType.runtimeType);
  print(add(10,20));
  print(add2(10,20));
  print(add3(10,20));
  print(add4(10,20));
}