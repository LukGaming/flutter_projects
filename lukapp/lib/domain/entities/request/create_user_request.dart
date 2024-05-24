class CreateUserRequest {
  final String name;
  final String email;
  final String password;

  CreateUserRequest({
    required this.name,
    required this.email,
    required this.password,
  });
}
