// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/accounts/domain/repositories/accounts_repository.dart'
    as _i581;
import '../../features/accounts/domain/usecases/get_account_details_usecase.dart'
    as _i155;
import '../../features/accounts/domain/usecases/get_accounts_usecase.dart'
    as _i297;
import '../../features/accounts/infrastructure/datasources/accounts_remote_data_source.dart'
    as _i811;
import '../../features/accounts/infrastructure/repositories/accounts_repository_impl.dart'
    as _i148;
import '../../features/accounts/presentation/bloc/account_details_bloc.dart'
    as _i126;
import '../../features/accounts/presentation/bloc/accounts_bloc.dart' as _i103;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/infrastructure/datasources/auth_remote_data_source.dart'
    as _i703;
import '../../features/auth/infrastructure/repositories/auth_repository_impl.dart'
    as _i748;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/cards/domain/repositories/cards_repository.dart'
    as _i314;
import '../../features/cards/domain/usecases/get_card_details_usecase.dart'
    as _i348;
import '../../features/cards/domain/usecases/get_cards_usecase.dart' as _i630;
import '../../features/cards/infrastructure/datasources/cards_remote_data_source.dart'
    as _i845;
import '../../features/cards/infrastructure/repositories/cards_repository_impl.dart'
    as _i763;
import '../../features/cards/presentation/bloc/card_details_bloc.dart' as _i465;
import '../../features/cards/presentation/bloc/cards_bloc.dart' as _i981;
import '../../features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i665;
import '../../features/dashboard/domain/usecases/get_dashboard_usecase.dart'
    as _i803;
import '../../features/dashboard/infrastructure/datasources/dashboard_remote_data_source.dart'
    as _i833;
import '../../features/dashboard/infrastructure/repositories/dashboard_repository_impl.dart'
    as _i367;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i965;
import '../../features/profile/infrastructure/datasources/profile_remote_data_source.dart'
    as _i467;
import '../../features/profile/infrastructure/repositories/profile_repository_impl.dart'
    as _i244;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/transactions/domain/repositories/transactions_repository.dart'
    as _i956;
import '../../features/transactions/domain/usecases/get_transaction_details_usecase.dart'
    as _i1009;
import '../../features/transactions/domain/usecases/get_transactions_usecase.dart'
    as _i974;
import '../../features/transactions/infrastructure/datasources/transactions_remote_data_source.dart'
    as _i668;
import '../../features/transactions/infrastructure/repositories/transactions_repository_impl.dart'
    as _i680;
import '../../features/transactions/presentation/bloc/transaction_details_bloc.dart'
    as _i483;
import '../../features/transactions/presentation/bloc/transactions_bloc.dart'
    as _i439;
