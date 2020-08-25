import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/generated/l10n.dart';

class LocaleTestWidget extends StatefulWidget {
  final bool changeLang;

  LocaleTestWidget(this.changeLang);

  @override
  _LocaleTestWidgetState createState() => _LocaleTestWidgetState();
}

class _LocaleTestWidgetState extends State<LocaleTestWidget> {
  @override
  void initState() {
    if (widget.changeLang) super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.changeLang) {
      return FutureBuilder(
          future: Future.wait([S.load(Locale('zh', '')).then((value) => true)]),
          builder: (context, snapshot) {
            var localeText = S.of(context).pageTitleHome;
            print('locale text: $localeText');
            return Text(localeText);
          });
    } else {
      var localeText = S.of(context).pageTitleHome;
      print('locale text: $localeText');
      return Text(localeText);
    }
  }
}
