import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/notice/data/models/notice_model.dart';
import 'package:meta/meta.dart' show required;

class NoticeApi {
  static const String POST_REMIND = "api/getRemind";
}

abstract class NoticeRepository {
  Future<Either<Failure, NoticeModel>> getRemind();
}

class NoticeRepositoryImpl implements NoticeRepository {
  final DioApiService dioApiService;
  final tag = 'NoticeRepository';

  NoticeRepositoryImpl({@required this.dioApiService});

  @override
  Future<Either<Failure, NoticeModel>> getRemind() async {
    final result = await requestModel<NoticeModel>(
      request: dioApiService.post(NoticeApi.POST_REMIND),
      jsonToModel: NoticeModel.jsonToNoticeModel,
      tag: 'remote-NOTICE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
