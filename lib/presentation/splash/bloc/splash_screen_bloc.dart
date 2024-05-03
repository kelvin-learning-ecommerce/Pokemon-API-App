import 'package:injectable/injectable.dart';

import '../../../core/router/navigation_config.dart';
import '../event/splash_screen_event.dart';
import '../state/splash_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var splashScreenBloc = navigationService.navigatorKey.currentContext?.read<SplashScreenBloc>();

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  // final StorageRepository storageRepository;

  SplashScreenBloc() : super(SplashScreenStateInit()) {
    on<SplashScreenNextPageEvent>((event, emit) async {
      emit(SplashScreenStateInit());
      emit(SplashScreenStateSuccess());
    });
  }
}