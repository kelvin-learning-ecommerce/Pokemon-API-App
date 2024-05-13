import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../core/router/navigation_config.dart';
import '../event/login_event.dart';
import '../state/login_state.dart';

var loginBloc =
    navigationService.navigatorKey.currentContext?.read<LoginBloc>();

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final StorageRepository storageRepository;

  LoginBloc() : super(LoginStateInit()) {
    on<CheckGoogleLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      emit(IsGoogleLoggedInState(user != null));
    });

    on<LoginAttemptEvent>((event, emit) async {
      emit(LoginLoadingState());

      if (event.username == "guest" && event.password == "guest") {
        emit(LoginStateSuccess());
      } else {
        emit(LoginStateError());
      }
    });
    on<GoogleLoginAttemptEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
        const List<String> scopes = <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ];

        final GoogleSignInAccount? googleUser = await GoogleSignIn(
          scopes: scopes,
        ).signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        var user = await FirebaseAuth.instance.signInWithCredential(credential);

        emit(LoginStateSuccess(googleUser: user));
      } on Exception catch (e) {
        print('exception->$e');

        emit(LoginStateError(exception: e));
      }
    });
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
