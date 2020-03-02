class PasswordRepository {
  Future<String> getCurrentPassword() async {
    return 'adminadmin';
  }

  Future<void> changePassword(String password) async {
    Future.delayed(Duration(seconds: 4));
  }
}
