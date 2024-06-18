import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity {
  @Id(assignable: true)
  int id;
  String name;
  String email;
  String? profileImageUrl;
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });
}
