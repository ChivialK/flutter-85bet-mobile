import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../models/message_model.dart';

class MessageApi {
  static const String GET_STATION = "api/station";
  static const String GET_READ_STATUS = "api/stationCheck";
}

abstract class MessageRepository {
  Future<Either<Failure, List<MessageModel>>> getMessageList();

  Future<Either<Failure, RequestCodeModel>> updateMessageStatus(int id);
}

class MessageRepositoryImpl implements MessageRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'MessageRepository';

  MessageRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, List<MessageModel>>> getMessageList() async {
    final result = await requestModelList<MessageModel>(
      request: dioApiService.get(MessageApi.GET_STATION),
      jsonToModel: MessageModel.jsonToMessageModel,
      tag: 'remote-MESSAGE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }

  @override
  Future<Either<Failure, RequestCodeModel>> updateMessageStatus(int id) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(MessageApi.GET_READ_STATUS, data: {'rid': id}),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-MESSAGE_STATUS',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
