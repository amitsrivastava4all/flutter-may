import 'dart:convert' as converter;

import 'package:http/http.dart' as http;

class Server {
  static getDataFromServer() async {
    var url =
        'https://cricapi.com/api/playerStats?pid=35320&apikey=A8zoDoPaQgefmB7KunnSuApSgL73';
    var response = await http.get(url);
    var map = converter.jsonDecode(response.body);
    return map;
  }
}
