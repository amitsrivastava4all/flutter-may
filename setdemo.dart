void main(){
  int ww ;
  print ("WW is ${ww??0}");
  String name ="Amit";
  print("Welcome Your Name is ${name??''}");
  Set<String> songs = {"Boom Boom","Bang Bang","Boom Boom","Bang Bang"};
   List<String> songs2 = ["Boom Boom","Bang Bang","Boom Boom","Bang Bang"];
   print("SET  Songs are $songs");
   print("LIST Song2 are $songs2");
   songs.add("It's My Life");
   String result = songs.contains("Boom Boom")?"Found":"Not Found";

   print("After Add Song $songs");
   print("Result is $result");
}