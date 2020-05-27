import 'package:http/http.dart' as http;

class Server {
  static Future<http.Response> playerInfo(int pid) {
    var url =
        'https://cricapi.com/api/playerStats?pid=$pid&apikey=A8zoDoPaQgefmB7KunnSuApSgL73';
    Future<http.Response> future = http.get(url);
    return future;
  }
}
