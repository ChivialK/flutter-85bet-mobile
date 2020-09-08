//import 'package:dartz/dartz.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter_85bet_mobile/core/error/failures.dart';
//import 'package:flutter_85bet_mobile/core/network/util/network_info.dart';
//import 'package:flutter_85bet_mobile/features/home/data/models/entities.dart';
//import 'package:flutter_85bet_mobile/features/home/data/models/game_types_freezed.dart';
//import 'package:flutter_85bet_mobile/features/home/data/models/models.dart';
//import 'package:flutter_85bet_mobile/features/home/data/repository/home_repository_impl.dart';
//import 'package:flutter_85bet_mobile/features/home/data/source/home_local_data_source.dart';
//import 'package:flutter_85bet_mobile/features/home/data/source/home_remote_data_source.dart';
//import 'package:mockito/mockito.dart';
//
//class MockRemoteDataSource extends Mock implements HomeRemoteDataSource {}
//
//class MockLocalDataSource extends Mock implements HomeLocalDataSource {}
//
//class MockNetworkInfo extends Mock implements NetworkInfo {}
//
//void main() {
//  HomeRepositoryImpl repository;
//  MockRemoteDataSource mockRemoteDataSource;
//  MockLocalDataSource mockLocalDataSource;
//  MockNetworkInfo mockNetworkInfo;
//
//  setUp(() {
//    mockRemoteDataSource = MockRemoteDataSource();
//    mockLocalDataSource = MockLocalDataSource();
//    mockNetworkInfo = MockNetworkInfo();
//    repository = HomeRepositoryImpl(
//      remoteDataSource: mockRemoteDataSource,
//      localDataSource: mockLocalDataSource,
//      networkInfo: mockNetworkInfo,
//    );
//  });
//
//  void runTestsOnline(Function body) {
//    group('device is online', () {
//      setUp(() {
//        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//      });
//      body();
//    });
//  }
//
//  void runTestsOffline(Function body) {
//    group('device is offline', () {
//      setUp(() {
//        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
//      });
//      body();
//    });
//  }
//
//  group('getBanners', () {
//    // DATA FOR THE MOCKS AND ASSERTIONS
//    final BannerModel bannerInfoModel = BannerModel(
//        id: 1,
//        type: "image/jpeg",
//        title: "23456781",
//        url: "456456",
//        urlBlank: true,
//        mobileUrl: "456456456",
//        pic: "images/banner/pc/292.jpg",
//        picMobile: "images/banner/mobile/291.jpg",
//        startTime: "2019-07-17 00:00:00",
//        endTime: "2029-07-11 09:39:00",
//        status: true,
//        sort: 8);
//
//    final List<BannerEntity> bannerInfo = [bannerInfoModel].map((model) {
//      return model.entity;
//    }).toList();
//
//    runTestsOnline(() {
//      test(
//          'should return remote data when the call to remote data source is successful',
//          () async {
//        // arrange
//        when(mockRemoteDataSource.getBanners())
//            .thenAnswer((_) async => [bannerInfoModel]);
//        // act
//        final result = await repository.getBanners();
//        final item = result.getOrElse(null);
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        verify(mockRemoteDataSource.getBanners());
//        expect(item, equals(bannerInfo));
//      });
//    });
//
//    runTestsOffline(() {
//      test(
//          'should return local cache data when the call to remote data source is unsuccessful',
//          () async {
//        // arrange
//        when(mockLocalDataSource.getCachedBanners())
//            .thenAnswer((_) async => bannerInfo);
//        // act
//        final result = await repository.getBanners();
//        final item = result.getOrElse(null);
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        expect(item, equals(bannerInfo));
//      });
//
//      test(
//          'should return network failure when the call to remote data source is unsuccessful and no cache data',
//          () async {
//        // arrange
//        when(mockLocalDataSource.getCachedBanners())
//            .thenAnswer((_) async => []);
//        // act
//        final result = await repository.getBanners();
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        expect(result.length(), equals(0));
//        expect(result, equals(Left(Failure.network())));
//      });
//    });
//  });
//
//  group('getMarquees', () {
//    // DATA FOR THE MOCKS AND ASSERTIONS
//    final MarqueeModel marqueeModel = MarqueeModel(
//      id: 2,
//      content:
//          "尊敬的会员，目前快捷支付、微信支付维护中，公司提供银行入款、支付宝支付、在线支付、银联扫码、虚拟货币，请会员多多参考以上充值方式唷～TEST",
//      url: "https://www.baidu.com/",
//      createdAt: "2019-04-10",
//      updatedAt: "2019-09-24",
//      showDate: "0000-00-00",
//    );
//
//    final MarqueeModelList marqueeModelList = MarqueeModelList(
//      marquees: [marqueeModel],
//      speed: 20,
//    );
//
//    final MarqueeEntity marqueeEntity = MarqueeEntity(
//      id: 2,
//      content:
//          "尊敬的会员，目前快捷支付、微信支付维护中，公司提供银行入款、支付宝支付、在线支付、银联扫码、虚拟货币，请会员多多参考以上充值方式唷～TEST",
//      url: "https://www.baidu.com/",
//    );
//
//    runTestsOnline(() {
//      test(
//          'should return remote data when the call to remote data source is successful',
//          () async {
//        // arrange
//        when(mockRemoteDataSource.getMarquees())
//            .thenAnswer((_) async => marqueeModelList);
//        // act
//        final result = await repository.getMarquees();
//        final item = result.getOrElse(null);
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        verify(mockRemoteDataSource.getMarquees());
//        expect(item, equals([marqueeEntity]));
//      });
//    });
//
//    runTestsOffline(() {
////      test(
////          'should return local cache data when the call to remote data source is unsuccessful',
////          () async {
////        // arrange
////        when(mockLocalDataSource.getCachedMarquees())
////            .thenAnswer((_) async => [marqueeEntity]);
////        // act
////        final result = await repository.getMarquees();
////        final item = result.getOrElse(null);
////        // assert
////        verify(mockNetworkInfo.isConnected);
////        expect(item, equals([marqueeEntity]));
////      });
//
//      test(
//          'should return network failure when the call to remote data source is unsuccessful and no cache data',
//          () async {
//        // arrange
////        when(mockLocalDataSource.getCachedMarquees())
////            .thenAnswer((_) async => []);
//        // act
//        final result = await repository.getMarquees();
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        expect(result.length(), equals(0));
//        expect(result, equals(Left(Failure.network())));
//      });
//    });
//  });
//
//  group('getGameTypes', () {
//    // DATA FOR THE MOCKS AND ASSERTIONS
//    final GameCategoryModel categoryModel =
//        GameCategoryModel(type: "casino", ch: "真人");
//
//    final GamePlatformModel platformModel = GamePlatformModel(
//      site: "eg",
//      site2: "EG",
//      ch: "EG casino",
//      category: "casino",
//      cid: 1,
//      status: "1",
//      sort: 1,
//      className: "eg-casino",
//    );
//
//    final GamePlatformEntity platformEntity = GamePlatformEntity(
//      site: "eg",
//      ch: "EG casino",
//      category: "casino",
//      className: "eg-casino",
//    );
//
//    final GameTypes typesModel = GameTypes(
//      categories: [categoryModel],
//      platforms: [platformModel],
//    );
//
//    final GameTypes typesEntity = GameTypes(
//      categories: [categoryModel],
//      platforms: [platformEntity],
//    );
//
//    runTestsOnline(() {
//      test(
//          'should return remote data when the call to remote data source is successful',
//          () async {
//        // arrange
//        when(mockRemoteDataSource.getGameTypes())
//            .thenAnswer((_) async => typesModel);
//        // act
//        final result = await repository.getGameTypes();
//        final item = result.getOrElse(null);
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        verify(mockRemoteDataSource.getGameTypes());
//        expect(item, equals(typesEntity));
//      });
//    });
//
//    runTestsOffline(() {
//      test(
//          'should return local cache data when the call to remote data source is unsuccessful',
//          () async {
//        // arrange
//        when(mockLocalDataSource.getCachedGameTypes())
//            .thenAnswer((_) async => typesEntity);
//        // act
//        final result = await repository.getGameTypes();
//        final item = result.getOrElse(null);
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        expect(item, equals(typesEntity));
//      });
//
//      test(
//          'should return network failure when the call to remote data source is unsuccessful and no cache data',
//          () async {
//        // arrange
//        when(mockLocalDataSource.getCachedGameTypes())
//            .thenAnswer((_) async => null);
//        // act
//        final result = await repository.getGameTypes();
//        // assert
//        verify(mockNetworkInfo.isConnected);
//        expect(result, equals(Left(Failure.network())));
//      });
//    });
//  });
//}
