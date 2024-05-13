import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/presentation/login/state/login_state.dart';
import 'package:pokemon_app/utils/extensions/routes_ext.dart';

import '../../generated/l10n.dart';
import '../../utils/constants/key.dart';
import '../shared/component/app_bar.dart';
import '../shared/component/app_button.dart';
import '../shared/component/app_text_field.dart';
import 'bloc/login_bloc.dart';
import 'event/login_event.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    loginBloc?.add(const CheckGoogleLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                key: usernameFieldKey,
                controller: usernameController,
                labelText: S.of(context).username_label,
                errorMessage: errorMessage,
              ),
              AppTextField(
                key: passwordFieldKey,
                controller: passwordController,
                labelText: S.of(context).password_label,
                isPassword: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              AppButton(
                label: S.of(context).login_title,
                function: () async {
                  loginBloc?.add(LoginAttemptEvent(
                      usernameController.text, passwordController.text));
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              AppButton(
                label: S.of(context).google_login_title,
                function: () async {
                  loginBloc?.add(const GoogleLoginAttemptEvent());
                },
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          );
        }
      },
      listener: (context, state) {
        if (state is LoginStateSuccess) {
          context.goToPokemon();
        } else if (state is LoginStateError) {
        } else if (state is IsGoogleLoggedInState) {
          context.goToPokemon();
        }
      },
      listenWhen: (prevState, currState) =>
          currState is LoginStateSuccess ||
          currState is LoginStateError ||
          currState is IsGoogleLoggedInState ||
          currState is LoginLoadingState,
    );
  }
}
