import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_handler.dart';
import 'package:flutter_85bet_mobile/template/mobx/data/models/template_model.dart';
import 'package:flutter_85bet_mobile/template/mobx/data/source/template_api.dart';
import 'package:meta/meta.dart' show required;

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> testApi();
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  final DioApiService dioApiService;
  final tag = 'MemberRemoteDataSource';
  String token = '';

  TemplateRemoteDataSourceImpl({@required this.dioApiService});

  @override
  Future<TemplateModel> testApi() async {
    return await requestModel<TemplateModel>(
      request: dioApiService.get(TemplateApi.GET_VIP_PIC),
      jsonToModel: TemplateModel.jsonToModel,
      tag: 'remote-TEMP',
    ).then(
      (result) => result.fold(
        (failure) => TemplateModel(),
        (data) => data,
      ),
    );
  }
}
