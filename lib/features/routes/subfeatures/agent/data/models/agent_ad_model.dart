import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_ad_model.freezed.dart';

@freezed
abstract class AgentAdModel with _$AgentAdModel {
  const factory AgentAdModel({
    int id,
    String pic,
    String content,
    String status,
  }) = _AgentAdModel;

  static AgentAdModel jsonToAgentAdModel(Map<String, dynamic> jsonMap) {
    return _$_AgentAdModel(
      id: jsonMap['id'] as int,
      pic: jsonMap['pic'] as String,
      content: jsonMap['content'] as String,
      status: jsonMap['status'] as String,
    );
  }
}
