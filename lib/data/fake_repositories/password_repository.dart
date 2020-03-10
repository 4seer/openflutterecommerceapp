class PasswordRepository {
  Future<String> getCurrentPassword() async {
    return 'adminadmin';
  }

  Future<void> changePassword(String password) async {
    await Future.delayed(Duration(seconds: 4));
  }
}
