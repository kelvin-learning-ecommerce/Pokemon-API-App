import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/presentation/login/state/login_state.dart';
import 'package:pokemon_app/utils/extensions/routes_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../generated/l10n.dart';
import '../shared/component/app_bar.dart';
import '../shared/component/app_button.dart';
import '../shared/component/app_text_field.dart';
import 'bloc/login_bloc.dart';
import 'component/google_signin.dart';
import 'event/login_event.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: S.of(context).login_title,
      ),
      body: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (prevState, currState) => currState is LoginStateSuccess || currState is LoginStateError,
      listener: (context, state) {
        if (state is LoginStateSuccess) {
          context.goToPokemon();
        } else if (state is LoginStateError) {
          setState(() {
            // errorMessage = state.error == LoginError.userNotFound
            //     ? S.of(context).user_not_found_error
            //     : S.of(context).check_login_data_error;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            key: const Key("Login-CustomTextField-Username"),
            controller: usernameController,
            labelText: S.of(context).username_label,
            errorMessage: errorMessage,
          ),
          AppTextField(
            key: const Key("Login-CustomTextField-Password"),
            controller: passwordController,
            labelText: S.of(context).password_label,
            isPassword: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppButton(
            label: S.of(context).login_title,
            function: () {
              setState(() {
                errorMessage = null;
              });

              loginBloc?.add(LoginAttemptEvent(usernameController.text, passwordController.text));
            },
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}


class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  ValueNotifier userCredential = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Google SignIn Screen')),
        body: ValueListenableBuilder(
            valueListenable: userCredential,
            builder: (context, value, child) {
              return (userCredential.value == '' ||
                  userCredential.value == null)
                  ? Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset(
                      'assets/images/google_icon.png',
                    ),
                    onPressed: () async {
                      userCredential.value = await signInWithGoogle();
                      if (userCredential.value != null)
                        print(userCredential.value.user!.email);
                    },
                  ),
                ),
              )
                  : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.5, color: Colors.black54)),
                      child: Image.network(
                          userCredential.value.user!.photoURL.toString()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(userCredential.value.user!.displayName
                        .toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(userCredential.value.user!.email.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          bool result = await signOutFromGoogle();
                          if (result) userCredential.value = '';
                        },
                        child: const Text('Logout'))
                  ],
                ),
              );
            }));
  }
}
