abstract class UserEntity{
  final int userId;
  final bool isManager;
  UserEntity({required this.userId, required this.isManager});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserEntity &&
              runtimeType == other.runtimeType &&
              userId == other.userId &&
              isManager == other.isManager;

  @override
  int get hashCode => userId.hashCode ^ isManager.hashCode;

  @override
  String toString() {
    return 'UserEntity{userId: $userId, isManager: $isManager}';
  }
}