// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_assignment/config/app_config.dart' as _i3;
import 'package:flutter_assignment/core/injection/register_module.dart' as _i9;
import 'package:flutter_assignment/core/network/dio_client.dart' as _i4;
import 'package:flutter_assignment/features/home/data/repository/home_repository.dart'
    as _i6;
import 'package:flutter_assignment/features/home/domain/controller/i_home_controller.dart'
    as _i7;
import 'package:flutter_assignment/features/home/domain/repository/i_home_repository.dart'
    as _i5;
import 'package:flutter_assignment/features/home/presentation/bloc/home_bloc.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.DioClient>(registerModule.dioClient);
    gh.factory<_i5.IHomeRepository>(
        () => _i6.HomeRepository(gh<_i4.DioClient>()));
    gh.factory<_i7.IHomeController>(
        () => _i7.HomeController(gh<_i5.IHomeRepository>()));
    gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc(gh<_i7.IHomeController>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
