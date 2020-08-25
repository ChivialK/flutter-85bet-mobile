import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/member/data/repository/member_jwt_interface.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/event_model.dart';
import 'package:meta/meta.dart' show required;

class EventApi {
  static const String GET_EVENT = "api/showActive";
  static const String POST_SIGN = "api/memSign";

  static const String GET_NEW_MESSAGE_COUNT = 'api/stationCount';
}

abstract class EventRepository {
  Future<Either<Failure, bool>> checkNewMessage();
  Future<Either<Failure, EventModel>> getEvent();
  Future<Either<Failure, RequestCodeModel>> signEvent(int eventId, int prize);
}

class EventRepositoryImpl implements EventRepository {
  final DioApiService dioApiService;
  final MemberJwtInterface jwtInterface;
  final tag = 'EventRepository';
  bool jwtChecked = false;

  EventRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.value(jwtInterface.checkJwt('/'))
        .then((value) => jwtChecked = value.isSuccess);
  }

  @override
  Future<Either<Failure, bool>> checkNewMessage() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(EventApi.GET_NEW_MESSAGE_COUNT),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-EVENT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false) return Right(false);
        Map<String, dynamic> data = model.data;
        if (data != null && data.containsKey('count') && data['count'] > 0)
          return Right(true);
        else
          return Right(false);
      },
    );
  }

  @override
  Future<Either<Failure, EventModel>> getEvent() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(EventApi.GET_EVENT),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-EVENT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false) return Left(Failure.event());
        if (model.data != null)
          return Right(EventModel.jsonToEventModel(model.data));
        else
          return Right(EventModel(hasData: false));
      },
    );
  }

  @override
  Future<Either<Failure, RequestCodeModel>> signEvent(
      int eventId, int prize) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        EventApi.POST_SIGN,
        data: {'aid': eventId, 'prize': prize},
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-EVENT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
