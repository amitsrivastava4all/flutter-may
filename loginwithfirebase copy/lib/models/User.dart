class User {
  String userid;
  String password;
  User(this.userid, this.password);
  convertToMap() {
    Map<String, dynamic> map = {
      'userid': this.userid,
      'password': this.password
    };
    return map;
  }
}
