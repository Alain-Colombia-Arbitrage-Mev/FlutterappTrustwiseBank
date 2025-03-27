import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class TrustwiseAuthUser {
  TrustwiseAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TrustwiseAuthUser> trustwiseAuthUserSubject =
    BehaviorSubject.seeded(TrustwiseAuthUser(loggedIn: false));
Stream<TrustwiseAuthUser> trustwiseAuthUserStream() => trustwiseAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
