class Customer {
  String _name;
  String _phone;
  String _email;
  String _course;
  List<String> _hobbies = [];
  String _gender;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get phone => _phone;

  List<String> get hobbies => _hobbies;

  set hobbies(List<String> value) {
    _hobbies = value;
  }

  String get course => _course;

  set course(String value) {
    _course = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  set phone(String value) {
    _phone = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  @override
  String toString() {
    return 'Customer{_name: $_name, _phone: $_phone, _email: $_email, _course: $_course, _hobbies: $_hobbies, _gender: $_gender}';
  }
}
