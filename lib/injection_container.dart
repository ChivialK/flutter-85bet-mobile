import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_api_service.dart';
import 'core/network/util/network_info.dart';
import 'features/event/event_inject.dart';
import 'features/router/app_global_streams.dart';
import 'features/routes/home/home_inject.dart';
import 'features/routes/member/member_inject.dart';
import 'features/routes/promo/promo_inject.dart';
import 'features/routes/subfeatures/accountcenter/center_inject.dart';
import 'features/routes/subfeatures/balance/balance_inject.dart';
import 'features/routes/subfeatures/bankcard/bankcard_inject.dart';
import 'features/routes/subfeatures/betrecord/bet_record_inject.dart';
import 'features/routes/subfeatures/deals/deals_inject.dart';
import 'features/routes/subfeatures/deposit/deposit_inject.dart';
import 'features/routes/subfeatures/message/message_inject.dart';
import 'features/routes/subfeatures/notice/notice_inject.dart';
import 'features/routes/subfeatures/rollback/rollback_inject.dart';
import 'features/routes/subfeatures/service/presentation/state/service_store.dart';
import 'features/routes/subfeatures/transactions/transaction_inject.dart';
import 'features/routes/subfeatures/transfer/transfer_inject.dart';
import 'features/routes/subfeatures/viplevel/vip_level_inject.dart';
import 'features/routes/subfeatures/wallet/wallet_inject.dart';
import 'features/screen/web_game_screen_store.dart';
import 'features/themes/theme_settings.dart';
import 'features/update/update_inject.dart';
import 'features/user/user_repo_inject.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// App User
  sl.registerLazySingleton<AppGlobalStreams>(() => AppGlobalStreams());
  sl.registerLazySingleton<ThemeSettings>(() => ThemeSettings());

  /// Core
  sl.registerLazySingleton(() => DioApiService());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External Package
  sl.registerSingleton(() => MyLogger());
  sl.registerLazySingleton(() => DataConnectionChecker());

  /// Repository
  sl.registerLazySingleton<UpdateRepository>(
    () => UpdateRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<HomeLocalStorage>(
    () => HomeLocalStorageImpl(),
  );
  sl.registerLazySingleton<JwtInterface>(
    () => JwtInterfaceImpl(dioApiService: sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
        dioApiService: sl(),
        jwtInterface: sl(),
        networkInfo: sl(),
        localStorage: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<UserInfoRepository>(
    () => UserInfoRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<PromoLocalStorage>(
    () => PromoLocalStorageImpl(),
  );
  sl.registerLazySingleton<PromoRepository>(
    () => PromoRepositoryImpl(
        dioApiService: sl(), localStorage: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<DepositRepository>(
    () => DepositRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<TransferRepository>(
    () => TransferRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<BankcardRepository>(
    () => BankcardRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<WithdrawRepository>(
    () => WithdrawRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<BalanceRepository>(
    () => BalanceRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<WalletRepository>(
    () => WalletRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<MessageRepository>(
    () => MessageRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<CenterRepository>(
    () => CenterRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<BetRecordRepository>(
    () => BetRecordRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<DealsRepository>(
    () => DealsRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  sl.registerLazySingleton<RollbackRepository>(
    () => RollbackRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  );
  // sl.registerLazySingleton<AgentRepository>(
  //   () => AgentRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  // );
  sl.registerLazySingleton<NoticeRepository>(
    () => NoticeRepositoryImpl(dioApiService: sl()),
  );
  sl.registerLazySingleton<VipLevelRepository>(
    () => VipLevelRepositoryImpl(dioApiService: sl()),
  );
  // sl.registerLazySingleton<StoreRepository>(
  //   () => StoreRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  // );
  // sl.registerLazySingleton<RollerRepository>(
  //   () => RollerRepositoryImpl(dioApiService: sl(), jwtInterface: sl()),
  // );

  /// Mobx Store
  sl.registerLazySingleton<WebGameScreenStore>(
    () => WebGameScreenStore(),
  );
  sl.registerLazySingleton(
    () => UpdateStore(sl<UpdateRepository>()),
  );
  sl.registerLazySingleton(
    () => EventStore(sl<EventRepository>(), sl<UserInfoRepository>()),
  );
  sl.registerLazySingleton(
    () => HomeStore(sl<HomeRepository>()),
  );
  sl.registerFactory(
    () => LoginStore(sl<UserRepository>()),
  );
  sl.registerFactory(
    () => RegisterStore(sl<UserRepository>()),
  );
  sl.registerFactory(
    () => PromoStore(sl<PromoRepository>()),
  );
  sl.registerFactory(
    () => MemberCreditStore(sl<UserInfoRepository>()),
  );
  sl.registerFactory(
    () => DepositStore(sl<DepositRepository>()),
  );
  sl.registerFactory(
    () => TransferStore(sl<TransferRepository>()),
  );
  sl.registerFactory(
    () => BankcardStore(sl<BankcardRepository>()),
  );
  sl.registerFactory(
    () => WithdrawStore(sl<WithdrawRepository>()),
  );
  sl.registerFactory(
    () => BalanceStore(sl<BalanceRepository>(), sl<UserInfoRepository>()),
  );
  sl.registerFactory(
    () => WalletStore(sl<WalletRepository>()),
  );
  sl.registerFactory(
    () => MessageStore(sl<MessageRepository>()),
  );
  sl.registerFactory(
    () => CenterStore(sl<CenterRepository>()),
  );
  sl.registerFactory(
    () => TransactionStore(sl<TransactionRepository>()),
  );
  sl.registerFactory(
    () => BetRecordStore(sl<BetRecordRepository>()),
  );
  sl.registerFactory(
    () => DealsStore(sl<DealsRepository>()),
  );
  sl.registerFactory(
    () => RollbackStore(sl<RollbackRepository>()),
  );
  // sl.registerLazySingleton(
  //   () => AgentStore(sl<AgentRepository>()),
  // );
  sl.registerFactory(
    () => NoticeStore(sl<NoticeRepository>()),
  );
  sl.registerFactory(
    () => VipLevelStore(sl<VipLevelRepository>()),
  );
  // sl.registerFactory(
  //   () => PointStore(sl<StoreRepository>()),
  // );
  // sl.registerFactory(
  //   () => RollerStore(sl<RollerRepository>()),
  // );
  sl.registerLazySingleton(
    () => ServiceStore(sl<EventRepository>()),
  );
}
