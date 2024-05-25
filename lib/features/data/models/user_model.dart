import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required bool isManager, required int userId})
      : super(isManager: isManager, userId: userId);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json["user_id"], isManager: json["is_manager"] == "1");
  }

  Map<String, dynamic> toJson() {
    return {"user_id": userId, "is_manager": isManager ? "1" : "0"};
  }
}
