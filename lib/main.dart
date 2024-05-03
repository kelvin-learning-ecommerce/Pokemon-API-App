import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_app/presentation/locale/bloc/locale_bloc.dart';
import 'package:pokemon_app/presentation/locale/states/locale_state.dart';
import 'package:pokemon_app/presentation/splash/splash_screen.dart';

import 'core/di/di_locator.dart';
import 'core/router/navigation_config.dart';
import 'core/router/provider_list.dart';
import 'core/router/routes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providerList,
        child: ScreenUtilInit(
            minTextAdapt: true,
            builder: (BuildContext context, Widget? child) => BlocBuilder<LocaleBloc, LocaleState>(
              buildWhen: (prev, state) => state is LocaleStateLoading || state is LocaleStateChangeLocale,
              builder: (context, state) {
                var countryCode = 'en';
                if (state is LocaleStateChangeLocale) {
                  countryCode = state.locale?.countryCode ?? "en";
                }

                return MaterialApp(
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: Locale(
                    countryCode,
                  ),
                  // title: Env.data.title,
                  navigatorKey: navigationService.navigatorKey,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  onGenerateRoute: initRouter,
                  home: const SplashScreenView(),
                );
              },
            )));
  }
}

