class UserParams {
  final String username;
  final String password;
  final bool isManager;

  UserParams(
      {required this.username,
      required this.password,
      required this.isManager});

  Map<String, String> toJson() {
    return {
      "username": username,
      "password": password,
      "is_manager": isManager ? "1" : "0"
    };
  }

  @override
  String toString() {
    return 'UserParams{username: $username, password: $password, isManager: $isManager}';
  }
}
