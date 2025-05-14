class SignUpRequest {
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;

  SignUpRequest({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
  };
}
