// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/impl/auth_remote_data_source_impl.dart'
    as _i1060;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../features/auth_presentation/login/cubit/login_view_model.dart'
    as _i656;
import '../../features/auth_presentation/regester/cubit/register_view_model_cubit.dart'
    as _i422;
import '../repository/auth_repository.dart' as _i106;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;

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
    gh.singleton<_i236.ApiManger>(() => _i236.ApiManger());
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i1060.AuthRemoteDataSourceImpl(apiManger: gh<_i236.ApiManger>()));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i656.LoginViewModel>(
        () => _i656.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    gh.factory<_i422.RegisterViewModelCubit>(() => _i422.RegisterViewModelCubit(
        registerUseCase: gh<_i526.RegisterUseCase>()));
    return this;
  }
}
