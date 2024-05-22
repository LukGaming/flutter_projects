class PeopleModel {
  PeopleModel({
    required this.id,
    required this.name,
    required this.instituition,
    required this.picture,
    required this.bio,
    required this.role,
  });

  final int id;
  final String name;
  final String instituition;
  final String? picture;
  final String? bio;
  final String role;

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      id: json['id'],
      name: json['name'] ?? '',
      instituition: json['institution'] ?? '',
      picture: json['picture'],
      bio: json['bio']['pt-br'],
      role: json['role']['label']['pt-br'] ?? '',
    );
  }



  @override
  String toString() {
    return 'PeopleModel(id: $id, name: $name, instituition: $instituition, picture: $picture, bio: $bio, role: $role)';
  }
}
