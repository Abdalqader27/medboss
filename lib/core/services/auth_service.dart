import 'dart:async';

class AuthService {
  final StreamController<bool> _onAuthStateChange =
      StreamController.broadcast();

  Stream<bool> get onAuthStateChange => _onAuthStateChange.stream;

  Future<bool> toAuthorized() async {
    _onAuthStateChange.add(true);
    return true;
  }

  void toUnAuthorized() {
    _onAuthStateChange.add(false);
  }
}