import '../deeplink/deep_link_coordinator.dart' as _i563;
import '../deeplink/deep_link_listener.dart' as _i0;
import '../deeplink/deep_link_navigator.dart' as _i424;
import '../deeplink/deep_link_parser.dart' as _i486;
import '../deeplink/pending_deep_link_store.dart' as _i993;
import '../domain/auth/auth_session.dart' as _i123;
import '../domain/auth/token_refresher.dart' as _i452;
import '../domain/auth/token_storage.dart' as _i600;
import '../infrastructure/notifications/notification_service.dart' as _i616;
import '../network/dio_client_factory.dart' as _i277;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/interceptors/logging_interceptor.dart' as _i344;
import '../network/token_refresh_service.dart' as _i837;
import '../presentation/app.dart' as _i316;
import '../router/app_router.dart' as _i81;
import '../router/route_analytics_observer.dart' as _i66;
import '../storage/secure_token_storage.dart' as _i535;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i148;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i486.DeepLinkParser>(() => _i486.DeepLinkParser());
    gh.lazySingleton<_i993.PendingDeepLinkStore>(
      () => _i993.PendingDeepLinkStore(),
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage(),
    );
    gh.lazySingleton<_i123.AuthSession>(() => _i123.AuthSession());
    gh.lazySingleton<_i344.LoggingInterceptor>(
      () => _i344.LoggingInterceptor(),
    );
    gh.lazySingleton<_i66.RouteAnalyticsObserver>(
      () => _i66.RouteAnalyticsObserver(),
    );
    gh.lazySingleton<_i81.AppRouter>(
      () => _i81.AppRouter(
        gh<_i123.AuthSession>(),
        gh<_i993.PendingDeepLinkStore>(),
        gh<_i66.RouteAnalyticsObserver>(),
      ),
    );
    gh.lazySingleton<_i424.DeepLinkNavigator>(
      () => _i424.GoRouterDeepLinkNavigator(gh<_i81.AppRouter>()),
    );
    gh.lazySingleton<_i277.DioClientFactory>(
      () => _i277.DioClientFactory(gh<_i344.LoggingInterceptor>()),
    );
    gh.lazySingleton<_i600.TokenStorage>(
      () => _i535.SecureTokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.authDio(gh<_i277.DioClientFactory>()),
      instanceName: 'auth',
    );
    gh.lazySingleton<_i452.TokenRefresher>(
      () => _i837.TokenRefreshService(
        gh<_i361.Dio>(instanceName: 'auth'),
        gh<_i600.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(
        dio: gh<_i361.Dio>(instanceName: 'auth'),
        tokenStorage: gh<_i600.TokenStorage>(),
        tokenRefresher: gh<_i452.TokenRefresher>(),
      ),
    );
    gh.lazySingleton<_i563.DeepLinkCoordinator>(
      () => _i563.DeepLinkCoordinator(
        gh<_i123.AuthSession>(),
        gh<_i993.PendingDeepLinkStore>(),
        gh<_i486.DeepLinkParser>(),
        gh<_i424.DeepLinkNavigator>(),
        gh<_i81.AppRouter>(),
      ),
    );
    gh.lazySingleton<_i0.DeepLinkListener>(
      () => _i0.DeepLinkListener(gh<_i563.DeepLinkCoordinator>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i616.NotificationService>(
      () => _i616.NotificationService(gh<_i563.DeepLinkCoordinator>()),
    );
    gh.lazySingleton<_i316.FintechApp>(
      () => _i316.FintechApp(gh<_i81.AppRouter>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.apiDio(
        gh<_i277.DioClientFactory>(),
        gh<_i745.AuthInterceptor>(),
      ),
      instanceName: 'api',
    );
    gh.lazySingleton<_i833.DashboardRemoteDataSource>(
      () => _i833.DashboardRemoteDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'api'),
      ),
    );
    gh.lazySingleton<_i703.AuthRemoteDataSource>(
      () => _i703.AuthRemoteDataSourceImpl(gh<_i361.Dio>(instanceName: 'api')),
    );
    gh.lazySingleton<_i467.ProfileRemoteDataSource>(
      () =>
          _i467.ProfileRemoteDataSourceImpl(gh<_i361.Dio>(instanceName: 'api')),
    );
    gh.lazySingleton<_i811.AccountsRemoteDataSource>(
      () => _i811.AccountsRemoteDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'api'),
      ),
    );
    gh.lazySingleton<_i845.CardsRemoteDataSource>(
      () => _i845.CardsRemoteDataSourceImpl(gh<_i361.Dio>(instanceName: 'api')),
    );
    gh.lazySingleton<_i668.TransactionsRemoteDataSource>(
      () => _i668.TransactionsRemoteDataSourceImpl(
        gh<_i361.Dio>(instanceName: 'api'),
      ),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i244.ProfileRepositoryImpl(gh<_i467.ProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i748.AuthRepositoryImpl(
        gh<_i703.AuthRemoteDataSource>(),
        gh<_i600.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i665.DashboardRepository>(
      () =>
          _i367.DashboardRepositoryImpl(gh<_i833.DashboardRemoteDataSource>()),
    );
    gh.lazySingleton<_i581.AccountsRepository>(
      () => _i148.AccountsRepositoryImpl(gh<_i811.AccountsRemoteDataSource>()),
    );
    gh.lazySingleton<_i956.TransactionsRepository>(
      () => _i680.TransactionsRepositoryImpl(
        gh<_i668.TransactionsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1009.GetTransactionDetailsUseCase>(
      () => _i1009.GetTransactionDetailsUseCase(
        gh<_i956.TransactionsRepository>(),
      ),
    );
    gh.lazySingleton<_i974.GetTransactionsUseCase>(
      () => _i974.GetTransactionsUseCase(gh<_i956.TransactionsRepository>()),
    );
    gh.lazySingleton<_i314.CardsRepository>(
      () => _i763.CardsRepositoryImpl(gh<_i845.CardsRemoteDataSource>()),
    );
    gh.factory<_i439.TransactionsBloc>(
      () => _i439.TransactionsBloc(gh<_i974.GetTransactionsUseCase>()),
    );
    gh.lazySingleton<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(
        gh<_i787.AuthRepository>(),
        gh<_i123.AuthSession>(),
      ),
    );
    gh.lazySingleton<_i965.GetProfileUseCase>(
      () => _i965.GetProfileUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.lazySingleton<_i803.GetDashboardUseCase>(
      () => _i803.GetDashboardUseCase(gh<_i665.DashboardRepository>()),
    );
    gh.lazySingleton<_i155.GetAccountDetailsUseCase>(
      () => _i155.GetAccountDetailsUseCase(gh<_i581.AccountsRepository>()),
    );
    gh.lazySingleton<_i297.GetAccountsUseCase>(
      () => _i297.GetAccountsUseCase(gh<_i581.AccountsRepository>()),
    );
    gh.lazySingleton<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factoryParam<_i483.TransactionDetailsBloc, String, dynamic>(
      (_transactionId, _) => _i483.TransactionDetailsBloc(
        gh<_i1009.GetTransactionDetailsUseCase>(),
        _transactionId,
      ),
    );
    gh.factoryParam<_i126.AccountDetailsBloc, String, dynamic>(
      (_accountId, _) => _i126.AccountDetailsBloc(
        gh<_i155.GetAccountDetailsUseCase>(),
        _accountId,
      ),
    );
    gh.factory<_i103.AccountsBloc>(
      () => _i103.AccountsBloc(gh<_i297.GetAccountsUseCase>()),
    );
    gh.lazySingleton<_i348.GetCardDetailsUseCase>(
      () => _i348.GetCardDetailsUseCase(gh<_i314.CardsRepository>()),
    );
    gh.lazySingleton<_i630.GetCardsUseCase>(
      () => _i630.GetCardsUseCase(gh<_i314.CardsRepository>()),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(gh<_i803.GetDashboardUseCase>()),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i600.TokenStorage>(),
        gh<_i123.AuthSession>(),
        gh<_i563.DeepLinkCoordinator>(),
      ),
    );
    gh.factory<_i469.ProfileBloc>(
      () => _i469.ProfileBloc(
        gh<_i965.GetProfileUseCase>(),
        gh<_i48.LogoutUseCase>(),
      ),
    );
    gh.factory<_i981.CardsBloc>(
      () => _i981.CardsBloc(gh<_i630.GetCardsUseCase>()),
    );
    gh.factoryParam<_i465.CardDetailsBloc, String, dynamic>(
      (_cardId, _) =>
          _i465.CardDetailsBloc(gh<_i348.GetCardDetailsUseCase>(), _cardId),
    );
    return this;
  }
}

class _$StorageModule extends _i148.StorageModule {}

class _$NetworkModule extends _i851.NetworkModule {}
