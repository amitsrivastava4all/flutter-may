// Java Style
// int add(int x, int y){
//   return x + y;
// }
// JS Style
add([x=0,y=0]){
  return x + y;
}
void main(){
  int p ; // null  // Null
  p =100; // int
  var result = add();
  result = add(10);
  result = add(10,20)
  //var result = add(100,200);
  print("Result is $result");
  String amount = "Ten Thousand";
  print(amount.toLowerCase());
  var name = "Amit";
  String message = 'ghdfjghjfdhgkhfdj'
  'fhgdsjhgdjkfhgjdfhjkghdfk'
  'fhsdjkfhdskjfhdsjksfhjkdhfskhjsdfhjk'
  'fhdsjkhfgdshfksdhkfdsjhfkh';
  print(message);
  //String name = 'Amit';
  //String name = "Amit";
  String msg = """ Hello 
  How Are You
  I am Good """;
  print(msg);
  double tt = -90.20;
  print("ABs ${tt.abs()}");
  int e ;
  print("E Type is ${e.runtimeType} and Value of e is $e");
  var r ;
  print("R is ${r.runtimeType} Value of r is $r");
  var a = 100; // Implicit Types
  print(" A is ${a.runtimeType}");
  var b = 200;
  var c = a + b;
  // int a = 100;  // Explicit Types
  // int b = 200;
  // int c = a + b;
  print("Hello Dart $c");
}