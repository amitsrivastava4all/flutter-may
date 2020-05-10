void main(){
  String songName = "bang bang";
  int e = 10;
  bool r = true;
  var myList2 = [90,10,99,44,33]; // JS Style
  List<int> myList3 = [99,10,44,33];
  List<dynamic> myList = [10,true, "Hello",90.20]; // Java Style
  List<String> list = ["Boom Boom","Bang Bang","It's My Life","123ABC"];
  list.add("Dangerous");
  print("Loop DEMO.................");
  // Old Style
  /*for(int i = 0; i<list.length; i++){
    print(list[i]);
  }*/
  // New Style
  // Functional Style 
  //list.forEach(logicToRun);
  list.forEach((currentSong)=>print("::Song is $currentSong"));
  print("Loop Ends......");
  
  print("Songs are $list");

}
void logicToRun(String currentSong){
  print("Song is $currentSong");
}