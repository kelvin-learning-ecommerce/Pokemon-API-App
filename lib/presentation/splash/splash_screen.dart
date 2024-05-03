import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/splash/state/splash_screen_state.dart';
import 'package:pokemon_app/utils/extensions/routes_ext.dart';

import '../../utils/constants/image_path.dart';
import 'bloc/splash_screen_bloc.dart';
import 'event/splash_screen_event.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView(Key key) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
        () => splashScreenBloc?.add(const SplashScreenNextPageEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (BuildContext context, state) {
          if (state is SplashScreenStateSuccess) {
            context.goToLogin();
          }
        },
        child: Center(
          child: Image.asset(pokeapiIc),
        ),
      ),
    );
  }
}
