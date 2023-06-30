import 'User.dart';

class UserStored {
  final String userId;
  final String pfp;

  UserStored({required this.userId, required this.pfp});

  factory UserStored.fromUser(User user) {
    return UserStored(
      userId: user.userId,
      pfp: user.pfp,
    );
  }
}
