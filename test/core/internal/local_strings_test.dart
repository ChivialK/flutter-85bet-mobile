import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';

import 'local_strings_test_widget.dart';

class MockLocalStrings extends Mock implements LocalStrings {}

void main() {
  MockLocalStrings mockLocalStrings;

  setUp(() {
    mockLocalStrings = MockLocalStrings();
  });

  test("Locale setting doesn't verify the core locale", () {
    var cn = Intl('zh_CN');
    expect(cn.locale, equals('zh_CN'));
  });

  test('DateFormat creation does verify the locale', () {
    initializeDateFormatting('zh_CN', null).then((_) {
      var cn = Intl('zh_CN');
      var format = cn.date().add_d();
      expect(format.locale, equals('zh_CN'));
    });
  });

  test('test locale string resource access creation', () {
    var localeStr = mockLocalStrings.res;
    print(localeStr.hashCode);
  });

  testWidgets('test localize app widget state', (WidgetTester tester) async {
    MaterialApp app = MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Column(
        children: <Widget>[
          Text('Username'),
        ],
      ),
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(find.text('Username'), findsOneWidget);
  });

  testWidgets('test localize app widget with [default(en)]',
      (WidgetTester tester) async {
    MaterialApp app = MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: LocaleTestWidget(false),
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('test localize app widget with [zh]',
      (WidgetTester tester) async {
    MaterialApp app = MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: LocaleTestWidget(true),
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(find.text('首页'), findsOneWidget);
  });
}
