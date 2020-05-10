void main(){
  var a = 100;
  int w = 100;
  //final List list = [10,20,30,40];
  final List list = new List();
  list[0]=1000;
  //list = [1000,2000,3000]; // error
  print("List is $list");
   //const StringBuffer sb = new StringBuffer();
   final StringBuffer sb = new StringBuffer();
   sb.write("Hello How r u ");
   print(sb);
   String s ="Amit";
    s =  s + " Srivastava";
  final MAX_AGE = 100;
  //const MAX_AGE = 100;  // Compile Time Constant
  //MAX_AGE ++;
  //MAX_AGE = 200;
}