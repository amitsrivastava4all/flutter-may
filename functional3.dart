// Call Back (Function pass as an argument to another function)
void loop(int n , Function function){
for(int i = 1; i<=n ; i++){
  print(function(i));
}
}
int table(int count){
  return 5 * count;
}
int cube(int num)
{
return num * num * num;
} 
  void main(){
  loop(10,cube);
  loop(10,table);
}