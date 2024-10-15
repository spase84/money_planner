// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../feature/home/data/datasources/datasource.dart' as _i481;
import '../feature/home/data/datasources/remote_datasource.dart' as _i406;
import '../feature/home/data/repositories/remote_repository.dart' as _i520;
import '../feature/home/domain/repositories/repository.dart' as _i926;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i481.Home$DataSource>(() => _i406.HomeRemoteDataSource());
    gh.factory<_i926.HomeRepository>(
        () => _i520.Home$RemoteRepository(gh<_i481.Home$DataSource>()));
    return this;
  }
}
