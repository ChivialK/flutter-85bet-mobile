import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/template/mobx/data/source/template_data_source.dart';

abstract class TemplateRepository {
  Future<String> fetchString();
}

class TemplateRepositoryImpl implements TemplateRepository {
  final tag = 'TemplateRepository';
  final TemplateRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TemplateRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<String> fetchString() async {
    final connected = await networkInfo.isConnected;
    print('network connected: $connected');
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 3),
      () => 'fetch success',
    );
//    if (connected) {
//      final result = await handleResponse<TemplateModel>(
//          remoteDataSource.testApi();
//      return result.fold(
//          (failure) => 'failure',
//          (model) => 'data fetched',
//          );
//    }
//    return 'network failure';
  }
}
