// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokemon_app/core/di/app_module.dart' as _i13;
import 'package:pokemon_app/core/router/navigation_config.dart' as _i6;
import 'package:pokemon_app/data/datasource/pokemon_list_datasource.dart'
    as _i10;
import 'package:pokemon_app/data/repository/pokemon_repository.dart' as _i11;
import 'package:pokemon_app/domain/repository/pokemon_repository_impl.dart'
    as _i12;
import 'package:pokemon_app/presentation/login/bloc/login_bloc.dart' as _i5;
import 'package:pokemon_app/presentation/pokemon/bloc/pokemon_bloc.dart' as _i7;
import 'package:pokemon_app/presentation/pokemondetail/bloc/pokemon_detail_bloc.dart'
    as _i8;
import 'package:pokemon_app/presentation/splash/bloc/splash_screen_bloc.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dio);
    gh.lazySingleton<_i4.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.factory<_i5.LoginBloc>(() => _i5.LoginBloc());
    gh.factory<_i6.NavigationService>(() => _i6.NavigationService());
    gh.factory<_i7.PokemonBloc>(() => _i7.PokemonBloc());
    gh.factory<_i8.PokemonDetailBloc>(() => _i8.PokemonDetailBloc());
    gh.factory<_i9.SplashScreenBloc>(() => _i9.SplashScreenBloc());
    gh.factory<_i10.ApiDataSource>(
        () => _i10.ApiDataSourceImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i11.PokemonRepository>(() =>
        _i12.PokemonRepositoryImpl(baseService: gh<_i10.ApiDataSource>()));
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}
