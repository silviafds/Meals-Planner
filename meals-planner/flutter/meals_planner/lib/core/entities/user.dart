class User {
  String? _name;
  String? _token;

  static final User _instance = User._();

  factory User() {
    return _instance;
  }

  User._();

  static User get instance {
    return _instance;
  }

  String? get userToken => _token;
  String? get userName => _name;

  void updateName(String? name) {
    _name = name;
  }

  void updateToken(String? token) {
    _token = token;
  }
}
