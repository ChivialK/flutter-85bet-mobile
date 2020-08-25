import 'dart:convert';

import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/event_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('user/event/event.json'));
  final map2 = json.decode(fixture('user/event/event_no_sign.json'));
  final map3 = json.decode(fixture('user/event/event_signed.json'));

  test('test decode event data', () {
    print('\nmap: $map');
    print('\n\n');

    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
    print('decode to model:\n$codeModel');
    print('\n\n');

    EventData data = EventData.jsonToEventData(codeModel.data['0']);
    print('decoded event:\n$data');
    print('\n\n');

    EventSignData signData =
        EventSignData.jsonToEventSignData(codeModel.data['signData']);
    print('decoded sign:\n$signData');
    print('\n\n');
  });

  test('test event model(no sign data)', () {
    print('\nmap2: $map2');
    print('\n\n');

    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map2);
    print('decode to model:\n$codeModel');
    print('\n\n');

    EventModel event = EventModel.jsonToEventModel(codeModel.data);
    print('decoded event(no sign data):\n$event');
    print('\n');
    expect(event.hasEvent, true);
    expect(event.showDialog(1), true);
  });

  test('test event model', () {
    print('\nmap: $map');
    print('\n\n');

    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
    print('decode to model:\n$codeModel');
    print('\n\n');

    EventModel event = EventModel.jsonToEventModel(codeModel.data);
    print('decoded event:\n$event');
    print('\n');
    print('is valid event: ${event.eventData.isValidEvent(1)}');
    print('has sign event: ${event.signData.hasSigned}');
    expect(event.hasEvent, true);
    expect(event.showDialog(1), true);
  });

  test('test event model(signed)', () {
    print('\nmap3: $map3');
    print('\n\n');

    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map3);
    print('decode to model:\n$codeModel');
    print('\n\n');

    EventModel event = EventModel.jsonToEventModel(codeModel.data);
    print('decoded event(no sign data):\n$event');
    print('\n');
    print('is valid event: ${event.eventData.isValidEvent(1)}');
    print('has sign event: ${event.signData.hasSigned}');
    expect(event.hasEvent, true);
    expect(event.showDialog(1), false);
  });
}
