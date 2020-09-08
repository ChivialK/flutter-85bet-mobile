import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  factory MessageModel({
    String date,
    String msg,
    int id,
    String status,
    String title,
  }) = _MessageModel;

  static MessageModel jsonToMessageModel(Map<String, dynamic> jsonMap) {
    return _$_MessageModel(
      date: jsonMap['cdate'] as String,
      msg: jsonMap['msg'] as String,
      id: jsonMap['rid'] as int,
      status: jsonMap['status'] as String,
      title: jsonMap['title'] as String,
    );
  }

  @late
  bool get isRead => status == '1';
}
