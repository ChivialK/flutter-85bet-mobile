import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'device_test_widget.dart';

void main() {
  testWidgets('test device class', (WidgetTester tester) async {
    MaterialApp app = MaterialApp(
      home: DeviceTestWidget(),
    );
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
  });
}



