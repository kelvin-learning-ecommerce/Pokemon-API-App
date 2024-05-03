import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/features/login/event/login_event.dart';
import 'package:pokemon_app/features/login/state/login_state.dart';

import '../../../core/router/navigation_config.dart';

var loginBloc = navigationService.navigatorKey.currentContext?.read<LoginBloc>();

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final StorageRepository storageRepository;

  LoginBloc() : super(LoginStateInit()) {
    // on<SplashScreenNextPageEvent>((event, emit) async {
    //   emit(SplashScreenStateInit());
    //   emit(SplashScreenStateSuccess());
    // });
  }
}