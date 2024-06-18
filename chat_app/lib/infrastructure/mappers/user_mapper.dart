import 'package:chat_app/infrastructure/entities/user_entity.dart';
import 'package:chat_app/domains/models/user.dart';

class UserMapper {
  static User toUser(UserEntity userEntity) {
    return User(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      profileImageUrl: userEntity.profileImageUrl,
    );
  }

  static UserEntity toEntity(User user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      email: user.email,
      profileImageUrl: user.profileImageUrl,
    );
  }
}
