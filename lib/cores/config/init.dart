import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sipaias_fun_mobile/cores/config/api/init.dart';
import 'package:sipaias_fun_mobile/cores/config/bloc/general_bloc.dart';
import 'package:sipaias_fun_mobile/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:sipaias_fun_mobile/features/auth/data/repository/auth_repositorty_impl.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/datasource/auth_datasource.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/usecases/user_sign_in.dart';
import 'package:sipaias_fun_mobile/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final Dio apiClient = ApiClient().init();

  serviceLocator.registerLazySingleton<Dio>(() => apiClient);

  serviceLocator.registerLazySingleton<GeneralBloc>(() => GeneralBloc());
}

void _initAuth() {
  serviceLocator.registerFactory<AuthDatasource>(
    () => AuthDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<UserSignIn>(
    () => UserSignIn(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userSignIn: serviceLocator(),
    ),
  );
}
