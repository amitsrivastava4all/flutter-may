import 'dart:io';
import 'dart:async';
void showMeTheData(data){
  print("Show $data");
}
void printError(err){
  print(err);
}
void main(){
  File file = new File('/Users/amit/Documents/dart-may-code/functional4.dart');
  print("Going to read a file");
  Future future = file.readAsString();
  print("Afteader R $future");
  future.then(showMeTheData).catchError(printError);
  print("I am End");
}