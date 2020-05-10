// int add(int x, int y){
//   return x + y;
// }
// add(x,y){
//   return x + y;
// }
// final add = (x,y){
//   return x + y;
// };
//final add = (x,y)=>x+y;
// int add ([int x=0 , int y=0]){
//   return x + y;
// }
// int add ([int x=0 , int y=0, int z = 0, int m = 0, int n = 0]){
//   return x + y + z + m + n;
// }
int add ({int x=0 , int y=0, int z = 0, int m = 0, int n = 0}){
  print("M is $m and Z is $z and X is $x and Y is $y");
  return x + y + z + m + n;
}
void main(){
  int result = add(m:1000, z:2000);
  print("Result is $result");
}