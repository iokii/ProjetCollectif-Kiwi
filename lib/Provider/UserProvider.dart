import 'package:flutter/foundation.dart';
import '../Models/UserStored.dart';

class UserProvider extends ChangeNotifier {
  UserStored _user = UserStored(userId: '', pfp: '');

  UserStored get user => _user;

  void setUser(UserStored user) {
    _user = user;
    notifyListeners();
  }
}
