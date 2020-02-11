import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      _saveCredentials(event.user.email, event.user.password);
      yield Authenticated(event.user);
    } else if (event is LoggedOut) {
      _clearCredentials();
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final credentials = await _getSavedCredentials();
      print("credentials loaded $credentials");
      if (credentials == null) {
        yield Unauthenticated();
      } else {
        //TODO try to login with login repository
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Future<MapEntry<String, String>> _getSavedCredentials() async {
    //TODO get credentials from the secure storage
    return null;
  }

  void _saveCredentials(String email, String password) {
    //TODO save to a secure storage
  }

  void _clearCredentials() {
    //TODO clear secure storage
  }
}
