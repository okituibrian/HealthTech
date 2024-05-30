class UserDataManager {
  static final UserDataManager _instance = UserDataManager._internal();
  String? name;
  String? email;
  String? phoneNumber;
  String? idNumber;
  //String? location;
  String? avatarSrc;

  factory UserDataManager() {
    return _instance;
  }

  UserDataManager._internal();

  void updateUserData(Map<String, dynamic> data) {

    email = data['email'];
    name = data['name'];
    idNumber = data['idNumber'];
    phoneNumber = data['phoneNumber'];

    //location = data['location'];
    avatarSrc = data['avatarSrc'];
  }

  void clearUserData() {
    name = null;
    email = null;
    phoneNumber = null;
    idNumber = null;
    //location = null;
    avatarSrc = null;
  }

  bool isLoggedIn() {
    return idNumber != null && email != null && avatarSrc != null;
  }
}
